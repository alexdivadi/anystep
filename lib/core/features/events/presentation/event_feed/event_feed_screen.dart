import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/snackbar_message.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form.dart';
import 'package:anystep/core/features/events/presentation/event_feed/widgets/past_events_carousel.dart';
import 'package:anystep/core/features/events/presentation/event_feed/widgets/upcoming_events_feed.dart';
import 'package:anystep/core/features/events/presentation/event_feed/widgets/search_events_feed.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventFeedScreen extends ConsumerStatefulWidget {
  const EventFeedScreen({super.key});

  static const path = '/events';
  static const pathAnonymous = '/anonymous/events';
  static const pathAdmin = '/admin/events';

  static const name = 'events';
  static const nameAnonymous = 'anonymous-events';
  static const nameAdmin = 'admin-events';

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
    final loc = AppLocalizations.of(context);

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
          title: isAdmin ? Text(loc.dashboard) : Text(loc.eventFeed),
          actions: showLogin
              ? [
                  Padding(
                    padding: const EdgeInsets.all(AnyStepSpacing.md12),
                    child: InkWell(
                      onTap: () => context.go(LoginScreen.path),
                      child: Row(
                        children: [
                          const Icon(Icons.login),
                          const SizedBox(width: 8),
                          Text(loc.login),
                        ],
                      ),
                    ),
                  ),
                ]
              : null,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(AnyStepSpacing.xl56),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Search bar always takes remaining space.
                Expanded(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    child: AnyStepSearchBar(
                      hintText: loc.searchEvents,
                      initialValue: q,
                      onChanged: (value) => setState(() => q = value),
                      onFocusChanged: (focused) =>
                          setState(() => isSearching = focused || q.isNotEmpty),
                    ),
                  ),
                ),
                // Animated appearance from the right side.
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) {
                    final offsetAnim = animation.drive(
                      Tween<Offset>(
                        begin: const Offset(0.3, 0),
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeOut)),
                    );
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(position: offsetAnim, child: child),
                    );
                  },
                  child: isSearching
                      ? Padding(
                          key: const ValueKey('cancel_btn'),
                          padding: const EdgeInsets.only(right: AnyStepSpacing.md16),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                q = '';
                                isSearching = false;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Text(loc.cancel),
                          ),
                        )
                      : const SizedBox.shrink(key: ValueKey('cancel_btn_space')),
                ),
              ],
            ),
          ),
        ),
        body: isSearching
            ? SearchEventsFeed(search: q)
            : RefreshIndicator(
                onRefresh: () async => ref.invalidate(getEventsProvider),
                child: CustomScrollView(
                  slivers: [
                    if (isAuthenticated) ...[
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
                          child: Text(
                            loc.recentEvents,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          constraints: BoxConstraints(minHeight: 250, maxHeight: 275),
                          child: const PastEventsCarousel(),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
                          child: Text(
                            loc.upcomingEvents,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                    const UpcomingEventsFeed(),
                  ],
                ),
              ),

        floatingActionButton: !isSearching && isAuthenticated && user.value!.role.canCreateEvent
            ? FloatingActionButton.extended(
                heroTag: 'create_event_fab',
                onPressed: () => context.showModal(
                  EventDetailForm(
                    physics: const AlwaysScrollableScrollPhysics(),
                    onSuccess: () {
                      if (context.mounted) {
                        context.showSuccessSnackbar(loc.eventCreated);
                        context.pop();
                      }
                    },
                  ),
                ),
                icon: const Icon(Icons.add),
                label: Text(loc.createEvent),
              )
            : null,
      ),
    );
  }
}
