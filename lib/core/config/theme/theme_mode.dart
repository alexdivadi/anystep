import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';

part 'theme_mode.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  Future<ThemeMode> build() async {
    final AppPreferences prefs = await ref.watch(appPreferencesProvider.future);
    final modeStr = prefs.getThemeMode();
    return switch (modeStr) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.system,
    };
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = ref.watch(appPreferencesProvider).requireValue;
    await prefs.setThemeMode(mode.name);
    PostHogManager.capture('theme_mode_changed', properties: <String, Object>{'mode': mode.name});
    ref.invalidateSelf();
  }
}
