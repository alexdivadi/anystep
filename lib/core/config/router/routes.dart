import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:anystep/core/common/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routes = [
  GoRoute(path: LoginScreen.path, builder: (context, state) => const LoginScreen()),
  GoRoute(path: SignUpScreen.path, builder: (context, state) => const SignUpScreen()),
  GoRoute(path: OnboardingScreen.path, builder: (context, state) => const OnboardingScreen()),
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
            name: EventFeedScreen.name,
            builder: (context, state) => const EventFeedScreen(), // Replace with actual HomePage
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/profile',
            builder: (context, state) => const Placeholder(), // Replace with actual ProfilePage
          ),
        ],
      ),
    ],
  ),
];
