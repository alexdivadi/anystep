import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_error_widget.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_screen.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_card.dart';
import 'package:anystep/core/features/events/presentation/widgets/no_events_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// A sliver-only version of the upcoming events feed. All scrolling & pull-to-refresh
/// now live at a higher level (see `EventFeedScreen`).
class UpcomingEventsFeed extends ConsumerWidget {
  const UpcomingEventsFeed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstPageAsync = ref.watch(getUpcomingEventsProvider(page: 0));

    return firstPageAsync.when(
      // Initial loading state – show 6 shimmer placeholders separated by spacing.
      loading:
          () => SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, idx) {
                  if (idx.isOdd) return const SizedBox(height: AnyStepSpacing.sm8);
                  return const EventCardShimmer();
                },
                childCount: 6 * 2 - 1, // shimmer + separators
              ),
            ),
          ),
      // Error – fill remaining to allow pull-to-refresh from parent.
      error:
          (e, st) => const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: AnyStepErrorWidget()),
          ),
      // Data loaded
      data: (feedResult) {
        if (feedResult.items.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: NoEventsWidget()),
          );
        }

        final total = feedResult.totalCount;
        final childCount = total * 2 - 1; // include separators

        return SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, idx) {
              if (idx.isOdd) return const SizedBox(height: AnyStepSpacing.sm8);
              final logicalIndex = idx ~/ 2;
              final pageNum = logicalIndex ~/ EventRepository.pageSize;
              final indexInPage = logicalIndex % EventRepository.pageSize;

              final pageAsync = ref.watch(getUpcomingEventsProvider(page: pageNum));
              return pageAsync.when(
                loading: () => const EventCardShimmer(),
                error: (e, st) => const EventCardError(),
                data: (pageResult) {
                  if (indexInPage >= pageResult.items.length) {
                    // Safety net – if the page hasn't finished loading this index yet.
                    return const SizedBox.shrink();
                  }
                  final event = pageResult.items[indexInPage];
                  return EventCard(
                    event: event,
                    onTap: () => context.push(EventDetailScreen.getPath(event.id!)),
                  );
                },
              );
            }, childCount: childCount),
          ),
        );
      },
    );
  }
}
