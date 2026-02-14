import 'dart:async';

import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/user_events/data/sign_up_status.dart';
import 'package:anystep/core/features/user_events/data/user_event_repository.dart';
import 'package:anystep/core/features/user_events/domain/user_event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_button_controller.g.dart';

@riverpod
class SignUpButtonController extends _$SignUpButtonController {
  @override
  FutureOr<void> build() {}

  Future<void> signUp({required int eventId}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final event = await ref.read(getEventProvider(eventId).future);
      final now = DateTime.now().toUtc();
      if (event.registrationDeadline != null && now.isAfter(event.registrationDeadline!.toUtc())) {
        return;
      }
      final authState = await ref.read(authStateStreamProvider.future);

      final UserEventModel userEvent = UserEventModel(
        userId: authState!.uid,
        eventId: eventId,
        attended: false,
      );
      await ref.read(userEventRepositoryProvider).createOrUpdate(obj: userEvent);
      PostHogManager.capture(
        'user_signed_up',
        properties: {'event_id': eventId, 'user_id': authState.uid},
      );
    });
    ref.invalidate(signUpStatusProvider(eventId));
    ref.invalidate(getUserEventsProvider);
  }

  Future<void> cancelSignUp({required UserEventModel userEvent}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(userEventRepositoryProvider).delete(userEvent);
      PostHogManager.capture(
        'user_canceled_sign_up',
        properties: {'event_id': userEvent.eventId ?? '', 'user_id': userEvent.userId ?? ''},
      );
    });
    ref.invalidate(signUpStatusProvider(userEvent.eventId!));
    ref.invalidate(getUserEventsProvider);
  }
}
