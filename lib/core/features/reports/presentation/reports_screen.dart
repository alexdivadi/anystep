import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'dart:convert';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/reports/data/volunteer_hours_providers.dart';
import 'package:anystep/core/features/reports/domain/volunteer_hours_report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

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
  final _dateFmt = DateFormat('MMM d, yyyy');

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
      buffer.writeln('Volunteer,Events,TotalHours');
      for (final r in reports) {
        final name = r.user.fullName.replaceAll('"', '""');
        buffer.writeln('"$name",${r.eventsCount},${r.totalHours.toStringAsFixed(2)}');
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
        properties: {
          'dateRange': '${_dateFmt.format(_start)} → ${_dateFmt.format(_end)}',
          'custom': _custom,
          'filename': filename,
          'method': res.status == ShareResultStatus.success ? 'shared' : 'dismissed',
        },
      );
    } catch (e) {
      // Make sure dialog is closed on error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to export: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncReports = ref.watch(volunteerHoursAggregateProvider(start: _start, end: _end));
    final isMonthSelected = !_custom && _start.day == 1 && _start.month == DateTime.now().month;
    final isYtdSelected = !_custom && _start.month == 1 && _start.day == 1;
    return AnyStepScaffold(
      appBar: AnyStepAppBar(
        title: const Text('Volunteer Reports'),
        actions: [
          asyncReports.when(
            data:
                (reports) => IconButton(
                  tooltip: 'Export CSV',
                  onPressed: reports.isEmpty ? null : () => _exportCsv(reports),
                  icon: const Icon(Icons.download),
                ),
            loading: () => IconButton(onPressed: null, icon: const Icon(Icons.download)),
            error: (e, st) => IconButton(onPressed: null, icon: const Icon(Icons.error_outline)),
          ),
        ],
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
                    child: const Text('This Month'),
                  ),
                  ElevatedButton(
                    onPressed: _setYtd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isYtdSelected ? AnyStepColors.blueBright : null,
                      foregroundColor: isYtdSelected ? Colors.white : null,
                    ),
                    child: const Text('YTD'),
                  ),
                  ElevatedButton(
                    onPressed: _pickRange,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _custom ? AnyStepColors.blueBright : null,
                      foregroundColor: _custom ? Colors.white : null,
                    ),
                    child: Text('Custom: ${_dateFmt.format(_start)} → ${_dateFmt.format(_end)}'),
                  ),
                ],
              ),
            ),
            // Data section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: asyncReports.when(
                data: (reports) {
                  if (reports.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 48.0),
                      child: Center(child: Text('No data in selected range')),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Volunteer')),
                        DataColumn(label: Text('Events')),
                        DataColumn(label: Text('Total Hours')),
                      ],
                      rows:
                          reports
                              .map(
                                (r) => DataRow(
                                  cells: [
                                    DataCell(Text(r.user.fullName)),
                                    DataCell(Text(r.eventsCount.toString())),
                                    DataCell(Text(r.totalHours.toStringAsFixed(2))),
                                  ],
                                ),
                              )
                              .toList(),
                    ),
                  );
                },
                loading:
                    () => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 48.0),
                      child: Center(child: AnyStepLoadingIndicator()),
                    ),
                error:
                    (e, st) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48.0),
                      child: Center(child: Text('Error loading reports: $e')),
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
