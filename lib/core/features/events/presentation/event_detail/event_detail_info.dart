import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/common/widgets/any_step_badge.dart';
import 'package:anystep/core/common/widgets/dropdown_section.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/events/presentation/widgets/did_attend_indicator.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_time_table.dart';
import 'package:anystep/core/features/location/utils/launch_map.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class EventDetailInfo extends StatelessWidget {
  const EventDetailInfo({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final isPast = event.endTime.isBefore(DateTime.now());
    final loc = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(AnyStepSpacing.md16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            event.imageUrl != null
                ? Image.network(
                    event.imageUrl!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox.shrink();
                    },
                  )
                : const SizedBox.shrink(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AnyStepSpacing.md12,
                vertical: AnyStepSpacing.md16,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        event.name,
                        style: Theme.of(context).textTheme.displayLarge,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (isPast && event.id != null)
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AnyStepSpacing.sm4,
                            top: AnyStepSpacing.sm2,
                          ),
                          child: DidAttendIndicator(eventId: event.id!),
                        ),
                    ],
                  ),
                  if (isPast) ...[
                    const SizedBox(height: AnyStepSpacing.sm8),
                    Row(
                      children: [
                        AnyStepBadge(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AnyStepColors.greenDark.withAlpha(180)
                              : AnyStepColors.green.withAlpha(120),
                          child: Text(
                            loc.completed,
                            style: TextStyle(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? AnyStepColors.green
                                  : AnyStepColors.greenDark.withAlpha(200),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            DropdownSection(
              title: Text(loc.description, style: Theme.of(context).textTheme.titleMedium),
              content: event.description ?? loc.noDescription,
              maxLines: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(AnyStepSpacing.md16),
              child: EventTimeTable(event: event),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(loc.address, style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(
                event.address != null
                    ? event.address!.street +
                          ((event.address!.streetSecondary ?? '').isNotEmpty
                              ? ' ${event.address!.streetSecondary}'
                              : '') +
                          (event.address!.city.isNotEmpty ? '\n${event.address!.city}' : '') +
                          (event.address!.state.isNotEmpty ? ', ${event.address!.state}' : '') +
                          (event.address!.postalCode.isNotEmpty
                              ? ' ${event.address!.postalCode}'
                              : '')
                    : loc.noAddressProvided,
              ),
              onTap: event.address != null
                  ? () async {
                      try {
                        await openMap(event.address!);
                      } catch (e) {
                        Log.e('Error opening map', e);
                      }
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
