import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/core/features/events/presentation/widgets/no_events_widget.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_card.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_card_shimmer.dart';
import 'event_feed_screen_controller.dart';

class EventFeedScreen extends ConsumerWidget {
  const EventFeedScreen({super.key});

  static const path = '/events';
  static const pathAnonymous = '/anonymous/events';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventFeedScreenControllerProvider);
    final uid = ref.watch(authStateStreamProvider);
    final user = ref.watch(currentUserStreamProvider);
    final showLogin = !uid.isLoading && uid.hasValue && uid.value == null;

    return AnyStepScaffold(
      appBar: AnyStepAppBar(
        title: const Text('Event Feed'),
        actions:
            showLogin
                ? [
                  Padding(
                    padding: const EdgeInsets.all(AnyStepSpacing.md12),
                    child: InkWell(
                      onTap: () => context.go(LoginScreen.path),
                      child: Row(
                        children: [
                          const Icon(Icons.login),
                          const SizedBox(width: 8),
                          const Text('Login'),
                        ],
                      ),
                    ),
                  ),
                ]
                : null,
      ),
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
                    .fetchEvents(pageNum: state.pageNum);
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
      floatingActionButton:
          user.hasValue && user.value != null && user.value!.role.canCreateEvent
              ? FloatingActionButton.extended(
                onPressed: () => context.pushNamed('create_event'),
                icon: const Icon(Icons.add),
                label: const Text('Create Event'),
              )
              : null,
    );
  }
}
