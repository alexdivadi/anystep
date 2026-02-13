import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/common/widgets/navigation/anystep_nav_items.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

Widget _invalidRouteIdScreen(BuildContext context) {
  final loc = AppLocalizations.of(context);
  return AnyStepScaffold(
    appBar: AnyStepAppBar(title: Text(loc.failedToLoad)),
    body: const ScrollableCenteredContent(child: AnyStepErrorWidget()),
  );
}

final routes = [
  GoRoute(
    path: LoginScreen.path,
    name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: SignUpScreen.path,
    name: SignUpScreen.name,
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: ForgotPasswordScreen.path,
    name: ForgotPasswordScreen.name,
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
  GoRoute(
    path: ResetPasswordScreen.path,
    name: ResetPasswordScreen.name,
    builder: (context, state) => const ResetPasswordScreen(),
  ),
  GoRoute(
    path: ConfirmEmailScreen.path,
    name: ConfirmEmailScreen.name,
    builder: (context, state) => const ConfirmEmailScreen(),
  ),
  GoRoute(
    path: EmailConfirmedScreen.path,
    name: EmailConfirmedScreen.name,
    builder: (context, state) => const EmailConfirmedScreen(),
  ),
  GoRoute(
    path: WelcomeScreen.path,
    name: WelcomeScreen.name,
    builder: (context, state) => const WelcomeScreen(),
  ),
  GoRoute(
    path: OnboardingScreen.path,
    name: OnboardingScreen.name,
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: UserOnboardedGate.path,
    name: UserOnboardedGate.name,
    pageBuilder: (context, state) {
      final redirectParam = state.uri.queryParameters['redirect'];
      final redirectPath =
          (redirectParam == null || redirectParam == '/') ? EventFeedScreen.pathAnonymous : redirectParam;
      return NoTransitionPage(child: UserOnboardedGate(redirect: redirectPath));
    },
  ),
  GoRoute(
    path: AppStartupLoadingWidget.path,
    name: AppStartupLoadingWidget.name,
    builder: (context, state) => const AppStartupLoadingWidget(),
  ),
  GoRoute(
    path: SignAgreementScreen.path,
    name: SignAgreementScreen.name,
    builder: (context, state) => const SignAgreementScreen(),
  ),

  // Unauthenticated Shell
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return UnauthenticatedNavigation(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        navigationShell: navigationShell,
      );
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: EventFeedScreen.pathAnonymous,
            name: EventFeedScreen.nameAnonymous,
            pageBuilder: (context, state) => NoTransitionPage(child: const EventFeedScreen()),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: SettingsScreen.pathAnonymous,
            name: SettingsScreen.nameAnonymous,
            pageBuilder: (context, state) => NoTransitionPage(child: const SettingsScreen()),
          ),
        ],
      ),
    ],
  ),

  // Volunteer Shell
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return VolunteerNavigation(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        navigationShell: navigationShell,
      );
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: EventFeedScreen.path,
            name: EventFeedScreen.name,
            pageBuilder: (context, state) => NoTransitionPage(child: const EventFeedScreen()),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: BlogChannelsScreen.path,
            name: BlogChannelsScreen.name,
            pageBuilder: (context, state) => NoTransitionPage(child: const BlogChannelsScreen()),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: SettingsScreen.path,
            name: SettingsScreen.name,
            pageBuilder: (context, state) => NoTransitionPage(child: const SettingsScreen()),
          ),
        ],
      ),
    ],
  ),

  // Admin Shell
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return AdminNavigation(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        navigationShell: navigationShell,
      );
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: EventFeedScreen.pathAdmin,
            name: EventFeedScreen.nameAdmin,
            pageBuilder: (context, state) => NoTransitionPage(child: const EventFeedScreen()),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: BlogChannelsScreen.pathAdmin,
            name: BlogChannelsScreen.nameAdmin,
            pageBuilder: (context, state) => NoTransitionPage(child: const BlogChannelsScreen()),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: ReportsScreen.pathAdmin,
            name: ReportsScreen.nameAdmin,
            pageBuilder: (context, state) => NoTransitionPage(child: const ReportsScreen()),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: SettingsScreen.pathAdmin,
            name: SettingsScreen.nameAdmin,
            pageBuilder: (context, state) => NoTransitionPage(child: const SettingsScreen()),
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    path: EventDetailScreen.path,
    name: EventDetailScreen.name,
    builder: (context, state) {
      final id = int.tryParse(state.pathParameters['id'] ?? '');
      if (id == null) return _invalidRouteIdScreen(context);
      return EventDetailScreen(id: id);
    },
  ),
  GoRoute(
    path: CreateChannelScreen.path,
    name: CreateChannelScreen.name,
    builder: (context, state) => const CreateChannelScreen(),
  ),
  GoRoute(
    path: BlogChannelDetailScreen.path,
    name: BlogChannelDetailScreen.name,
    builder: (context, state) {
      final id = int.tryParse(state.pathParameters['id'] ?? '');
      if (id == null) return _invalidRouteIdScreen(context);
      return BlogChannelDetailScreen(channelId: id);
    },
  ),
  GoRoute(
    path: ProfileScreen.path,
    name: ProfileScreen.name,
    builder: (context, state) => const ProfileScreen(),
  ),
];
