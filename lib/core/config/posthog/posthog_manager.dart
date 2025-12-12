import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:anystep/env/env.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/config/posthog/posthog_exception.dart';

class PostHogManager {
  static bool isInitialized = false;

  static Future<void> init() async {
    // Initialize PostHog with the API key and host
    await _guard(() async {
      final config = PostHogConfig(Env.posthogApiKey);
      config.host = 'https://us.i.posthog.com';
      config.debug = true;
      config.captureApplicationLifecycleEvents = true;

      // check https://posthog.com/docs/session-replay/installation?tab=Flutter
      // for more config and to learn about how we capture sessions on mobile
      // and what to expect
      config.sessionReplay = false;

      // Setup PostHog with the given Context and Config
      await Posthog().setup(config);
      isInitialized = true;
    });
  }

  static Future<void> _guard(Future<void> Function() fn) async {
    try {
      await fn();
    } catch (e, st) {
      Log.e('[POSTHOG]: $e', e, st);
    }
  }

  static Future<void> identify(String userId, {Map<String, dynamic>? properties}) async {
    // Identify the user with their ID and optional properties
    await _guard(() async {
      final ph = Posthog();
      if (await ph.getDistinctId() == userId) {
        // If the user is already identified, skip
        return;
      }
      await ph.identify(userId: userId, userProperties: properties as Map<String, Object>?);
    });
  }

  static Future<void> reset() async {
    // Reset the PostHog instance
    await _guard(() async {
      await Posthog().reset();
    });
  }

  static Future<void> capture(String eventName, {Map<String, dynamic>? properties}) async {
    // Capture an event for the user with their ID and optional properties
    await _guard(() async {
      await Posthog().capture(eventName: eventName, properties: properties as Map<String, Object>?);
    });
  }

  static Future<void> captureException(
    List<PostHogException> exceptions, {
    String? exceptionFingerprint,
    String? eventName,
  }) async {
    await _guard(() async {
      await Posthog().capture(
        eventName: '\$exception',
        properties: {
          if (eventName != null) "distinct_id": eventName,
          '\$exception_list': exceptions.map((e) => e.toJson()).toList(),
          if (exceptionFingerprint != null) '\$exception_fingerprint': exceptionFingerprint,
        },
      );
    });
  }

  /// Helper that converts any error + stack trace directly into the list form
  /// accepted by [PostHogManager.captureException].
  static List<PostHogException> buildPostHogExceptionList(
    Object error,
    StackTrace stack, {
    bool? handled,
    String? module,
  }) => [PostHogException.fromError(error, stack, handled: handled, module: module)];
}
