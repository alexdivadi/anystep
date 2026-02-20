import 'dart:async';

import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/config/router/router.dart';
import 'package:anystep/database/client.dart';
import 'package:anystep/env/env.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

part 'notification_repository.g.dart';

const String _eventIdKey = 'event_id';
String _eventDetailPath(int id) => '/events/$id';

class NotificationRepository {
  NotificationRepository({
    required FirebaseMessaging messaging,
    required GoRouter router,
    required SupabaseClient supabase,
  })  : _messaging = messaging,
        _router = router,
        _supabase = supabase;

  final FirebaseMessaging _messaging;
  final GoRouter _router;
  final SupabaseClient _supabase;

  StreamSubscription<RemoteMessage>? _openSubscription;
  StreamSubscription<String>? _tokenRefreshSubscription;
  StreamSubscription<RemoteMessage>? _messageSubscription;

  Future<void> init() async {
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _openSubscription ??= FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpened);
    _messageSubscription ??= FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    _tokenRefreshSubscription ??= _messaging.onTokenRefresh.listen((token) async {
      await _persistToken(token);
    });

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpened(initialMessage);
    }

    await _syncToken();
  }

  Future<void> dispose() async {
    await _openSubscription?.cancel();
    _openSubscription = null;
    await _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription = null;
    await _messageSubscription?.cancel();
    _messageSubscription = null;
  }

  Future<void> syncToken() async {
    await _syncToken();
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

  void _handleForegroundMessage(RemoteMessage message) {
    final context = _router.routerDelegate.navigatorKey.currentContext;
    if (context == null) {
      Log.w('Foreground notification received without context: ${message.data}');
      return;
    }

    final title = message.notification?.title ?? 'New event';
    final body = message.notification?.body ?? '';
    final rawEventId = message.data[_eventIdKey];
    final eventId = int.tryParse(rawEventId?.toString() ?? '');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(body.isEmpty ? title : '$title\n$body'),
        action: eventId == null
            ? null
            : SnackBarAction(
                label: 'Open',
                onPressed: () => _router.go(_eventDetailPath(eventId)),
              ),
      ),
    );
  }

  Future<void> _syncToken() async {
    final user = _supabase.auth.currentUser;
    if (user == null) {
      Log.w('No authenticated user; skipping FCM token sync.');
      return;
    }

    String? token;
    if (kIsWeb) {
      if (Env.firebaseVapidKey.isEmpty) {
        Log.w('Missing FIREBASE_VAPID_KEY; web FCM token not requested.');
        return;
      }
      token = await _messaging.getToken(vapidKey: Env.firebaseVapidKey);
    } else {
      token = await _messaging.getToken();
    }

    if (token == null || token.isEmpty) {
      Log.w('FCM token unavailable; cannot sync to server.');
      return;
    }

    await _persistToken(token);
  }

  Future<void> _persistToken(String token) async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;
    try {
      await _supabase.from('users').update({'fcm_token': token}).eq('id', user.id);
      Log.i('Synced FCM token for user ${user.id}');
    } catch (e, st) {
      Log.e('Failed to sync FCM token', e, st);
    }
  }

}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(Ref ref) {
  final router = ref.watch(routerProvider);
  final repo = NotificationRepository(
    messaging: FirebaseMessaging.instance,
    router: router,
    supabase: ref.watch(clientProvider),
  );
  ref.onDispose(repo.dispose);
  return repo;
}

@Riverpod(keepAlive: true)
Future<void> notificationStartup(Ref ref) async {
  final repo = ref.watch(notificationRepositoryProvider);
  await repo.init();
}
