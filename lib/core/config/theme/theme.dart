import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'text_styles.dart';

class AnyStepTheme {
  static const double _textScaleFactor = 0.94;
  static const double _textHeightFactor = 0.98;

  static TextTheme _tightTextTheme(Color textColor) {
    return AnyStepTextStyles.textTheme
        .apply(
          fontSizeFactor: _textScaleFactor,
          heightFactor: _textHeightFactor,
          bodyColor: textColor,
          displayColor: textColor,
        )
        .copyWith(
          displayLarge: AnyStepTextStyles.displayLarge.copyWith(color: textColor),
          bodyLarge: AnyStepTextStyles.bodyLarge.copyWith(color: textColor),
          bodyMedium: AnyStepTextStyles.bodyMedium.copyWith(color: textColor),
        );
  }

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: '.SF Pro Text',
    fontFamilyFallback: const ['.SF Pro Display'],
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    colorScheme: ColorScheme.light(
      primary: AnyStepColors.blueBright,
      onPrimaryContainer: AnyStepColors.navyDark,
      secondary: AnyStepColors.blueDeep,
      secondaryContainer: AnyStepColors.blueBright20,
      onSecondary: AnyStepColors.white,
      surface: AnyStepColors.white,
      onSurface: AnyStepColors.black,
      surfaceContainer: AnyStepColors.lightSecondaryContainer,
      surfaceContainerHighest: AnyStepColors.lightTertiaryContainer,
      error: AnyStepColors.error,
    ),
    textTheme: _tightTextTheme(AnyStepColors.grayDark),
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
    fontFamily: '.SF Pro Text',
    fontFamilyFallback: const ['.SF Pro Display'],
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AnyStepColors.blueBright,
      brightness: Brightness.dark,
      surface: AnyStepColors.black,
      onSurface: AnyStepColors.white,
      surfaceContainer: AnyStepColors.grayDark,
      surfaceContainerHighest: AnyStepColors.navyDark,
      error: AnyStepColors.errorDark,
      onError: AnyStepColors.white,
    ),
    textTheme: _tightTextTheme(AnyStepColors.pureWhite).copyWith(
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
    fontFamily: '.SF Pro Text',
    fontFamilyFallback: const ['.SF Pro Display'],
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    colorScheme: ColorScheme.highContrastLight(
      primary: AnyStepColors.blueBright,
      onPrimaryContainer: AnyStepColors.navyDark,
      secondary: AnyStepColors.blueDeep,
      secondaryContainer: AnyStepColors.blueBright20,
      onSecondary: AnyStepColors.pureWhite,
      surface: AnyStepColors.pureWhite,
      onSurface: AnyStepColors.pureBlack,
      error: AnyStepColors.error,
    ),
    textTheme: _tightTextTheme(AnyStepColors.grayDark),
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
    fontFamily: '.SF Pro Text',
    fontFamilyFallback: const ['.SF Pro Display'],
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AnyStepColors.blueBright,
      contrastLevel: 1.0,
      brightness: Brightness.dark,
      error: AnyStepColors.errorDark,
      onError: AnyStepColors.pureWhite,
      surface: AnyStepColors.pureBlack,
      onSurface: AnyStepColors.pureWhite,
    ),
    textTheme: _tightTextTheme(AnyStepColors.white).copyWith(
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
      foregroundColor: AnyStepColors.pureWhite,
    ),
  );
}
