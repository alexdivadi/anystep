import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_shimmer.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_screen.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardCalendarCard extends ConsumerStatefulWidget {
  const DashboardCalendarCard({super.key});

  @override
  ConsumerState<DashboardCalendarCard> createState() => _DashboardCalendarCardState();
}

class _DashboardCalendarCardState extends ConsumerState<DashboardCalendarCard> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  DateTime _firstDayOfMonth(DateTime day) => DateTime(day.year, day.month, 1);

  DateTime _lastDayOfMonth(DateTime day) => DateTime(day.year, day.month + 1, 0, 23, 59, 59);

  @override
  Widget build(BuildContext context) {
    final start = _firstDayOfMonth(_focusedDay);
    final end = _lastDayOfMonth(_focusedDay);
    final eventsAsync = ref.watch(getEventsInRangeProvider(start: start, end: end));
    final loc = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AnyStepSpacing.md16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar<EventModel>(
                firstDay: DateTime.now().subtract(const Duration(days: 365)),
                lastDay: DateTime.now().add(const Duration(days: 365)),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                eventLoader: (day) {
                  final data = eventsAsync.value;
                  if (data == null) return const [];
                  final key = DateTime(day.year, day.month, day.day);
                  return data.where((event) {
                    return event.startTime.year == key.year &&
                        event.startTime.month == key.month &&
                        event.startTime.day == key.day;
                  }).toList();
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  setState(() => _focusedDay = focusedDay);
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withAlpha(80),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  markersMaxCount: 3,
                ),
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              const SizedBox(height: AnyStepSpacing.md12),
              eventsAsync.when(
                loading: () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    AnyStepShimmer(height: 16, width: 220),
                    SizedBox(height: AnyStepSpacing.sm8),
                    AnyStepShimmer(height: 16, width: 180),
                  ],
                ),
                error: (_, __) => Text(loc.failedToLoad),
                data: (events) {
                  final eventsByDay = <DateTime, List<EventModel>>{};
                  for (final event in events) {
                    final dateKey = DateTime(
                      event.startTime.year,
                      event.startTime.month,
                      event.startTime.day,
                    );
                    eventsByDay.putIfAbsent(dateKey, () => []).add(event);
                  }
                  final selected = _selectedDay ?? _focusedDay;
                  final selectedKey = DateTime(selected.year, selected.month, selected.day);
                  final selectedEvents = eventsByDay[selectedKey] ?? const [];

                  if (selectedEvents.isEmpty) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AnyStepSpacing.md12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(AnyStepSpacing.sm10),
                      ),
                      child: Text(
                        loc.dashboardNoEventsCalendar,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final event in selectedEvents.take(3))
                        Padding(
                          padding: const EdgeInsets.only(bottom: AnyStepSpacing.sm8),
                          child: _EventRow(event: event),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EventRow extends StatelessWidget {
  const _EventRow({required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final eventId = event.id;

    return InkWell(
      borderRadius: BorderRadius.circular(AnyStepSpacing.sm10),
      onTap: eventId == null ? null : () => context.push(EventDetailScreen.getPath(eventId)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AnyStepSpacing.sm8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AnyStepSpacing.sm4),
                Text(
                  '${event.startTime.toLocal().hour.toString().padLeft(2, '0')}:${event.startTime.toLocal().minute.toString().padLeft(2, '0')} • ${event.address?.city ?? ''}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
