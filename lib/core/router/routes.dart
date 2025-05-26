import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/core/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:anystep/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routes = [
  GoRoute(path: LoginScreen.path, builder: (context, state) => const LoginScreen()),
  GoRoute(path: SignUpScreen.path, builder: (context, state) => const SignUpScreen()),
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
            path: '/home',
            builder: (context, state) => const Placeholder(), // Replace with actual HomePage
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
