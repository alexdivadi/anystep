import 'package:anystep/core/constants/spacing.dart';
import 'package:anystep/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'text_styles.dart';

class AnyStepTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AnyStepColors.brightBlue,
      secondary: AnyStepColors.deepBlue,
      surface: AnyStepColors.white,
      error: AnyStepColors.error,
    ),
    textTheme: TextTheme(
      displayLarge: AnyStepTextStyles.displayLarge.copyWith(color: AnyStepColors.darkGray),
      bodyLarge: AnyStepTextStyles.bodyLarge.copyWith(color: AnyStepColors.darkGray),
      bodyMedium: AnyStepTextStyles.bodyMedium.copyWith(color: AnyStepColors.darkGray),
    ),
    cardTheme: CardTheme(
      elevation: AnyStepSpacing.sm2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md12)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AnyStepColors.brightBlue,
      foregroundColor: AnyStepColors.darkNavy,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AnyStepColors.darkNavy,
      secondary: AnyStepColors.deepBlue,
      surface: AnyStepColors.darkGray,
      error: AnyStepColors.errorDark,
    ),
    textTheme: TextTheme(
      displayLarge: AnyStepTextStyles.displayLarge.copyWith(color: AnyStepColors.white),
      bodyLarge: AnyStepTextStyles.bodyLarge.copyWith(color: AnyStepColors.white),
      bodyMedium: AnyStepTextStyles.bodyMedium.copyWith(
        color: AnyStepColors.lightTertiaryContainer,
      ),
    ),
    cardTheme: CardTheme(
      elevation: AnyStepSpacing.sm2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md12)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AnyStepColors.darkNavy,
      foregroundColor: AnyStepColors.white,
    ),
  );

  static final highContrastLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.highContrastLight(
      primary: AnyStepColors.brightBlue,
      secondary: AnyStepColors.deepBlue,
      surface: AnyStepColors.white,
      error: AnyStepColors.error,
    ),
    textTheme: TextTheme(
      displayLarge: AnyStepTextStyles.displayLarge.copyWith(color: AnyStepColors.darkGray),
      bodyLarge: AnyStepTextStyles.bodyLarge.copyWith(color: AnyStepColors.darkGray),
      bodyMedium: AnyStepTextStyles.bodyMedium.copyWith(color: AnyStepColors.darkGray),
    ),
    cardTheme: CardTheme(
      elevation: AnyStepSpacing.sm2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md12)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AnyStepColors.brightBlue,
      foregroundColor: AnyStepColors.darkNavy,
    ),
  );

  static final highContrastDarkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.highContrastDark(
      primary: AnyStepColors.darkNavy,
      secondary: AnyStepColors.deepBlue,
      surface: AnyStepColors.darkGray,
      error: AnyStepColors.errorDark,
    ),
    textTheme: TextTheme(
      displayLarge: AnyStepTextStyles.displayLarge.copyWith(color: AnyStepColors.white),
      bodyLarge: AnyStepTextStyles.bodyLarge.copyWith(color: AnyStepColors.white),
      bodyMedium: AnyStepTextStyles.bodyMedium.copyWith(
        color: AnyStepColors.lightTertiaryContainer,
      ),
    ),
    cardTheme: CardTheme(
      elevation: AnyStepSpacing.sm2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md12)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AnyStepColors.darkNavy,
      foregroundColor: AnyStepColors.white,
    ),
  );
}
