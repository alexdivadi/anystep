import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form.dart';
import 'package:anystep/core/features/events/presentation/event_feed/past_events_carousel.dart';
import 'package:anystep/core/features/events/presentation/event_feed/upcoming_events_feed.dart';
import 'package:anystep/core/features/events/presentation/event_feed/search_events_feed.dart';
import 'package:anystep/core/features/events/presentation/event_feed/widgets/event_search_bar.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventFeedScreen extends ConsumerStatefulWidget {
  const EventFeedScreen({super.key});

  static const path = '/events';
  static const pathAnonymous = '/anonymous/events';
  static const pathAdmin = '/admin/events';

  @override
  ConsumerState<EventFeedScreen> createState() => _EventFeedScreenState();
}

class _EventFeedScreenState extends ConsumerState<EventFeedScreen> {
  bool isSearching = false;
  String q = '';

  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(authStateStreamProvider);
    final user = ref.watch(currentUserStreamProvider);
    final showLogin = !uid.isLoading && uid.hasValue && uid.value == null;
    final isAuthenticated = !user.isLoading && user.hasValue && user.value != null;
    final isAdmin = isAuthenticated && user.value!.role == UserRole.admin;

    return PopScope(
      onPopInvokedWithResult: (popped, result) async {
        if (isSearching) {
          setState(() {
            isSearching = false;
            q = '';
          });
          return; // prevent pop
        }
        if (context.mounted && context.canPop()) {
          context.pop(result);
        }
      },
      child: AnyStepScaffold(
        appBar: AnyStepAppBar(
          title: isAdmin ? const Text('Dashboard') : const Text('Event Feed'),
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(AnyStepSpacing.xl56),
            child: EventSearchBar(
              initialValue: q,
              onChanged: (value) => setState(() => q = value),
              onFocusChanged: (focused) => setState(() => isSearching = focused || q.isNotEmpty),
            ),
          ),
        ),
        body:
            isSearching
                ? SearchEventsFeed(search: q)
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isAuthenticated) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
                        child: Text(
                          'Recent Events',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(height: 250, child: PastEventsCarousel()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
                        child: Text(
                          'Upcoming Events',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                    const Expanded(child: UpcomingEventsFeed()),
                  ],
                ),

        floatingActionButton:
            !isSearching && isAuthenticated && user.value!.role.canCreateEvent
                ? FloatingActionButton.extended(
                  onPressed: () => context.showModal(const EventDetailForm()),
                  icon: const Icon(Icons.add),
                  label: const Text('Create Event'),
                )
                : null,
      ),
    );
  }
}
