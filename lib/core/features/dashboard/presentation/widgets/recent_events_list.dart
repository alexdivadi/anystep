import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_screen.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_card.dart';
import 'package:anystep/core/features/events/presentation/widgets/no_events_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RecentEventsList extends ConsumerWidget {
  const RecentEventsList({super.key, this.maxItems = 3});

  final int maxItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(getPastEventsProvider(page: 0));

    return eventsAsync.when(
      loading: () => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md12),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, idx) {
            if (idx.isOdd) return const SizedBox(height: AnyStepSpacing.sm8);
            return const EventCardShimmer();
          }, childCount: maxItems * 2 - 1),
        ),
      ),
      error: (e, st) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
          child: const EventCardError(),
        ),
      ),
      data: (feedResult) {
        final items = feedResult.items.take(maxItems).toList();
        if (items.isEmpty) {
          return const SliverToBoxAdapter(child: NoEventsWidget());
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md12),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, idx) {
              if (idx.isOdd) return const SizedBox(height: AnyStepSpacing.sm8);
              final index = idx ~/ 2;
              final event = items[index];
              return EventCard(
                event: event,
                onTap: () => context.push(EventDetailScreen.getPath(event.id!)),
              );
            }, childCount: items.length * 2 - 1),
          ),
        );
      },
    );
  }
}
