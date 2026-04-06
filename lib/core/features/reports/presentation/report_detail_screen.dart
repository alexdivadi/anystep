import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/format_hours.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_screen.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:anystep/core/features/reports/data/volunteer_hours_providers.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

final _reportUserProvider = FutureProvider.family((ref, String userId) {
  return ref.watch(userRepositoryProvider).get(documentId: userId);
});

class ReportDetailScreen extends ConsumerWidget {
  const ReportDetailScreen({
    super.key,
    required this.userId,
    required this.start,
    required this.end,
  });

  static const pathAdmin = '/admin/reports/:userId';
  static const nameAdmin = 'admin-report-detail';

  static String getPath(String userId, DateTime start, DateTime end) {
    final startMs = start.millisecondsSinceEpoch;
    final endMs = end.millisecondsSinceEpoch;
    return '/admin/reports/$userId?start=$startMs&end=$endMs';
  }

  final String userId;
  final DateTime start;
  final DateTime end;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context);
    final userAsync = ref.watch(_reportUserProvider(userId));
    final reportsAsync = ref.watch(volunteerHoursAggregateProvider(start: start, end: end));
    final eventsAsync = ref.watch(
      userEventsInRangeProvider(start: start, end: end, userId: userId, attendedOnly: true),
    );
    final theme = Theme.of(context);

    return AnyStepScaffold(
      appBar: AnyStepAppBar(
        title: userAsync.when(
          data: (user) => Text(user.fullName),
          loading: () => Text(loc.reportsTitle),
          error: (_, __) => Text(loc.reportsTitle),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        children: [
          userAsync.when(
            loading: () => const _UserHeaderShimmer(),
            error: (_, __) => Text(loc.failedToLoad),
            data: (user) {
              final phone = user.phoneNumber;
              final rangeLabel =
                  '${DateFormat('MMM d, yyyy').format(start)} → ${DateFormat('MMM d, yyyy').format(end)}';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileImage(user: user, size: 28),
                      const SizedBox(width: AnyStepSpacing.sm8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: AnyStepSpacing.sm4,
                              runSpacing: AnyStepSpacing.sm2,
                              children: [
                                AnyStepBadge(
                                  color: switch (user.role) {
                                    UserRole.admin => theme.colorScheme.tertiary,
                                    UserRole.board => theme.colorScheme.secondary,
                                    UserRole.volunteer => theme.colorScheme.primary,
                                  },
                                  child: Text(
                                    user.role.displayName,
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                          color: theme.colorScheme.onSecondary,
                                        ),
                                  ),
                                ),
                                if (user.ageGroup == AgeGroup.under18)
                                  AnyStepBadge(
                                    color: AnyStepColors.warning,
                                    child: Text(
                                      'Under 18',
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                            color: AnyStepColors.black,
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                            if (user.canReceiveEmail)
                              Text(
                                user.email,
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            if (phone != null && phone.isNotEmpty)
                              Text(
                                phone,
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AnyStepSpacing.sm6),
                  Text(
                    rangeLabel,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: AnyStepSpacing.md16),
          reportsAsync.when(
            loading: () => const _MetricsShimmerRow(),
            error: (_, __) => Text(loc.failedToLoad),
            data: (reports) {
              final report = reports.where((r) => r.user.id == userId).toList();
              final totalHours = report.isEmpty ? 0 : report.first.totalHours;
              final totalEvents = report.isEmpty ? 0 : report.first.eventsCount;
              return Row(
                children: [
                  Expanded(
                    child: _MetricCard(
                      label: loc.reportTotalHours,
                      value: totalHours.toStringAsFixed(2),
                    ),
                  ),
                  const SizedBox(width: AnyStepSpacing.sm8),
                  Expanded(
                    child: _MetricCard(label: loc.reportTotalEvents, value: totalEvents.toString()),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: AnyStepSpacing.md16),
          Text(loc.eventsAttended, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AnyStepSpacing.sm8),
          eventsAsync.when(
            loading: () => const _EventsListShimmer(),
            error: (_, __) => Text(loc.failedToLoad),
            data: (userEvents) {
              final items = userEvents.where((ue) => ue.event != null).toList()
                ..sort((a, b) => b.event!.startTime.compareTo(a.event!.startTime));
              if (items.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
                  child: Text(loc.reportNoEvents),
                );
              }
              final dateFmt = DateFormat('MMM d, yyyy • h:mm a');
              return Column(
                children: [
                  for (final ue in items)
                    Builder(
                      builder: (context) {
                        final hours = volunteerHoursForUserEvent(ue, start: start, end: end);
                        final hoursFormatted = formatHours(hours, maxDecimals: 2);
                        final hoursLabel = '$hoursFormatted hr${hoursFormatted == '1' ? '' : 's'}';
                        return Card(
                          child: ListTile(
                            title: Text(ue.event!.name),
                            subtitle: Text(
                              '${dateFmt.format(ue.event!.startTime.toLocal())} • $hoursLabel',
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              final id = ue.event!.id;
                              if (id == null) return;
                              context.push(EventDetailScreen.getPath(id));
                            },
                          ),
                        );
                      },
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _UserHeaderShimmer extends StatelessWidget {
  const _UserHeaderShimmer();

  @override
  Widget build(BuildContext context) {
    return const AnyStepShimmer(height: 16, width: 220);
  }
}

class _MetricsShimmerRow extends StatelessWidget {
  const _MetricsShimmerRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: AnyStepShimmer(height: 72)),
        SizedBox(width: AnyStepSpacing.sm8),
        Expanded(child: AnyStepShimmer(height: 72)),
      ],
    );
  }
}

class _EventsListShimmer extends StatelessWidget {
  const _EventsListShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _EventRowShimmer(),
        SizedBox(height: AnyStepSpacing.sm8),
        _EventRowShimmer(),
        SizedBox(height: AnyStepSpacing.sm8),
        _EventRowShimmer(),
      ],
    );
  }
}

class _EventRowShimmer extends StatelessWidget {
  const _EventRowShimmer();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AnyStepSpacing.md16,
          vertical: AnyStepSpacing.md12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AnyStepShimmer(height: 16, width: 220),
            SizedBox(height: AnyStepSpacing.sm6),
            AnyStepShimmer(height: 12, width: 160),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AnyStepSpacing.md12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(80),
        borderRadius: BorderRadius.circular(AnyStepSpacing.md12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: AnyStepSpacing.sm4),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
