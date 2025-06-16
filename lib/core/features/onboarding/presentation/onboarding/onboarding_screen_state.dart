import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_screen_state.freezed.dart';

@freezed
abstract class OnboardingScreenState with _$OnboardingScreenState {
  const factory OnboardingScreenState({
    @Default(false) bool isLoading,
    @Default(false) bool isOnboarded,
    String? error,
  }) = _OnboardingScreenState;
}
