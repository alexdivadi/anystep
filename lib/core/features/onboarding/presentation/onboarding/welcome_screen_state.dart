import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_screen_state.freezed.dart';

@freezed
abstract class WelcomeScreenState with _$WelcomeScreenState {
  const factory WelcomeScreenState({
    @Default(false) bool isLoading,
    @Default(false) bool isOnboarded,
    String? error,
  }) = _WelcomeScreenState;
}
