import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_detail_form_state.freezed.dart';

@freezed
abstract class EventDetailFormState with _$EventDetailFormState {
  const factory EventDetailFormState({
    @Default(false) bool isLoading,
    String? error,
    int? eventId,
  }) = _EventDetailFormState;
}
