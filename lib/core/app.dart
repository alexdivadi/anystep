import 'package:anystep/core/app_startup/app_startup_widget.dart';
import 'package:anystep/core/config/router/router.dart';
import 'package:anystep/core/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnyStepApp extends ConsumerWidget {
  const AnyStepApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'AnyStep Community Services',
      theme: AnyStepTheme.lightTheme,
      highContrastTheme: AnyStepTheme.highContrastLightTheme,
      darkTheme: AnyStepTheme.darkTheme,
      highContrastDarkTheme: AnyStepTheme.highContrastDarkTheme,
      themeMode: ThemeMode.system,
      builder:
          (context, child) => AppStartupWidget(onLoaded: (context) => child ?? const SizedBox()),
    );
  }
}
