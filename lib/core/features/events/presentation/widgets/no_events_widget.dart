import 'package:anystep/core/common/widgets/any_step_fade.dart';
import 'package:flutter/material.dart';
import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/config/theme/colors.dart';

class NoEventsWidget extends StatelessWidget {
  const NoEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnyStepFade(
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.event_busy,
              size: AnyStepSpacing.xl64,
              color: AnyStepColors.grayDark.withAlpha(30),
            ),
            const SizedBox(height: AnyStepSpacing.md16),
            Text(
              'No events found',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AnyStepColors.navyDark),
            ),
            const SizedBox(height: AnyStepSpacing.sm8),
            Text(
              'Check back later for updates',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AnyStepColors.grayDark.withAlpha(120)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AnyStepSpacing.lg48),
          ],
        ),
      ),
    );
  }
}
