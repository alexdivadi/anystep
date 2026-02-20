import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/constants/breakpoints.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/dashboard/presentation/widgets/dashboard_calendar_card.dart';
import 'package:anystep/core/features/dashboard/presentation/widgets/dashboard_metrics_card.dart';
import 'package:anystep/core/features/dashboard/presentation/widgets/dashboard_section_header.dart';
import 'package:anystep/core/features/dashboard/presentation/widgets/recent_events_list.dart';
import 'package:anystep/core/features/dashboard/presentation/widgets/upcoming_events_list.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/core/features/events/presentation/event_create/event_create_screen.dart';
import 'package:anystep/core/features/events/presentation/event_feed/widgets/search_events_feed.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/reports/data/volunteer_hours_providers.dart';
import 'package:anystep/core/config/remote_config/remote_config.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
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
  bool _welcomeChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowWelcomeMessage());
  }

  Future<void> _maybeShowWelcomeMessage() async {
    if (_welcomeChecked) return;
    _welcomeChecked = true;

    final prefs = await ref.read(appPreferencesProvider.future);
    if (prefs.getWelcomeMessageSeen()) return;

    final remoteConfig = await ref.read(remoteConfigProvider.future);
    final message = remoteConfig.welcomeMessage;
    if (message.isEmpty) return;
    if (!mounted) return;

    await prefs.setWelcomeMessageSeen();
    context.showModal(
      _WelcomeMessageModal(
        message: message,
        onDismissed: () async {
          if (context.mounted) {
            context.pop();
          }
        },
      ),
      isScrollControlled: true,
    );
  }

  Future<void> _refreshDashboard(bool includeReports) async {
    ref.invalidate(getEventsProvider);
    ref.invalidate(getUpcomingEventsProvider);
    ref.invalidate(getPastEventsProvider);
    if (includeReports) {
      ref.invalidate(userEventsInRangeProvider);
      ref.invalidate(volunteerHoursAggregateProvider);
      ref.invalidate(volunteerHoursSummaryThisMonthProvider);
      ref.invalidate(volunteerHoursSummaryYtdProvider);
      ref.invalidate(currentUserHoursSummaryThisMonthProvider);
      ref.invalidate(currentUserHoursSummaryYtdProvider);
      ref.invalidate(volunteerMonthlyHoursYtdProvider);
      ref.invalidate(currentUserMonthlyHoursYtdProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(authStateStreamProvider);
    final user = ref.watch(currentUserStreamProvider);
    final showLogin = !uid.isLoading && uid.hasValue && uid.value == null;
    final isAuthenticated = !user.isLoading && user.hasValue && user.value != null;
    final isAdmin = isAuthenticated && user.value!.role == UserRole.admin;
    final loc = AppLocalizations.of(context);
    final currentMonthSummary =
        isAuthenticated && !isAdmin ? ref.watch(currentUserHoursSummaryThisMonthProvider) : null;
    final currentYtdSummary =
        isAuthenticated && !isAdmin ? ref.watch(currentUserHoursSummaryYtdProvider) : null;
    final currentMonthlySeries =
        isAuthenticated && !isAdmin ? ref.watch(currentUserMonthlyHoursYtdProvider) : null;
    final adminMonthSummary =
        isAdmin ? ref.watch(volunteerHoursSummaryThisMonthProvider) : null;
    final adminYtdSummary = isAdmin ? ref.watch(volunteerHoursSummaryYtdProvider) : null;
    final adminMonthlySeries = isAdmin ? ref.watch(volunteerMonthlyHoursYtdProvider) : null;

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
            : LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= kDashboardGridBreakpoint;
                  final slivers = <Widget>[];

                  if (isAuthenticated && !isAdmin) {
                    final metricsCard = DashboardMetricsCard(
                      title: loc.dashboardYourVolunteering,
                      monthSummary: currentMonthSummary!,
                      ytdSummary: currentYtdSummary!,
                      monthlySeries: currentMonthlySeries!,
                      showVolunteers: false,
                    );
                    if (isWide) {
                      slivers.add(
                        _gridSection(
                          children: [
                            metricsCard,
                            const DashboardCalendarCard(),
                          ],
                          aspectRatio: 0.9,
                        ),
                      );
                    } else {
                      slivers.add(SliverToBoxAdapter(child: metricsCard));
                      slivers.add(
                        SliverToBoxAdapter(child: DashboardSectionHeader(title: loc.dashboardCalendar)),
                      );
                      slivers.add(const SliverToBoxAdapter(child: DashboardCalendarCard()));
                    }
                  }

                  if (isAdmin) {
                    final metricsCard = DashboardMetricsCard(
                      title: loc.dashboardVolunteerMetrics,
                      monthSummary: adminMonthSummary!,
                      ytdSummary: adminYtdSummary!,
                      monthlySeries: adminMonthlySeries!,
                      showVolunteers: true,
                    );
                    if (isWide) {
                      slivers.add(
                        _gridSection(
                          children: [
                            metricsCard,
                            const DashboardCalendarCard(),
                          ],
                          aspectRatio: 0.9,
                        ),
                      );
                    } else {
                      slivers.add(SliverToBoxAdapter(child: metricsCard));
                    }
                    slivers.add(
                      SliverToBoxAdapter(child: DashboardSectionHeader(title: loc.dashboardRecentEvents)),
                    );
                    slivers.add(const RecentEventsList(maxItems: 4));
                    if (!isWide) {
                      slivers.add(
                        SliverToBoxAdapter(child: DashboardSectionHeader(title: loc.dashboardCalendar)),
                      );
                      slivers.add(const SliverToBoxAdapter(child: DashboardCalendarCard()));
                    }
                  }

                  slivers.add(
                    SliverToBoxAdapter(child: DashboardSectionHeader(title: loc.dashboardUpcomingEvents)),
                  );
                  slivers.add(const UpcomingEventsList());

                  return RefreshIndicator(
                    onRefresh: () => _refreshDashboard(isAuthenticated),
                    child: CustomScrollView(slivers: slivers),
                  );
                },
              ),

        floatingActionButton: !isSearching && isAuthenticated && user.value!.role.canCreateEvent
            ? AnyStepFab(
                heroTag: 'create_event_fab',
                onPressed: () => context.push(CreateEventScreen.path),
                icon: Icons.add,
                tooltip: loc.createEvent,
              )
            : null,
      ),
    );
  }

  SliverPadding _gridSection({
    required List<Widget> children,
    double aspectRatio = 1.3,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: AnyStepSpacing.md16,
        vertical: AnyStepSpacing.sm8,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AnyStepSpacing.md16,
          crossAxisSpacing: AnyStepSpacing.md16,
          childAspectRatio: aspectRatio,
        ),
        delegate: SliverChildListDelegate(children),
      ),
    );
  }
}

class _WelcomeMessageModal extends StatelessWidget {
  const _WelcomeMessageModal({required this.message, required this.onDismissed});

  final String message;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AnyStepSpacing.md16),
      children: [
        Text(
          loc.welcomeMessageTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AnyStepSpacing.sm8),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: AnyStepSpacing.md24),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: onDismissed,
            child: Text(loc.welcomeMessageDismiss),
          ),
        ),
        const SizedBox(height: AnyStepSpacing.sm8),
      ],
    );
  }
}
