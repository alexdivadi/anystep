import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_state.freezed.dart';

@freezed
abstract class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    @Default(false) bool isLoading,
    @Default(false) bool success,
    String? error,
  }) = _LoginScreenState;
}
