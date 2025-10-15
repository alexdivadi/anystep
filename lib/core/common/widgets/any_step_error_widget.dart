import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class AnyStepErrorWidget extends StatelessWidget {
  const AnyStepErrorWidget({super.key, this.error, this.onRetry});

  final VoidCallback? onRetry;
  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_rounded,
          size: AnyStepSpacing.xl64,
          color: Theme.of(context).colorScheme.error.withAlpha(200),
        ),
        const SizedBox(height: AnyStepSpacing.md16),
        Text(
          error != null ? "$error" : 'Something went wrong.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AnyStepSpacing.md16),
        if (onRetry != null) ElevatedButton(onPressed: onRetry!, child: const Text('Retry')),
        const SizedBox(height: AnyStepSpacing.md16),
      ],
    );
  }
}
