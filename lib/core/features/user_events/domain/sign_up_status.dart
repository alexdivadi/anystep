import 'package:anystep/core/features/user_events/domain/user_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_status.freezed.dart';

@freezed
sealed class SignUpStatus with _$SignUpStatus {
  const SignUpStatus._();

  const factory SignUpStatus.error(String message) = SignUpStatusError;

  const factory SignUpStatus.data({
    required bool canSignUp,
    required bool didSignUp,
    UserEventModel? userEvent,
  }) = SignUpStatusData;
}
