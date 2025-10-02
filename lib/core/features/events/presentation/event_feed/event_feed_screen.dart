import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form.dart';
import 'package:anystep/core/features/events/presentation/screens.dart';
import 'package:anystep/core/features/events/presentation/widgets/no_events_widget.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_card.dart';

class EventFeedScreen extends ConsumerWidget {
  const EventFeedScreen({super.key});

  static const path = '/events';
  static const pathAnonymous = '/anonymous/events';
  static const pathAdmin = '/admin/events';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(getEventsProvider(page: 0));
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
              onRefresh: () async => ref.invalidate(getEventsProvider),
              child: ScrollableCenteredContent(child: AnyStepErrorWidget()),
            ),

        data: (feedResult) {
          final items = feedResult.items;
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(getEventsProvider),
            child:
                items.isEmpty
                    ? ScrollableCenteredContent(child: NoEventsWidget())
                    : ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
                      itemCount: feedResult.totalCount,
                      separatorBuilder: (_, __) => const SizedBox(height: AnyStepSpacing.sm8),
                      itemBuilder: (context, i) {
                        final pageNum = i ~/ EventRepository.pageSize;
                        final index = i % EventRepository.pageSize;

                        final eventsPage = ref.watch(getEventsProvider(page: pageNum));
                        return eventsPage.when(
                          loading: () => const EventCardShimmer(),
                          error: (e, st) => const EventCardError(),
                          data: (pageResult) {
                            final event = pageResult.items[index];
                            return EventCard(
                              event: event,
                              onTap: () => context.push(EventDetailScreen.getPath(event.id!)),
                            );
                          },
                        );
                      },
                    ),
          );
        },
      ),
      floatingActionButton:
          user.hasValue && user.value != null && user.value!.role.canCreateEvent
              ? FloatingActionButton.extended(
                onPressed: () => context.showModal(const EventDetailForm()),
                icon: const Icon(Icons.add),
                label: const Text('Create Event'),
              )
              : null,
    );
  }
}
