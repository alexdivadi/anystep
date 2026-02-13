import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_loading_indicator.dart';
import 'package:anystep/core/common/widgets/any_step_scaffold.dart';
import 'package:anystep/core/features/events/presentation/screens.dart';
// import 'package:anystep/core/features/notifications/presentation/event_notifications_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anystep/core/features/onboarding/presentation/onboarding/welcome_screen_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:anystep/core/features/settings/presentation/locale_setting.dart';

/// Multi-page onboarding / welcome flow.
/// Shows 4 pages in a PageView with a dot indicator. The final page displays
/// a "Get Started" button which completes onboarding.
class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  static const String path = '/welcome';
  static const String name = 'welcome';

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

  void _submitOnboarding() async {
    await ref.read(welcomeScreenControllerProvider.notifier).completeOnboarding();
    if (mounted && context.mounted) {
      context.go(EventFeedScreen.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(welcomeScreenControllerProvider);
    final loc = AppLocalizations.of(context);

    if (state.isLoading) {
      return const AnyStepScaffold(body: Center(child: AnyStepLoadingIndicator()));
    }

    // If already onboarded, show quick success screen with navigation option.
    if (state.isOnboarded) {
      return AnyStepScaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(loc.onboardingCompleteTitle),
                const SizedBox(height: AnyStepSpacing.md20),
                ElevatedButton(
                  onPressed: () => context.go(EventFeedScreen.path),
                  child: Text(loc.goToEventFeed),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final isLast = _index == _pageCount - 1;

    return AnyStepScaffold(
      // No AppBar per requirements.
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _index = i),
                children: [
                  _OnboardingPage(
                    title: loc.onboardingWelcomeTitle,
                    description: loc.onboardingWelcomeDesc,
                  ),
                  _OnboardingPage(title: loc.changeLanguage, extra: const LocaleSetting()),
                  // _OnboardingPage(
                  //   title: loc.onboardingNotificationsTitle,
                  //   description: loc.onboardingNotificationsDesc,
                  //   extra: EventNotificationsTile(
                  //     title: loc.eventNotificationsTitle,
                  //     subtitle: loc.eventNotificationsDescription,
                  //     dense: true,
                  //   ),
                  // ),
                  _OnboardingPage(
                    title: loc.onboardingImpactTitle,
                    description: loc.onboardingImpactDesc,
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
                    color: _index == i
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
                  if (!isLast) TextButton(onPressed: _submitOnboarding, child: Text(loc.skip)),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      if (isLast) {
                        _submitOnboarding();
                      } else {
                        _goNext();
                      }
                    },
                    child: Text(isLast ? loc.getStarted : loc.next),
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
  const _OnboardingPage({required this.title, this.description, this.extra});

  final String title;
  final String? description;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: AnyStepSpacing.lg32, vertical: AnyStepSpacing.md24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          if (description != null) ...[
            const SizedBox(height: AnyStepSpacing.md20),
            Text(
              description!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
          if (extra != null) ...[const SizedBox(height: AnyStepSpacing.md20), extra!],
        ],
      ),
    );
  }
}
