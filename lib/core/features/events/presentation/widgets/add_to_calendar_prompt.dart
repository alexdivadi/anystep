import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/events/utils/launch_calendar.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddToCalendarPrompt extends StatelessWidget {
  const AddToCalendarPrompt({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(AnyStepSpacing.md16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(loc.addToCalendarTitle, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AnyStepSpacing.sm8),
          Text(loc.addToCalendarBody, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: AnyStepSpacing.md16),
          ElevatedButton(
            onPressed: () async {
              try {
                await openGoogleCalendar(event);
                if (context.mounted) context.pop();
              } catch (e, st) {
                Log.e('Error opening calendar', e, st);
              }
            },
            child: Text(loc.addToCalendarCta),
          ),
          const SizedBox(height: AnyStepSpacing.sm8),
          TextButton(
            onPressed: () => context.pop(),
            child: Text(loc.addToCalendarDismiss),
          ),
        ],
      ),
    );
  }
}
