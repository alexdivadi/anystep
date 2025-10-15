import 'package:anystep/core/common/widgets/any_step_fade.dart';
import 'package:flutter/material.dart';
import 'package:anystep/core/common/constants/spacing.dart';

class NoUsersWidget extends StatelessWidget {
  const NoUsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnyStepFade(
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_off,
              size: AnyStepSpacing.xl64,
              color: theme.colorScheme.onSurface.withAlpha(30),
            ),
            const SizedBox(height: AnyStepSpacing.md16),
            Text(
              'No users found',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(150),
              ),
            ),
            const SizedBox(height: AnyStepSpacing.lg48),
          ],
        ),
      ),
    );
  }
}
