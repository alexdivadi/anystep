import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/domain/event.dart';
part 'event_detail_screen_controller.g.dart';

@riverpod
class EventDetailScreenController extends _$EventDetailScreenController {
  @override
  AsyncValue<EventModel> build(String eventId) => const AsyncValue.loading();

  Future<void> fetchEvent(String eventId) async {
    state = await AsyncValue.guard(() async {
      final repo = ref.read(eventRepositoryProvider);
      final event = await repo.get(documentId: eventId);
      return event;
    });
  }
}
