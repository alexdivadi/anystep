import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/datetime.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventTimeTable extends StatelessWidget {
  const EventTimeTable({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final isSameDay = event.startTime.isSameDay(event.endTime);
    final duration = event.startTime.difference(event.endTime).inHours.abs();
    final loc = AppLocalizations.of(context);
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
      },
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
              child: Text(loc.start, style: Theme.of(context).textTheme.titleMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AnyStepSpacing.sm4,
                horizontal: AnyStepSpacing.md12,
              ),
              child: Text(DateFormat.yMEd().format(event.startTime.toLocal())),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
              child: Text(
                DateFormat.jm().format(event.startTime.toLocal()),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
              child: Text(loc.end, style: Theme.of(context).textTheme.titleMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AnyStepSpacing.sm4,
                horizontal: AnyStepSpacing.md12,
              ),
              child: isSameDay
                  ? const SizedBox()
                  : Text(DateFormat.yMEd().format(event.endTime.toLocal())),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
              child: Text(
                DateFormat.jm().format(event.endTime.toLocal()),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        if (isSameDay)
          TableRow(
            children: [
              const SizedBox(),
              const SizedBox(), // Empty cell for alignment
              event.isVolunteerEligible
                  ? AnyStepBadge(
                      child: Text(
                        loc.hours(duration, duration != 1 ? 's' : ''),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: AnyStepSpacing.sm4),
                      child: Text(
                        loc.notEligibleVolunteerHours,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
            ],
          ),
      ],
    );
  }
}
