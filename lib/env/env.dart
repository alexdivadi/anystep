import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Future<void> load() async {
    final fileName = '.env';
    await dotenv.load(fileName: fileName);
  }

  static String _get<T>(String key) {
    try {
      return dotenv.env[key]!;
    } catch (e, st) {
      Log.e('Missing env: $key', e, st);
      rethrow;
    }
  }

  static String get supabaseUrl => _get('SUPABASE_URL');
  static String get supabaseApiKey => _get('SUPABASE_API_KEY');

  static String get posthogApiKey => _get('POSTHOG_API_KEY');

  // Collections (don't need to be secret)
  static const String eventCollectionId = "events";
  static const String userCollectionId = "users";
  static const String addressCollectionId = "addresses";
  static const String eventTemplateCollectionId = "event_templates";
  static const String userEventCollectionId = "user_events";
}
