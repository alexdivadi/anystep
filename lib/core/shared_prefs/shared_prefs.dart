import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs.g.dart';

class AppPreferences {
  final SharedPreferencesWithCache _prefs;

  AppPreferences(this._prefs);

  static const String sessionIdKey = 'session_id';
  static const String onboardingKey = 'onboarded';

  String? getUserToken() => _prefs.getString(sessionIdKey);
  Future<void> setSessionId(String token) async => await _prefs.setString(sessionIdKey, token);
  Future<void> clearSessionId() async => await _prefs.remove(sessionIdKey);

  bool isOnboarded() => _prefs.getBool(onboardingKey) ?? false;
  Future<void> setIsOnboarded({bool isOnboarded = true}) async =>
      await _prefs.setBool(onboardingKey, isOnboarded);
  Future<void> clearIsOnboarded() async => await _prefs.remove(onboardingKey);
}

@Riverpod(keepAlive: true)
Future<AppPreferences> appPreferences(Ref ref) async {
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );
  return AppPreferences(prefs);
}
