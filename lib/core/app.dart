import 'package:anystep/core/app_startup/app_startup_widget.dart';
import 'package:anystep/core/config/router/deep_link_handler.dart';
import 'package:anystep/core/config/router/router.dart';
import 'package:anystep/core/config/theme/theme.dart';
import 'package:anystep/core/config/theme/theme_mode.dart';
import 'package:anystep/core/config/locale/locale_controller.dart';
import 'package:anystep/core/features/notifications/data/notification_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnyStepApp extends ConsumerWidget {
  const AnyStepApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeControllerProvider);
    final localeAsync = ref.watch(localeControllerProvider);
    ref.watch(notificationStartupProvider);
    ref.watch(deepLinkHandlerProvider);

    return MaterialApp.router(
      routerConfig: router,
      // Localizations
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      // Title uses localization (fallback to English if not loaded yet)
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: AnyStepTheme.lightTheme,
      highContrastTheme: AnyStepTheme.highContrastLightTheme,
      darkTheme: AnyStepTheme.darkTheme,
      highContrastDarkTheme: AnyStepTheme.highContrastDarkTheme,
      themeMode: themeMode.hasValue ? themeMode.value : ThemeMode.system,
      locale: localeAsync.hasValue ? localeAsync.value : null,
      builder: (context, child) =>
          AppStartupWidget(onLoaded: (context) => child ?? const SizedBox()),
    );
  }
}
