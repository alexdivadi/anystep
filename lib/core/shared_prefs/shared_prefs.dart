import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs.g.dart';

class AppPreferences {
  final SharedPreferencesWithCache _prefs;

  AppPreferences(this._prefs);

  static const String userTokenKey = 'user_token';

  String? getUserToken() => _prefs.getString(userTokenKey);
  Future<void> setUserToken(String token) async => await _prefs.setString(userTokenKey, token);
  Future<void> clearUserToken() async => await _prefs.remove(userTokenKey);
}

@Riverpod(keepAlive: true)
Future<AppPreferences> appPreferences(Ref ref) async {
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );
  return AppPreferences(prefs);
}
