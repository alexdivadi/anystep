import 'package:anystep/core/app_startup/app_startup.dart';
import 'package:anystep/core/widgets/any_step_loading_indicator.dart';
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
        return AppStartupErrorWidget(
          onRetry: () async {
            ref.invalidate(appStartupProvider);
          },
        );
      },
      data: (_) => onLoaded(context),
    );
  }
}

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: AnyStepLoadingIndicator());
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({super.key, required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('An error occurred during startup.'),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
