import 'package:anystep/core/app_startup/app_startup.dart';
import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/domain/auth_state.dart';
import 'package:anystep/core/features/onboarding/data/onboarding_repository.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:anystep/core/config/router/router_utils.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'routes.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  ref.watch(appStartupProvider);
  final isOnboarded = ref.watch(onboardingRepositoryProvider);
  final isAuth = ValueNotifier<AsyncValue<AuthState?>>(const AsyncLoading());
  ref
    ..onDispose(isAuth.dispose)
    ..listen(authStateStreamProvider, (_, next) {
      if (isAuth.value.hasValue &&
          next.hasValue &&
          isAuth.value.requireValue == next.requireValue) {
        Log.d('Auth state updated; no change detected.');
        return;
      }
      Log.d('Auth state updated: $next');
      isAuth.value = next;
    }, fireImmediately: true);
  return GoRouter(
    initialLocation: EventFeedScreen.pathAnonymous,
    routes: routes,
    observers: [PosthogObserver()],
    refreshListenable: isAuth,
    redirect: (context, state) {
      final authStateAsync = isAuth.value;
      if (!isOnboarded.hasValue || authStateAsync.isLoading) {
        // Onboarding state is still loading, do not redirect yet
        return AppStartupLoadingWidget.path;
      }

      if (!isOnboarded.requireValue) {
        // User has not completed onboarding, redirect to onboarding screen
        Log.d('User has not done welcome, redirecting to welcome screen');
        return WelcomeScreen.path;
      }

      final path = state.matchedLocation;
      final redirectPath = path == '/' ? EventFeedScreen.pathAnonymous : path;
      if (path == AppStartupLoadingWidget.path) return EventFeedScreen.pathAnonymous;

      // Replace any sequence of digits between slashes with ':id'
      final normalizedPath = path.replaceAllMapped(RegExp(r'\/\d+(?=\/|$)'), (match) => '/:id');

      if (RouterUtils.anyRoutes.contains(normalizedPath)) {
        if (RouterUtils.loginRoutes.contains(path)) {
          // Replace with dashboard screen
          return authStateAsync.hasValue && authStateAsync.value != null
              ? EventFeedScreen.path
              : null;
        }

        return null;
      }

      final isUnauthenticatedShell = RouterUtils.unauthenticatedRoutes.contains(normalizedPath);

      if (authStateAsync.value != null) {
        // User is authenticated, allow access to the requested route
        // Check if user has submitted profile information
        final user = ref.read(currentUserStreamProvider);
        if (user.hasError) {
          Log.e('Error loading current user', user.error);
          return EventFeedScreen.pathAnonymous;
        }

        if (!user.hasValue || user.requireValue == null) {
          // User is not onboarded, redirecting to onboarding screen
          if (RouterUtils.onboardingRoutes.contains(path)) {
            return null;
          }
          Log.d('Going to UserGate with redirect to $redirectPath');
          return '${UserOnboardedGate.path}?redirect=$redirectPath';
        }

        if (user.requireValue!.authId == null || user.requireValue!.authId!.isEmpty) {
          if (RouterUtils.onboardingRoutes.contains(path)) {
            return null;
          }
          Log.d('User missing auth_id, redirecting to onboarding');
          return OnboardingScreen.path;
        }

        if (!user.requireValue!.hasSignedAgreement) {
          Log.d('User has not signed agreement, redirecting to sign agreement screen');
          return SignAgreementScreen.path;
        }

        final role = user.requireValue!.role;
        final isVolunteerShell = RouterUtils.volunteerRoutes.contains(normalizedPath);
        final isAdminShell = RouterUtils.adminRoutes.contains(normalizedPath);

        if (role == UserRole.volunteer && (isAdminShell || isUnauthenticatedShell)) {
          Log.d('Volunteer trying to access admin route, redirecting to volunteer dashboard');
          return EventFeedScreen.path;
        } else if (role == UserRole.admin && (isVolunteerShell || isUnauthenticatedShell)) {
          Log.d('Admin trying to access volunteer route, redirecting to admin dashboard');
          return EventFeedScreen.pathAdmin;
        }

        return null;
      }

      // User is not authenticated, redirect to the login screen if on a protected route
      return isUnauthenticatedShell ? null : LoginScreen.path;
    },
  );
}
