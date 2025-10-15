import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/app_startup/app_startup_widget.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserOnboardedGate extends ConsumerWidget {
  const UserOnboardedGate({super.key, required this.redirect});
  final String redirect;

  static const path = "/gate";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          } else if (user != null && currentLocation != redirect) {
            if (context.mounted) {
              Log.d('User is logged in, checking onboarding status');
              context.go(redirect);
            }
          }
        },
        error: (error, stackTrace) {
          Log.e("User fetch failed", error, stackTrace);
          if (context.mounted) {
            context.go(OnboardingScreen.path);
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
