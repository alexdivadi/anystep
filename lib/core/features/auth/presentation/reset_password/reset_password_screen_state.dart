import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_screen_state.freezed.dart';

@freezed
abstract class ResetPasswordScreenState with _$ResetPasswordScreenState {
  const factory ResetPasswordScreenState({
    @Default(false) bool isLoading,
    @Default(false) bool success,
    String? error,
  }) = _ResetPasswordScreenState;
}
