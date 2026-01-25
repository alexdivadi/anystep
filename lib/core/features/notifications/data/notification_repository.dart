import 'dart:async';

import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/config/router/router.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository.g.dart';

const String _eventTopic = 'event_notifications';
const String _eventIdKey = 'event_id';
String _eventDetailPath(int id) => '/events/$id';

class NotificationRepository {
  NotificationRepository({
    required AppPreferences prefs,
    required FirebaseMessaging messaging,
    required GoRouter router,
  })  : _prefs = prefs,
        _messaging = messaging,
        _router = router;

  final AppPreferences _prefs;
  final FirebaseMessaging _messaging;
  final GoRouter _router;

  StreamSubscription<RemoteMessage>? _openSubscription;

  Future<void> init() async {
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _openSubscription ??= FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpened);

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpened(initialMessage);
    }

    await syncSubscription();
  }

  Future<void> syncSubscription() async {
    final enabledPref = _prefs.getEventNotificationsEnabled();
    final enabled = enabledPref ?? true;
    if (enabledPref == null) {
      await _prefs.setEventNotificationsEnabled(true);
    }

    if (enabled) {
      await _subscribeIfAuthorized(requestPermission: false);
    } else {
      await _unsubscribeFromTopic();
    }
  }

  Future<void> setEventNotificationsEnabled(
    bool enabled, {
    bool requestPermission = true,
  }) async {
    await _prefs.setEventNotificationsEnabled(enabled);

    if (enabled) {
      await _subscribeIfAuthorized(requestPermission: requestPermission);
    } else {
      await _unsubscribeFromTopic();
    }
  }

  Future<void> dispose() async {
    await _openSubscription?.cancel();
    _openSubscription = null;
  }

  Future<void> _subscribeIfAuthorized({required bool requestPermission}) async {
    if (requestPermission) {
      final permission = await _messaging.requestPermission();
      if (permission.authorizationStatus == AuthorizationStatus.denied) {
        Log.w('Event notifications permission denied.');
        return;
      }
    }

    final settings = await _messaging.getNotificationSettings();
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      Log.w('Event notifications authorization denied.');
      return;
    }

    await _messaging.subscribeToTopic(_eventTopic);
    Log.i('Subscribed to $_eventTopic');
  }

  Future<void> _unsubscribeFromTopic() async {
    await _messaging.unsubscribeFromTopic(_eventTopic);
    Log.i('Unsubscribed from $_eventTopic');
  }

  void _handleMessageOpened(RemoteMessage message) {
    final rawEventId = message.data[_eventIdKey];
    final eventId = int.tryParse(rawEventId?.toString() ?? '');
    if (eventId == null) {
      Log.w('Notification missing event_id: ${message.data}');
      return;
    }

    _router.go(_eventDetailPath(eventId));
  }
}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(Ref ref) {
  final prefs = ref.watch(appPreferencesProvider).requireValue;
  final router = ref.watch(routerProvider);
  final repo = NotificationRepository(
    prefs: prefs,
    messaging: FirebaseMessaging.instance,
    router: router,
  );
  ref.onDispose(repo.dispose);
  return repo;
}

@Riverpod(keepAlive: true)
Future<void> notificationStartup(Ref ref) async {
  await ref.watch(appPreferencesProvider.future);
  final repo = ref.watch(notificationRepositoryProvider);
  await repo.init();
}
