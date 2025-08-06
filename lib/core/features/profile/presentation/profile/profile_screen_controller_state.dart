import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_screen_controller_state.freezed.dart';

@freezed
abstract class ProfileScreenControllerState with _$ProfileScreenControllerState {
  const factory ProfileScreenControllerState({@Default(false) bool isLoading, String? error}) =
      _ProfileScreenControllerState;
}
