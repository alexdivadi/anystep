import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_loading_indicator.dart';
import 'package:anystep/core/features/events/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anystep/core/features/onboarding/presentation/onboarding/welcome_screen_controller.dart';
import 'package:go_router/go_router.dart';

/// Multi-page onboarding / welcome flow.
/// Shows 3 pages in a PageView with a dot indicator. The final page displays
/// a "Get Started" button which completes onboarding.
class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  static const String path = '/welcome';

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  final _controller = PageController();
  int _index = 0;
  static const _pageCount = 3;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_index < _pageCount - 1) {
      _controller.animateToPage(
        _index + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(welcomeScreenControllerProvider);

    if (state.isLoading) {
      return const Scaffold(body: Center(child: AnyStepLoadingIndicator()));
    }

    // If already onboarded, show quick success screen with navigation option.
    if (state.isOnboarded) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('You are onboarded!'),
                const SizedBox(height: AnyStepSpacing.md20),
                ElevatedButton(
                  onPressed: () => context.go(EventFeedScreen.path),
                  child: const Text('Go to Event Feed'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final isLast = _index == _pageCount - 1;

    return Scaffold(
      // No AppBar per requirements.
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _index = i),
                children: const [
                  _OnboardingPage(
                    title: 'Welcome to AnyStep',
                    description: 'Track and discover volunteer events easily.',
                  ),
                  _OnboardingPage(
                    title: 'Find Events',
                    description: 'Browse nearby opportunities that fit your passion.',
                  ),
                  _OnboardingPage(
                    title: 'Make an Impact',
                    description: 'Join events and measure the difference you make.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: AnyStepSpacing.md20),
            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pageCount,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _index == i ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        _index == i
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primary.withAlpha(80),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AnyStepSpacing.md20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  if (!isLast)
                    TextButton(
                      onPressed: () => _controller.jumpToPage(_pageCount - 1),
                      child: const Text('Skip'),
                    ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      if (isLast) {
                        await ref
                            .read(welcomeScreenControllerProvider.notifier)
                            .completeOnboarding();
                        if (mounted && context.mounted) {
                          context.go(EventFeedScreen.path);
                        }
                      } else {
                        _goNext();
                      }
                    },
                    child: Text(isLast ? 'Get Started' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AnyStepSpacing.md20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
