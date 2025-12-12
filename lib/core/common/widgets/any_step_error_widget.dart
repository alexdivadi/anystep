import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';

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
          error != null ? "$error" : AppLocalizations.of(context).genericError,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AnyStepSpacing.md16),
        if (onRetry != null)
          ElevatedButton(onPressed: onRetry!, child: Text(AppLocalizations.of(context).retry)),
        const SizedBox(height: AnyStepSpacing.md16),
      ],
    );
  }
}
