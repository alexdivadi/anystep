import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/events/presentation/widgets/did_attend_indicator.dart';
import 'package:anystep/core/features/events/presentation/widgets/did_sign_up_indicator.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export 'event_card_error.dart';
export 'event_card_shimmer.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;
  const EventCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isPast = event.endTime.isBefore(DateTime.now().toLocal());
    final loc = AppLocalizations.of(context);
    final locationLabel =
        event.isVirtual ? loc.online : '${event.address?.city}, ${event.address?.state}';
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AnyStepSpacing.md12,
        vertical: AnyStepSpacing.sm6,
      ),
      child: ListTile(
        onTap: onTap,
        leading: event.imageUrl != null && event.imageUrl!.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
                child: Image.network(
                  event.imageUrl!,
                  width: AnyStepSpacing.xl56,
                  height: AnyStepSpacing.xl56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const _ImagePlaceholder(),
                ),
              )
            : const _ImagePlaceholder(),
        title: Row(
          children: [
            Expanded(
              child: Text(
                event.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(width: AnyStepSpacing.sm8),
            isPast
                ? DidAttendIndicator(eventId: event.id!)
                : DidSignUpIndicator(eventId: event.id!),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${DateFormat('MMM dd, yyyy @ h:mm a').format(event.startTime.toLocal())} • $locationLabel',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            if (event.description != null && event.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: AnyStepSpacing.sm4),
                child: Text(
                  event.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          ],
        ),
        isThreeLine: event.description != null && event.description!.isNotEmpty,
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/event_placeholder_img.png',
      width: AnyStepSpacing.xl56,
      height: AnyStepSpacing.xl56,
    );
  }
}
