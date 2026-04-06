import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class AnyStepBadge extends StatelessWidget {
  const AnyStepBadge({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.borderRadius,
  });

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.secondary,
        borderRadius: borderRadius ?? BorderRadius.circular(AnyStepSpacing.sm8),
      ),
      child: Padding(
        padding:
            padding ??
            const EdgeInsets.symmetric(
              vertical: AnyStepSpacing.sm4,
              horizontal: AnyStepSpacing.md12,
            ),
        child: child,
      ),
    );
  }
}
