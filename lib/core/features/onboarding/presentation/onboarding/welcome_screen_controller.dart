import 'package:anystep/core/features/onboarding/data/onboarding_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'welcome_screen_state.dart';

part 'welcome_screen_controller.g.dart';

@riverpod
class WelcomeScreenController extends _$WelcomeScreenController {
  @override
  WelcomeScreenState build() {
    final isOnboarded = ref.watch(onboardingRepositoryProvider);
    return WelcomeScreenState(isOnboarded: isOnboarded.requireValue);
  }

  Future<void> completeOnboarding() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await ref.read(onboardingRepositoryProvider.notifier).setOnboarded();
      state = state.copyWith(isLoading: false, isOnboarded: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
