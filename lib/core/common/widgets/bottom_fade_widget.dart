import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class BottomFadeWidget extends StatelessWidget {
  const BottomFadeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: AnyStepSpacing.lg48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [theme.colorScheme.surface.withAlpha(0), theme.colorScheme.surface],
            stops: const [0.0, 1.0],
          ),
        ),
      ),
    );
  }
}
