import 'package:anystep/core/app_startup/app_startup.dart';
import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/core/features/onboarding/data/onboarding_repository.dart';
import 'package:anystep/core/features/onboarding/presentation/onboarding_screen.dart';
import 'package:anystep/core/router/router_utils.dart';
import 'package:anystep/core/utils/log_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'routes.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  ref.watch(appStartupProvider);
  final isOnboarded = ref.watch(onboardingRepositoryProvider);
  return GoRouter(
    initialLocation: LoginScreen.path,
    routes: routes,
    redirect: (context, state) {
      final authState = ref.read(authRepositoryProvider);

      if (!isOnboarded.hasValue) {
        // Onboarding state is still loading, do not redirect yet
        return AppStartupLoadingWidget.path;
      }

      if (!isOnboarded.requireValue) {
        // User has not completed onboarding, redirect to onboarding screen
        Log.d('User has not completed onboarding, redirecting to onboarding screen');
        return OnboardingScreen.path;
      }

      final path = state.matchedLocation;
      if (RouterUtils.unauthenticatedRoutes.contains(path)) {
        return null;
      }

      if (authState.valueOrNull != null) {
        // User is authenticated, allow access to the requested route
        return null;
      }

      // User is not authenticated, redirect to the login screen
      Log.d('User is not authenticated, redirecting to login screen');
      return LoginScreen.path;
    },
  );
}
