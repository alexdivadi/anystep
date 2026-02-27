import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/common/widgets/any_step_badge.dart';
import 'package:anystep/core/common/widgets/dropdown_section.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/events/presentation/widgets/did_attend_indicator.dart';
import 'package:anystep/core/features/events/presentation/widgets/external_link_tile.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_time_table.dart';
import 'package:anystep/core/features/location/utils/launch_map.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetailInfo extends StatelessWidget {
  const EventDetailInfo({super.key, required this.event});

  final EventModel event;

  void _showImagePreview(BuildContext context, String imageUrl) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Dialog(
            insetPadding: const EdgeInsets.all(AnyStepSpacing.md16),
            backgroundColor: Colors.transparent,
            child: InteractiveViewer(
              minScale: 0.8,
              maxScale: 4,
              child: Image.network(imageUrl, fit: BoxFit.contain),
            ),
          ),
        );
      },
    );
  }

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
                ? InkWell(
                    onTap: () => _showImagePreview(context, event.imageUrl!),
                    child: Image.network(
                      event.imageUrl!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox.shrink();
                      },
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          event.name,
                          style: Theme.of(context).textTheme.displayLarge,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
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
            DropdownText(
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
                event.isVirtual
                    ? loc.online
                    : event.address != null
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
              onTap: (!event.isVirtual && event.address != null)
                  ? () async {
                      try {
                        await openMap(event.address!);
                      } catch (e) {
                        Log.e('Error opening map', e);
                      }
                    }
                  : null,
            ),
            if (event.externalLink != null && event.externalLink!.trim().isNotEmpty)
              ExternalLinkTile(url: event.externalLink!, label: loc.externalLink),
            if (event.registrationDeadline != null)
              ListTile(
                leading: const Icon(Icons.event_busy),
                title: Text(loc.registrationDeadline),
                subtitle: Text(
                  DateFormat('MMM d, yyyy • h:mm a').format(event.registrationDeadline!.toLocal()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
