import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      _initialized = true;
    } catch (e) {
      Log.e('Error initializing Firebase', e);
    }
  }
}
