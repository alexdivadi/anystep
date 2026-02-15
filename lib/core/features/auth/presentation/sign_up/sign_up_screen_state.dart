import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_screen_state.freezed.dart';

@freezed
abstract class SignUpScreenState with _$SignUpScreenState {
  const factory SignUpScreenState({
    @Default(false) bool isLoading,
    @Default(false) bool success,
    @Default(false) bool needsEmailConfirmation,
    String? error,
  }) = _SignUpScreenState;
}
