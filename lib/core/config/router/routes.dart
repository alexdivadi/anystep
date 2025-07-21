import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:anystep/core/common/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routes = [
  GoRoute(path: LoginScreen.path, builder: (context, state) => const LoginScreen()),
  GoRoute(path: SignUpScreen.path, builder: (context, state) => const SignUpScreen()),
  GoRoute(path: WelcomeScreen.path, builder: (context, state) => const WelcomeScreen()),
  GoRoute(path: OnboardingScreen.path, builder: (context, state) => const OnboardingScreen()),
  GoRoute(
    path: UserOnboardedGate.path,
    pageBuilder: (context, state) {
      final redirectParam = state.uri.queryParameters['redirect'] ?? EventFeedScreen.path;
      return NoTransitionPage(child: UserOnboardedGate(redirect: redirectParam));
    },
  ),
  GoRoute(
    path: AppStartupLoadingWidget.path,
    builder: (context, state) => const AppStartupLoadingWidget(),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: AnyStepNavBar(
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
            pageBuilder: (context, state) => NoTransitionPage(child: const EventFeedScreen()),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: ProfileScreen.path,
            pageBuilder: (context, state) => NoTransitionPage(child: const ProfileScreen()),
          ),
        ],
      ),
    ],
  ),
];
