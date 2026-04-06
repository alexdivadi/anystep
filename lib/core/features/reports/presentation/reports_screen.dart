import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/snackbar_message.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'dart:convert';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/reports/data/volunteer_hours_providers.dart';
import 'package:anystep/core/features/reports/domain/volunteer_hours_report.dart';
import 'package:anystep/core/features/reports/presentation/report_detail_screen.dart';
import 'package:anystep/core/features/reports/presentation/volunteer_hours_report_table_cell.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:go_router/go_router.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  static const path = '/reports';
  static const pathAdmin = '/admin/reports';

  static const name = 'reports';
  static const nameAdmin = 'admin-reports';

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  late DateTime _start;
  late DateTime _end;
  bool _custom = false;
  bool _isSearching = false;
  String _query = '';
  final _dateFmt = DateFormat('MMM d, yyyy');
  _ReportSort _sort = _ReportSort.hoursDesc;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _start = DateTime(now.year, now.month, 1);
    _end = now;
  }

  Future<void> _pickRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: DateTimeRange(start: _start, end: _end),
    );
    if (picked != null) {
      setState(() {
        _start = picked.start;
        _end = picked.end;
        _custom = true;
      });
    }
  }

  void _setYtd() {
    final now = DateTime.now();
    setState(() {
      _start = DateTime(now.year, 1, 1);
      _end = now;
      _custom = false;
    });
  }

  void _setMonth() {
    final now = DateTime.now();
    setState(() {
      _start = DateTime(now.year, now.month, 1);
      _end = now;
      _custom = false;
    });
  }

  Future<void> _exportCsv(List<VolunteerHoursReport> reports) async {
    if (reports.isEmpty) return;
    try {
      // Build CSV
      final buffer = StringBuffer();
      buffer.writeln('Volunteer,Address,Email,Phone,Events,TotalHours');
      for (final r in reports) {
        final name = r.user.fullName.replaceAll('"', '""');
        buffer.writeln(
          '"$name","${(r.user.address?.formattedAddress ?? '').replaceAll(',', ' ')}","${r.user.email}","${r.user.phoneNumber ?? ''}",${r.eventsCount},${r.totalHours.toStringAsFixed(2)}',
        );
      }
      final csv = buffer.toString();

      // File name includes selected date range
      final rangeFmt = DateFormat('yyyyMMdd');
      final filename = 'volunteer_hours_${rangeFmt.format(_start)}_${rangeFmt.format(_end)}.csv';

      // Share as an in-memory file (no storage permission needed)
      final xfile = XFile.fromData(utf8.encode(csv), mimeType: 'text/csv', name: filename);

      final res = await SharePlus.instance.share(
        ShareParams(
          files: [xfile],
          text: 'Volunteer report for ${_dateFmt.format(_start)} to ${_dateFmt.format(_end)}',
          subject: 'Volunteer Hours Report',
        ),
      );
      PostHogManager.capture(
        'report_exported',
        properties: <String, Object>{
          'dateRange': '${_dateFmt.format(_start)} → ${_dateFmt.format(_end)}',
          'custom': _custom,
          'filename': filename,
          'method': res.status == ShareResultStatus.success ? 'shared' : 'dismissed',
        },
      );

      if (mounted && res.status == ShareResultStatus.success) {
        context.showSuccessSnackbar('Report shared successfully!');
      }
    } catch (e) {
      // Make sure dialog is closed on error
      if (mounted) {
        context.showErrorSnackbar('Failed to export: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncReports = ref.watch(volunteerHoursAggregateProvider(start: _start, end: _end));
    final isMonthSelected = !_custom && _start.day == 1 && _start.month == DateTime.now().month;
    final isYtdSelected = !_custom && _start.month == 1 && _start.day == 1;
    final loc = AppLocalizations.of(context);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(
        title: Text(loc.reportsTitle),
        actions: [
          PopupMenuButton<_ReportSort>(
            tooltip: 'Sort',
            icon: const Icon(Icons.sort),
            onSelected: (value) => setState(() => _sort = value),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: _ReportSort.hoursDesc,
                child: Text('Hours (High → Low)'),
              ),
              PopupMenuItem(
                value: _ReportSort.hoursAsc,
                child: Text('Hours (Low → High)'),
              ),
              PopupMenuItem(
                value: _ReportSort.lastNameAsc,
                child: Text('Last name (A → Z)'),
              ),
              PopupMenuItem(
                value: _ReportSort.lastNameDesc,
                child: Text('Last name (Z → A)'),
              ),
            ],
          ),
          asyncReports.when(
            data: (reports) => IconButton(
              tooltip: loc.exportCsv,
              onPressed: reports.isEmpty ? null : () => _exportCsv(reports),
              icon: const Icon(Icons.download),
            ),
            loading: () => IconButton(onPressed: null, icon: const Icon(Icons.download)),
            error: (e, st) => IconButton(onPressed: null, icon: const Icon(Icons.error_outline)),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(AnyStepSpacing.xl56),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  child: AnyStepSearchBar(
                    hintText: loc.searchReports,
                    initialValue: _query,
                    onChanged: (value) => setState(() => _query = value),
                    onFocusChanged: (focused) =>
                        setState(() => _isSearching = focused || _query.isNotEmpty),
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) {
                  final offsetAnim = animation.drive(
                    Tween<Offset>(begin: const Offset(0.3, 0), end: Offset.zero).chain(
                      CurveTween(curve: Curves.easeOut),
                    ),
                  );
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(position: offsetAnim, child: child),
                  );
                },
                child: _isSearching
                    ? Padding(
                        key: const ValueKey('cancel_btn'),
                        padding: const EdgeInsets.only(right: AnyStepSpacing.md16),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _query = '';
                              _isSearching = false;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Text(loc.cancel),
                        ),
                      )
                    : const SizedBox.shrink(key: ValueKey('cancel_btn_space')),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(userEventsInRangeProvider),
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _setMonth,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isMonthSelected ? AnyStepColors.blueBright : null,
                      foregroundColor: isMonthSelected ? Colors.white : null,
                    ),
                    child: Text(loc.rangeThisMonth),
                  ),
                  ElevatedButton(
                    onPressed: _setYtd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isYtdSelected ? AnyStepColors.blueBright : null,
                      foregroundColor: isYtdSelected ? Colors.white : null,
                    ),
                    child: Text(loc.rangeYtd),
                  ),
                  ElevatedButton(
                    onPressed: _pickRange,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _custom ? AnyStepColors.blueBright : null,
                      foregroundColor: _custom ? Colors.white : null,
                    ),
                    child: Text(loc.rangeCustom(_dateFmt.format(_start), _dateFmt.format(_end))),
                  ),
                ],
              ),
            ),
            // Data section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: asyncReports.when(
                data: (reports) {
                  final query = _query.trim().toLowerCase();
                  if (_isSearching && query.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: AnyStepSpacing.lg48),
                      child: Center(child: Text(loc.enterSearchTermReports)),
                    );
                  }
                  final filtered = query.isEmpty
                      ? reports
                      : reports.where((r) {
                          final name = r.user.fullName.toLowerCase();
                          final email = r.user.email.toLowerCase();
                          return name.contains(query) || email.contains(query);
                        }).toList();
                  if (filtered.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: AnyStepSpacing.lg48),
                      child: Center(
                        child: Text(query.isEmpty ? loc.noDataInRange : loc.noReportsFound),
                      ),
                    );
                  }
                  final sorted = [...filtered]..sort((a, b) => _compareReports(a, b, _sort));
                  // Condensed list view instead of wide horizontal DataTable
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: AnyStepSpacing.sm8),
                        child: Text(
                          loc.reportsCount(filtered.length),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ...sorted.map(
                        (r) => VolunteerHoursReportTableCell(
                          volunteerHoursReport: r,
                          onTap: () {
                            context.push(ReportDetailScreen.getPath(r.user.id, _start, _end));
                          },
                        ),
                      ),
                    ],
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48.0),
                  child: Center(child: AnyStepLoadingIndicator()),
                ),
                error: (e, st) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: Center(child: Text(loc.errorLoadingReports('$e'))),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

enum _ReportSort {
  hoursDesc,
  hoursAsc,
  lastNameAsc,
  lastNameDesc,
}

int _compareReports(
  VolunteerHoursReport a,
  VolunteerHoursReport b,
  _ReportSort sort,
) {
  int compareName() {
    final aLast = a.user.lastName.toLowerCase();
    final bLast = b.user.lastName.toLowerCase();
    final lastCompare = aLast.compareTo(bLast);
    if (lastCompare != 0) return lastCompare;
    final aFirst = a.user.firstName.toLowerCase();
    final bFirst = b.user.firstName.toLowerCase();
    return aFirst.compareTo(bFirst);
  }

  switch (sort) {
    case _ReportSort.hoursDesc:
      final byHours = b.totalHours.compareTo(a.totalHours);
      if (byHours != 0) return byHours;
      return compareName();
    case _ReportSort.hoursAsc:
      final byHours = a.totalHours.compareTo(b.totalHours);
      if (byHours != 0) return byHours;
      return compareName();
    case _ReportSort.lastNameAsc:
      final byName = compareName();
      if (byName != 0) return byName;
      return b.totalHours.compareTo(a.totalHours);
    case _ReportSort.lastNameDesc:
      final byName = compareName();
      if (byName != 0) return -byName;
      return b.totalHours.compareTo(a.totalHours);
  }
}
