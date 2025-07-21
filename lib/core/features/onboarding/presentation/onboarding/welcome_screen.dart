import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/events/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anystep/core/features/onboarding/presentation/onboarding/welcome_screen_controller.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  static const String path = '/welcome';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(welcomeScreenControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.isOnboarded
              ? Center(
                child: Column(
                  children: [
                    const Text('You are onboarded!'),
                    const SizedBox(height: AnyStepSpacing.md20),
                    ElevatedButton(
                      onPressed: () => context.go(EventFeedScreen.path),
                      child: const Text('Go to Event Feed'),
                    ),
                  ],
                ),
              )
              : Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await ref.read(welcomeScreenControllerProvider.notifier).completeOnboarding();
                  },
                  child: const Text('Complete Onboarding'),
                ),
              ),
    );
  }
}
