import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_controller.g.dart';

@Riverpod(keepAlive: true)
class LocaleController extends _$LocaleController {
  @override
  Future<Locale?> build() async {
    final AppPreferences prefs = await ref.watch(appPreferencesProvider.future);
    final code = prefs.getLocaleCode();
    if (code == null || code.isEmpty) return null; // system default
    return Locale(code);
  }

  Future<void> setLocale(Locale? locale) async {
    final prefs = ref.watch(appPreferencesProvider).requireValue;
    if (locale == null) {
      await prefs.clearLocaleCode();
    } else {
      await prefs.setLocaleCode(locale.languageCode);
    }
    // Recompute value
    ref.invalidateSelf();
  }
}
