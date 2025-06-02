import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs.g.dart';

class AppPreferences {
  final SharedPreferencesWithCache _prefs;

  AppPreferences(this._prefs);

  static const String userIdKey = 'user_id';
  static const String onboardingKey = 'onboarded';

  String? getUserId() => _prefs.getString(userIdKey);
  Future<void> setUserId(String token) async => await _prefs.setString(userIdKey, token);
  Future<void> clearUserId() async => await _prefs.remove(userIdKey);

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
