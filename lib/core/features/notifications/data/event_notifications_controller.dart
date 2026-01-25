import 'package:anystep/core/features/notifications/data/notification_repository.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_notifications_controller.g.dart';

@Riverpod(keepAlive: true)
class EventNotificationsController extends _$EventNotificationsController {
  @override
  Future<bool> build() async {
    final prefs = await ref.watch(appPreferencesProvider.future);
    return prefs.getEventNotificationsEnabled() ?? true;
  }

  Future<void> setEnabled(
    bool enabled, {
    bool requestPermission = true,
  }) async {
    state = const AsyncLoading();
    await ref.read(notificationRepositoryProvider).setEventNotificationsEnabled(
          enabled,
          requestPermission: requestPermission,
        );
    state = AsyncData(enabled);
  }

  Future<void> enableOnSignup() async {
    final prefs = await ref.read(appPreferencesProvider.future);
    if (prefs.getEventNotificationsEnabled() != null) return;
    await setEnabled(true, requestPermission: true);
  }
}
