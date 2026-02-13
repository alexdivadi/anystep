import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_screen_state.freezed.dart';

@freezed
abstract class ForgotPasswordScreenState with _$ForgotPasswordScreenState {
  const factory ForgotPasswordScreenState({
    @Default(false) bool isLoading,
    @Default(false) bool success,
    String? error,
  }) = _ForgotPasswordScreenState;
}
