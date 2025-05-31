import 'package:anystep/core/app_startup/app_startup.dart';
import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/constants/spacing.dart';
import 'package:anystep/core/theme/colors.dart';
import 'package:anystep/core/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key, required this.onLoaded});
  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      loading: () => const AppStartupLoadingWidget(),
      error: (e, st) {
        Log.e("CRITICAL: App startup failed", e, st);
        return AppStartupErrorWidget(onRetry: () async => ref.invalidate(appStartupProvider));
      },
      data: (_) => onLoaded(context),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({super.key, required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AnyStepColors.brightBlue,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'An error occurred during startup.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AnyStepColors.white),
            ),
            const SizedBox(height: AnyStepSpacing.md16),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(
                'Retry',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: AnyStepColors.brightBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
