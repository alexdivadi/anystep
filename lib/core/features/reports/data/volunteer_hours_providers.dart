import 'dart:math';

import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/reports/domain/volunteer_hours_report.dart';
import 'package:anystep/core/features/user_events/data/user_event_repository.dart';
import 'package:anystep/core/features/user_events/domain/user_event.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/database/filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'volunteer_hours_providers.g.dart';

/// Raw list of user events (with embedded event & user) for a date range.
/// We request both user and event models from repository.
@riverpod
Future<List<UserEventModel>> userEventsInRange(
  Ref ref, {
  required DateTime start,
  required DateTime end,
  bool attendedOnly = true,
  String? userId,
}) async {
  // NOTE: user_event records reference events; we need to filter by event date.
  // Backend filtering on joined tables may not be supported directly; fetch pages until done.
  // For simplicity we fetch pages until there are no more. This could be optimized with backend support.
  final repo = ref.watch(userEventRepositoryProvider);
  return await repo.list(
    filters: [
      AnyStepFilter.greaterThan('event_model.start_time', start, inclusive: true),
      AnyStepFilter.lessThan('event_model.end_time', end, inclusive: true),
      AnyStepFilter.equals('event_model.is_volunteer_eligible', true),
      if (attendedOnly) AnyStepFilter.equals('attended', true),
      if (userId != null) AnyStepFilter.equals('user', userId),
    ],
    withEvents: true,
    withUsers: true,
    withUserAddresses: true,
  );
}

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
/// Uses check-in/check-out when available, otherwise falls back to event start/end.
@riverpod
Future<List<VolunteerHoursReport>> volunteerHoursAggregate(
  Ref ref, {
  required DateTime start,
  required DateTime end,
}) async {
  final userEvents = await ref.watch(userEventsInRangeProvider(start: start, end: end).future);
  final Map<String, _Accumulator> map = {};
  for (final ue in userEvents) {
    final user = ue.user;
    final event = ue.event;
    if (user == null || event == null) continue;
    final (durationHours, baseDate) = _hoursAndBaseDate(ue, start: start, end: end);
    // Cap per event at 8 hours (assumption: per event/day). If multi-day events exist, treat full duration, still capped at 8.
    final double capped = min(8.0, durationHours.clamp(0, double.infinity));
    final key = user.id;
    final ym =
        "${baseDate.year.toString().padLeft(4, '0')}-${baseDate.month.toString().padLeft(2, '0')}";
    map.putIfAbsent(key, () => _Accumulator(user));
    final acc = map[key]!;
    acc.totalHours += capped;
    acc.eventsCount += 1;
    acc.hoursPerMonth.update(ym, (value) => value + capped, ifAbsent: () => capped);
  }
  final reports = map.values
      .map(
        (a) => VolunteerHoursReport(
          user: a.user,
          totalHours: double.parse(a.totalHours.toStringAsFixed(2)),
          eventsCount: a.eventsCount,
          hoursPerMonth: a.hoursPerMonth.map(
            (k, v) => MapEntry(k, double.parse(v.toStringAsFixed(2))),
          ),
        ),
      )
      .toList();
  reports.sort((a, b) => b.totalHours.compareTo(a.totalHours));
  return reports;
}

/// Convenience provider: Year-to-date
@riverpod
Future<List<VolunteerHoursReport>> volunteerHoursYtd(Ref ref) async {
  final now = DateTime.now();
  final start = DateTime(now.year, 1, 1);
  return ref.watch(volunteerHoursAggregateProvider(start: start, end: now).future);
}

/// Convenience provider: Current month
@riverpod
Future<List<VolunteerHoursReport>> volunteerHoursThisMonth(Ref ref) async {
  final now = DateTime.now();
  final start = DateTime(now.year, now.month, 1);
  final end = DateTime(now.year, now.month + 1, 1).subtract(const Duration(seconds: 1));
  return ref.watch(volunteerHoursAggregateProvider(start: start, end: end).future);
}

class _Accumulator {
  _Accumulator(this.user);
  final UserModel user;
  double totalHours = 0;
  int eventsCount = 0;
  final Map<String, double> hoursPerMonth = {};
}

class VolunteerHoursSummary {
  const VolunteerHoursSummary({
    required this.totalHours,
    required this.eventsCount,
    required this.uniqueVolunteers,
  });

  final double totalHours;
  final int eventsCount;
  final int uniqueVolunteers;

  static const zero = VolunteerHoursSummary(totalHours: 0, eventsCount: 0, uniqueVolunteers: 0);
}

class MonthlyHoursPoint {
  const MonthlyHoursPoint({required this.month, required this.hours});

  final DateTime month;
  final double hours;
}

/// Returns (durationHours, baseDateForMonthBucket).
/// Duration is clamped to the report range and prefers check-in/out when available.
(double, DateTime) _hoursAndBaseDate(
  UserEventModel ue, {
  required DateTime start,
  required DateTime end,
}) {
  final event = ue.event!;
  DateTime rangeStart = event.startTime;
  DateTime rangeEnd = event.endTime;
  DateTime baseDate = event.startTime;

  if (ue.checkInAt != null && ue.checkOutAt != null) {
    rangeStart = ue.checkInAt!;
    rangeEnd = ue.checkOutAt!;
    baseDate = ue.checkInAt!;
  }

  if (rangeEnd.isBefore(rangeStart)) {
    return (0, baseDate);
  }

  final clampedStart = rangeStart.isBefore(start) ? start : rangeStart;
  final clampedEnd = rangeEnd.isAfter(end) ? end : rangeEnd;
  if (clampedEnd.isBefore(clampedStart)) {
    return (0, baseDate);
  }
  final durationHours = clampedEnd.difference(clampedStart).inMinutes / 60.0;
  return (durationHours, baseDate);
}

VolunteerHoursSummary _summaryFromReports(List<VolunteerHoursReport> reports) {
  final totalHours = reports.fold<double>(0, (sum, r) => sum + r.totalHours);
  final totalEvents = reports.fold<int>(0, (sum, r) => sum + r.eventsCount);
  return VolunteerHoursSummary(
    totalHours: double.parse(totalHours.toStringAsFixed(2)),
    eventsCount: totalEvents,
    uniqueVolunteers: reports.length,
  );
}

DateTime? _parseYearMonth(String ym) {
  final parts = ym.split('-');
  if (parts.length != 2) return null;
  final year = int.tryParse(parts[0]);
  final month = int.tryParse(parts[1]);
  if (year == null || month == null) return null;
  return DateTime(year, month);
}

List<MonthlyHoursPoint> _aggregateMonthlyHours(List<VolunteerHoursReport> reports) {
  final Map<String, double> totals = {};
  for (final report in reports) {
    report.hoursPerMonth.forEach((ym, hours) {
      totals.update(ym, (value) => value + hours, ifAbsent: () => hours);
    });
  }

  final points = <MonthlyHoursPoint>[];
  totals.forEach((ym, hours) {
    final dt = _parseYearMonth(ym);
    if (dt != null) {
      points.add(MonthlyHoursPoint(month: dt, hours: double.parse(hours.toStringAsFixed(2))));
    }
  });
  points.sort((a, b) => a.month.compareTo(b.month));
  return points;
}

List<MonthlyHoursPoint> _takeLastMonths(List<MonthlyHoursPoint> points, {int maxMonths = 6}) {
  if (points.length <= maxMonths) return points;
  return points.sublist(points.length - maxMonths);
}

@riverpod
Future<VolunteerHoursSummary> volunteerHoursSummaryThisMonth(Ref ref) async {
  final reports = await ref.watch(volunteerHoursThisMonthProvider.future);
  return _summaryFromReports(reports);
}

@riverpod
Future<VolunteerHoursSummary> volunteerHoursSummaryYtd(Ref ref) async {
  final reports = await ref.watch(volunteerHoursYtdProvider.future);
  return _summaryFromReports(reports);
}

@riverpod
Future<List<MonthlyHoursPoint>> volunteerMonthlyHoursYtd(Ref ref) async {
  final reports = await ref.watch(volunteerHoursYtdProvider.future);
  return _takeLastMonths(_aggregateMonthlyHours(reports));
}

@riverpod
Future<VolunteerHoursSummary> currentUserHoursSummaryThisMonth(Ref ref) async {
  final authState = await ref.watch(authStateStreamProvider.future);
  if (authState == null) return VolunteerHoursSummary.zero;
  final reports = await ref.watch(volunteerHoursThisMonthProvider.future);
  final match = reports.where((r) => r.user.id == authState.uid).toList();
  if (match.isEmpty) return VolunteerHoursSummary.zero;
  final totalHours = match.fold<double>(0, (sum, r) => sum + r.totalHours);
  final totalEvents = match.fold<int>(0, (sum, r) => sum + r.eventsCount);
  return VolunteerHoursSummary(
    totalHours: double.parse(totalHours.toStringAsFixed(2)),
    eventsCount: totalEvents,
    uniqueVolunteers: 1,
  );
}

@riverpod
Future<VolunteerHoursSummary> currentUserHoursSummaryYtd(Ref ref) async {
  final authState = await ref.watch(authStateStreamProvider.future);
  if (authState == null) return VolunteerHoursSummary.zero;
  final reports = await ref.watch(volunteerHoursYtdProvider.future);
  final match = reports.where((r) => r.user.id == authState.uid).toList();
  if (match.isEmpty) return VolunteerHoursSummary.zero;
  final totalHours = match.fold<double>(0, (sum, r) => sum + r.totalHours);
  final totalEvents = match.fold<int>(0, (sum, r) => sum + r.eventsCount);
  return VolunteerHoursSummary(
    totalHours: double.parse(totalHours.toStringAsFixed(2)),
    eventsCount: totalEvents,
    uniqueVolunteers: 1,
  );
}

@riverpod
Future<List<MonthlyHoursPoint>> currentUserMonthlyHoursYtd(Ref ref) async {
  final authState = await ref.watch(authStateStreamProvider.future);
  if (authState == null) return const [];
  final reports = await ref.watch(volunteerHoursYtdProvider.future);
  final match = reports.where((r) => r.user.id == authState.uid).toList();
  if (match.isEmpty) return const [];
  final points = _aggregateMonthlyHours(match);
  return _takeLastMonths(points);
}
