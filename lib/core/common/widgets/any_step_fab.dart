import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class AnyStepFab extends StatelessWidget {
  const AnyStepFab({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.heroTag,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      tooltip: tooltip,
      elevation: AnyStepSpacing.sm6,
      highlightElevation: AnyStepSpacing.md16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AnyStepSpacing.md16),
      ),
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      child: Icon(icon, size: AnyStepSpacing.lg28),
    );
  }
}
