import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:anystep/core/features/events/domain/event.dart';

part 'event_feed_screen_state.freezed.dart';

@freezed
abstract class EventFeedScreenState with _$EventFeedScreenState {
  const factory EventFeedScreenState({
    @Default([]) List<EventModel> items,
    @Default([]) List<EventModel> page,
    String? lastId,
  }) = _EventFeedScreenState;
}
