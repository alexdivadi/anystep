import 'package:flutter/material.dart';

class AnyStepTextStyles {
  static final TextTheme textTheme = TextTheme(
    displayLarge: displayLarge,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
  );

  static const TextStyle displayLarge = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);

  static const TextStyle bodyLarge = TextStyle(fontSize: 16);

  static const TextStyle bodyMedium = TextStyle(fontSize: 14);

  static const TextStyle caption = TextStyle(fontSize: 12, color: Colors.grey);

  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.1,
  );
}
