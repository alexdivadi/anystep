import 'dart:math';

import 'package:anystep/core/features/reports/domain/volunteer_hours_report.dart';
import 'package:anystep/core/features/user_events/data/user_event_repository.dart';
import 'package:anystep/core/features/user_events/domain/user_event.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'volunteer_hours_providers.g.dart';

/// Raw list of user events (with embedded event & user) for a date range.
/// We request both user and event models from repository.
@riverpod
Future<List<UserEventModel>> userEventsInRange(
  Ref ref, {
  required DateTime start,
  required DateTime end,
}) async {
  // NOTE: user_event records reference events; we need to filter by event date.
  // Backend filtering on joined tables may not be supported directly; fetch pages until done.
  // For simplicity we fetch pages until there are no more. This could be optimized with backend support.
  final repo = ref.watch(userEventRepositoryProvider);
  final List<UserEventModel> results = [];
  int page = 0;
  while (true) {
    final pageResult = await repo.paginatedList(
      limit: UserEventRepository.pageSize,
      page: page,
      // We can't filter by event start_time directly unless backend supports it.
      // So we fetch and filter client-side. (Assumption)
      withEvents: true,
      withUsers: true,
    );
    final filtered = pageResult.items.where((ue) {
      final ev = ue.event;
      if (ev == null) return false;
      return !(ev.endTime.isBefore(start) || ev.startTime.isAfter(end));
    });
    results.addAll(filtered);
    final fetchedAll = (page + 1) * UserEventRepository.pageSize >= pageResult.totalCount;
    if (fetchedAll) break;
    page++;
  }
  return results;
}

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
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
    final durationHours = event.endTime.difference(event.startTime).inMinutes / 60.0;
    // Cap per event at 8 hours (assumption: per event/day). If multi-day events exist, treat full duration, still capped at 8.
    final double capped = min(8.0, durationHours.clamp(0, double.infinity));
    final key = user.id;
    final ym =
        "${event.startTime.year.toString().padLeft(4, '0')}-${event.startTime.month.toString().padLeft(2, '0')}";
    map.putIfAbsent(key, () => _Accumulator(user));
    final acc = map[key]!;
    acc.totalHours += capped;
    acc.eventsCount += 1;
    acc.hoursPerMonth.update(ym, (value) => value + capped, ifAbsent: () => capped);
  }
  final reports =
      map.values
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
