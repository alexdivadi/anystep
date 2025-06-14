import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/common/widgets/any_step_error_widget.dart';
import 'package:anystep/core/common/widgets/scrollable_centered_content.dart';
import 'package:anystep/core/features/events/presentation/widgets/no_events_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/event_card.dart';
import '../widgets/event_card_shimmer.dart';
import 'event_feed_screen_controller.dart';

class EventFeedScreen extends ConsumerWidget {
  const EventFeedScreen({super.key});

  static const path = '/events';
  static const name = 'events';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventFeedScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Event Feed')),
      body: eventsAsync.when(
        loading:
            () => ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
              itemCount: 6,
              separatorBuilder: (_, __) => const SizedBox(height: AnyStepSpacing.sm8),
              itemBuilder: (_, __) => const EventCardShimmer(),
            ),
        error:
            (e, st) => RefreshIndicator(
              onRefresh: ref.read(eventFeedScreenControllerProvider.notifier).refresh,
              child: ScrollableCenteredContent(child: AnyStepErrorWidget()),
            ),

        data: (state) {
          final items = state.items;
          final isLoadingMore = eventsAsync.isLoading;
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  notification.metrics.pixels >= notification.metrics.maxScrollExtent - 100 &&
                  !isLoadingMore &&
                  state.page.isNotEmpty) {
                ref
                    .read(eventFeedScreenControllerProvider.notifier)
                    .fetchEvents(lastId: state.lastId);
              }
              return false;
            },
            child: RefreshIndicator(
              onRefresh: ref.read(eventFeedScreenControllerProvider.notifier).refresh,
              child:
                  state.items.isEmpty
                      ? ScrollableCenteredContent(child: NoEventsWidget())
                      : ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
                        itemCount: items.length + (state.page.isNotEmpty ? 1 : 0),
                        separatorBuilder: (_, __) => const SizedBox(height: AnyStepSpacing.sm8),
                        itemBuilder: (context, i) {
                          if (i == items.length) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(child: CircularProgressIndicator.adaptive()),
                            );
                          }
                          final event = items[i];
                          return EventCard(event: event);
                        },
                      ),
            ),
          );
        },
      ),
    );
  }
}
