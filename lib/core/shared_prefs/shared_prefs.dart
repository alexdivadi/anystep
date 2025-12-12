import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs.g.dart';

class AppPreferences {
  final SharedPreferencesWithCache _prefs;

  AppPreferences(this._prefs);

  static const String authStateKey = 'auth_state';
  static const String onboardingKey = 'onboarded';
  static const String currentUserKey = 'current_user';
  static const String themeModeKey = 'theme_mode';
  static const String localeCodeKey = 'locale_code';

  String? getAuthStateJson() => _prefs.getString(authStateKey);
  Future<void> setAuthStateJson(String token) async => await _prefs.setString(authStateKey, token);
  Future<void> clearAuthStateJson() async => await _prefs.remove(authStateKey);

  bool isOnboarded() => _prefs.getBool(onboardingKey) ?? false;
  Future<void> setIsOnboarded({bool isOnboarded = true}) async =>
      await _prefs.setBool(onboardingKey, isOnboarded);
  Future<void> clearIsOnboarded() async => await _prefs.remove(onboardingKey);

  String? getCurrentUser() => _prefs.getString(currentUserKey);
  Future<void> setCurrentUser(String userJson) async =>
      await _prefs.setString(currentUserKey, userJson);
  Future<void> clearCurrentUser() async => await _prefs.remove(currentUserKey);

  String? getThemeMode() => _prefs.getString(themeModeKey);
  Future<void> setThemeMode(String mode) async => await _prefs.setString(themeModeKey, mode);
  Future<void> clearThemeMode() async => await _prefs.remove(themeModeKey);

  String? getLocaleCode() => _prefs.getString(localeCodeKey);
  Future<void> setLocaleCode(String code) async => await _prefs.setString(localeCodeKey, code);
  Future<void> clearLocaleCode() async => await _prefs.remove(localeCodeKey);
}

@Riverpod(keepAlive: true)
Future<AppPreferences> appPreferences(Ref ref) async {
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );
  return AppPreferences(prefs);
}
