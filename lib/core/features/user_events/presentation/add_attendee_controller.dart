import 'dart:async';

import 'package:anystep/core/features/user_events/data/user_event_repository.dart';
import 'package:anystep/core/features/user_events/domain/user_event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_attendee_controller.g.dart';

@riverpod
class AddAttendeeController extends _$AddAttendeeController {
  @override
  FutureOr<void> build() {}

  Future<bool> addAttendee({
    required int eventId,
    required String userId,
    required bool attended,
    DateTime? checkInAt,
    DateTime? checkOutAt,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final res = await ref.read(getUserEventsProvider(eventId: eventId, userId: userId).future);
      final checkInUtc = attended ? checkInAt?.toUtc() : null;
      final checkOutUtc = attended ? checkOutAt?.toUtc() : null;

      if (res.items.isEmpty) {
        await ref.read(userEventRepositoryProvider).createOrUpdate(
              obj: UserEventModel(
                userId: userId,
                eventId: eventId,
                attended: attended,
                checkInAt: checkInUtc,
                checkOutAt: checkOutUtc,
              ),
            );
        return;
      }

      final userEvent = res.items.first;
      await ref.read(userEventRepositoryProvider).createOrUpdate(
            obj: userEvent.copyWith(
              attended: attended,
              checkInAt: checkInUtc,
              checkOutAt: checkOutUtc,
            ),
            documentId: "${userEvent.id}",
          );
    });
    ref.invalidate(getUserEventsProvider);
    return !state.hasError;
  }
}
