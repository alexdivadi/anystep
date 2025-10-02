import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class AnyStepBadge extends StatelessWidget {
  const AnyStepBadge({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AnyStepSpacing.sm4,
          horizontal: AnyStepSpacing.md12,
        ),
        child: child,
      ),
    );
  }
}
