import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_notifications_controller.g.dart';

@Riverpod(keepAlive: true)
class EventNotificationsController extends _$EventNotificationsController {
  @override
  Future<bool> build() async {
    final user = await ref.watch(currentUserStreamProvider.future);
    return user?.newEventNotificationsEnabled ?? true;
  }

  Future<void> setEnabled(bool enabled) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(currentUserStreamProvider.future);
      if (user == null) {
        throw StateError('No authenticated user available for notification settings.');
      }
      final updated = user.copyWith(newEventNotificationsEnabled: enabled);
      await ref.read(userRepositoryProvider).createOrUpdate(obj: updated, documentId: user.id);
      ref.invalidate(currentUserStreamProvider);
      return enabled;
    });
  }

  Future<void> enableOnSignup() async {
    await setEnabled(true);
  }
}
