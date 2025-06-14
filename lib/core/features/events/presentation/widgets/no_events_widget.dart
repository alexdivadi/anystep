import 'package:flutter/material.dart';
import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/config/theme/colors.dart';

class NoEventsWidget extends StatefulWidget {
  const NoEventsWidget({super.key});

  @override
  State<NoEventsWidget> createState() => _NoEventsWidgetState();
}

class _NoEventsWidgetState extends State<NoEventsWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeIn,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.event_busy,
              size: AnyStepSpacing.xl64,
              color: AnyStepColors.grayDark.withAlpha(30),
            ),
            const SizedBox(height: AnyStepSpacing.md16),
            Text(
              'No events found',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AnyStepColors.navyDark),
            ),
            const SizedBox(height: AnyStepSpacing.sm8),
            Text(
              'Check back later for updates',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AnyStepColors.grayDark.withAlpha(120)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AnyStepSpacing.lg48),
          ],
        ),
      ),
    );
  }
}
