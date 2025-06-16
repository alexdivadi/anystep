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

  static String get appwriteEndpoint => _get('APPWRITE_ENDPOINT');
  static String get appwriteProjectId => _get('APPWRITE_PROJECT_ID');
  static String get appwriteDatabaseId => _get('APPWRITE_DATABASE_ID');

  // Collections (don't need to be secret)
  static const String eventCollectionId = "684dc92100148ca700eb";
  static const String userCollectionId = "684f54d400132f5f3686";
  static const String addressCollectionId = "684f54d400132f5f3686";
  static const String eventTemplateCollectionId = "684debf500048f54e3cc";
  static const String userEventCollectionId = "684f554c00074b03a00e";
}
