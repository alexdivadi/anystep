import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:anystep/core/common/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

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
    path: ConfirmEmailScreen.path,
    name: ConfirmEmailScreen.name,
    builder: (context, state) => const ConfirmEmailScreen(),
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
      final redirectParam = state.uri.queryParameters['redirect'] ?? EventFeedScreen.path;
      return NoTransitionPage(child: UserOnboardedGate(redirect: redirectParam));
    },
  ),
  GoRoute(
    path: AppStartupLoadingWidget.path,
    name: AppStartupLoadingWidget.name,
    builder: (context, state) => const AppStartupLoadingWidget(),
  ),

  // Unauthenticated Shell
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: UnauthenticatedNavBar(
          currentIndex: navigationShell.currentIndex,
          onTap: navigationShell.goBranch,
        ),
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
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: VolunteerNavBar(
          currentIndex: navigationShell.currentIndex,
          onTap: navigationShell.goBranch,
        ),
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
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: AdminNavBar(
          currentIndex: navigationShell.currentIndex,
          onTap: navigationShell.goBranch,
        ),
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
      return EventDetailScreen(id: id!);
    },
  ),
  GoRoute(
    path: ProfileScreen.path,
    name: ProfileScreen.name,
    builder: (context, state) => const ProfileScreen(),
  ),
];
