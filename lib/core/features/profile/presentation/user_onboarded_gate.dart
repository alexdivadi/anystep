import 'dart:async';

import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/app_startup/app_startup_widget.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserOnboardedGate extends ConsumerStatefulWidget {
  const UserOnboardedGate({super.key, required this.redirect});
  final String redirect;

  static const path = "/gate";
  static const name = "gate";

  @override
  ConsumerState<UserOnboardedGate> createState() => _UserOnboardedGateState();
}

class _UserOnboardedGateState extends ConsumerState<UserOnboardedGate> {
  Timer? _fallbackTimer;

  @override
  void initState() {
    super.initState();
    _fallbackTimer = Timer(const Duration(seconds: 5), _handleFallbackRedirect);
  }

  @override
  void dispose() {
    _fallbackTimer?.cancel();
    super.dispose();
  }

  void _handleFallbackRedirect() {
    if (!mounted) {
      return;
    }

    final goRouter = GoRouter.of(context);
    final currentLocation = goRouter.state.path ?? '';
    if (currentLocation != UserOnboardedGate.path) {
      return;
    }

    final userAsync = ref.read(currentUserStreamProvider);
    final safeRedirect = widget.redirect == '/' ? EventFeedScreen.pathAnonymous : widget.redirect;
    userAsync.when(
      data: (user) {
        final target = user == null ? OnboardingScreen.path : safeRedirect;
        Log.w('User onboarded gate timeout, redirecting to $target');
        if (context.mounted) {
          context.go(target);
        }
      },
      error: (error, stackTrace) {
        Log.e('User onboarded gate timeout after error', error, stackTrace);
        if (context.mounted) {
          context.go(EventFeedScreen.pathAnonymous);
        }
      },
      loading: () {
        Log.w('User onboarded gate timeout while loading, redirecting to event feed');
        if (context.mounted) {
          context.go(EventFeedScreen.pathAnonymous);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final safeRedirect = widget.redirect == '/' ? EventFeedScreen.pathAnonymous : widget.redirect;
    ref.listen(currentUserStreamProvider, (previous, userAsync) {
      final goRouter = GoRouter.of(context);
      final currentLocation = goRouter.state.path ?? '';
      userAsync.whenOrNull(
        data: (user) {
          if (user == null && !currentLocation.contains(OnboardingScreen.path)) {
            if (context.mounted) {
              Log.d('User not logged in, redirecting to onboarding screen');
              context.go(OnboardingScreen.path);
            }
          } else if (user != null && currentLocation != safeRedirect) {
            if (context.mounted) {
              Log.d('User is logged in, checking onboarding status');
              context.go(safeRedirect);
            }
          }
        },
        error: (error, stackTrace) {
          Log.e("User fetch failed", error, stackTrace);
          if (context.mounted) {
            context.go(EventFeedScreen.pathAnonymous);
          }
        },
      );
    });

    final userAsync = ref.watch(currentUserStreamProvider);
    return userAsync.when(
      loading: () => const AppStartupLoadingWidget(),
      error: (e, st) {
        Log.e("User Gate: User fetch failed", e, st);
        return AppStartupErrorWidget(
          onRetry: () async => ref.invalidate(currentUserStreamProvider),
        );
      },
      data: (user) {
        if (user == null) {
          Log.d('User is null, redirecting to onboarding screen');
          if (context.mounted) {
            Log.d('User not logged in, redirecting to onboarding screen');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go(OnboardingScreen.path);
            });
          }
        }
        return const AppStartupLoadingWidget();
      },
    );
  }
}
