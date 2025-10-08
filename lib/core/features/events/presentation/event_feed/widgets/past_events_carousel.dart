import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_screen.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_card.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_carousel_card.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_carousel_card_shimmer.dart';
import 'package:anystep/core/features/events/presentation/widgets/no_events_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PastEventsCarousel extends ConsumerWidget {
  const PastEventsCarousel({super.key, this.numItems = 3});

  final int numItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(getPastEventsProvider(page: 0));
    return eventsAsync.when(
      loading:
          () => ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              vertical: AnyStepSpacing.md12,
              horizontal: AnyStepSpacing.sm8,
            ),
            itemCount: numItems,
            separatorBuilder: (_, __) => const SizedBox(width: AnyStepSpacing.sm8),
            itemBuilder: (_, __) => const EventCarouselCardShimmer(),
          ),
      error: (e, st) {
        Log.e('Error loading past events', e, st);
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            vertical: AnyStepSpacing.md12,
            horizontal: AnyStepSpacing.sm8,
          ),
          itemCount: numItems,
          separatorBuilder: (_, __) => const SizedBox(width: AnyStepSpacing.sm8),
          itemBuilder: (_, __) => const EventCarouselCardShimmer(),
        );
      },
      data: (feedResult) {
        final items = feedResult.items;
        return items.isEmpty
            ? Center(child: NoEventsWidget())
            : ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                vertical: AnyStepSpacing.md12,
                horizontal: AnyStepSpacing.sm8,
              ),
              itemCount: feedResult.totalCount,
              separatorBuilder: (_, __) => const SizedBox(width: AnyStepSpacing.sm8),
              itemBuilder: (context, i) {
                final pageNum = i ~/ EventRepository.pageSize;
                final index = i % EventRepository.pageSize;

                final eventsPage = ref.watch(getPastEventsProvider(page: pageNum));
                return eventsPage.when(
                  loading: () => const EventCarouselCardShimmer(),
                  error: (e, st) => const EventCardError(),
                  data: (pageResult) {
                    final event = pageResult.items[index];
                    return EventCarouselCard(
                      event: event,
                      onTap: () => context.push(EventDetailScreen.getPath(event.id!)),
                    );
                  },
                );
              },
            );
      },
    );
  }
}
