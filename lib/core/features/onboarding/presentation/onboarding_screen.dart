import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anystep/core/features/onboarding/presentation/onboarding_screen_controller.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  static const String path = '/onboarding';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingScreenControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.isOnboarded
              ? const Center(child: Text('You are onboarded!'))
              : Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(onboardingScreenControllerProvider.notifier)
                        .completeOnboarding();
                  },
                  child: const Text('Complete Onboarding'),
                ),
              ),
    );
  }
}
