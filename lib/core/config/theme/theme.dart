import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'text_styles.dart';

class AnyStepTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AnyStepColors.blueBright,
      onPrimaryContainer: AnyStepColors.navyDark,
      secondary: AnyStepColors.blueDeep,
      secondaryContainer: AnyStepColors.blueBright20,
      onSecondary: AnyStepColors.white,
      surface: AnyStepColors.white,
      error: AnyStepColors.error,
    ),
    textTheme: TextTheme(
      displayLarge: AnyStepTextStyles.displayLarge.copyWith(color: AnyStepColors.grayDark),
      bodyLarge: AnyStepTextStyles.bodyLarge.copyWith(color: AnyStepColors.grayDark),
      bodyMedium: AnyStepTextStyles.bodyMedium.copyWith(color: AnyStepColors.grayDark),
    ),
    cardTheme: CardThemeData(
      elevation: AnyStepSpacing.sm2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md12)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AnyStepColors.blueBright,
      foregroundColor: AnyStepColors.navyDark,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AnyStepColors.blueBright,
      brightness: Brightness.dark,
      error: AnyStepColors.errorDark,
    ),
    textTheme: TextTheme(
      displayLarge: AnyStepTextStyles.displayLarge.copyWith(color: AnyStepColors.white),
      bodyLarge: AnyStepTextStyles.bodyLarge.copyWith(color: AnyStepColors.white),
      bodyMedium: AnyStepTextStyles.bodyMedium.copyWith(
        color: AnyStepColors.lightTertiaryContainer,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: AnyStepSpacing.sm2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md12)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AnyStepColors.navyDark,
      foregroundColor: AnyStepColors.white,
    ),
  );

  static final highContrastLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.highContrastLight(
      primary: AnyStepColors.blueBright,
      onPrimaryContainer: AnyStepColors.navyDark,
      secondary: AnyStepColors.blueDeep,
      secondaryContainer: AnyStepColors.blueBright20,
      onSecondary: AnyStepColors.white,
      surface: AnyStepColors.white,
      error: AnyStepColors.error,
    ),
    textTheme: TextTheme(
      displayLarge: AnyStepTextStyles.displayLarge.copyWith(color: AnyStepColors.grayDark),
      bodyLarge: AnyStepTextStyles.bodyLarge.copyWith(color: AnyStepColors.grayDark),
      bodyMedium: AnyStepTextStyles.bodyMedium.copyWith(color: AnyStepColors.grayDark),
    ),
    cardTheme: CardThemeData(
      elevation: AnyStepSpacing.sm2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md12)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AnyStepColors.blueBright,
      foregroundColor: AnyStepColors.navyDark,
    ),
  );

  static final highContrastDarkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AnyStepColors.blueBright,
      contrastLevel: 1.0,
      brightness: Brightness.dark,
      error: AnyStepColors.errorDark,
    ),
    textTheme: TextTheme(
      displayLarge: AnyStepTextStyles.displayLarge.copyWith(color: AnyStepColors.white),
      bodyLarge: AnyStepTextStyles.bodyLarge.copyWith(color: AnyStepColors.white),
      bodyMedium: AnyStepTextStyles.bodyMedium.copyWith(
        color: AnyStepColors.lightTertiaryContainer,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: AnyStepSpacing.sm2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md12)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AnyStepColors.navyDark,
      foregroundColor: AnyStepColors.white,
    ),
  );
}
