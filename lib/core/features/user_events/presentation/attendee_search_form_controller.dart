import 'dart:async';

import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/user_events/data/user_event_repository.dart';
import 'package:anystep/core/features/user_events/domain/user_event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendee_search_form_controller.g.dart';

@riverpod
class AttendeeSearchFormController extends _$AttendeeSearchFormController {
  @override
  FutureOr<void> build(int eventId) {}

  Future<void> toggleAttendance(UserModel user) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final res = await ref.read(getUserEventsProvider(eventId: eventId, userId: user.id).future);

      if (res.items.isEmpty) {
        await ref
            .read(userEventRepositoryProvider)
            .createOrUpdate(obj: UserEventModel(userId: user.id, eventId: eventId, attended: true));
      } else {
        final userEvent = res.items.first;
        await ref
            .read(userEventRepositoryProvider)
            .createOrUpdate(
              obj: userEvent.copyWith(attended: !userEvent.attended),
              documentId: "${userEvent.id}",
            );
      }
    });
    ref.invalidate(getUserEventsProvider);
  }
}
