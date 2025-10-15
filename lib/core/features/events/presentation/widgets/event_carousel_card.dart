import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/events/presentation/widgets/did_attend_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A compact card optimized for horizontal carousels.
/// - Fixed width
/// - Image (or icon placeholder) on top
/// - Event name, date/location, and optional description snippet
class EventCarouselCard extends StatelessWidget {
  const EventCarouselCard({super.key, required this.event, this.onTap, this.width = 220});

  final EventModel event;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateStr = DateFormat('MMM d • h:mm a').format(event.startTime.toLocal());
    final locationStr = [
      event.address?.city,
      event.address?.state,
    ].where((e) => e != null && e.isNotEmpty).join(', ');

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
      child: Ink(
        width: width,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withAlpha(20),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImageHeader(imageUrl: event.imageUrl),
            Padding(
              padding: const EdgeInsets.all(AnyStepSpacing.sm8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          event.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      if (event.id != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, top: 2.0),
                          child: DidAttendIndicator(eventId: event.id!),
                        ),
                    ],
                  ),
                  const SizedBox(height: AnyStepSpacing.sm4),
                  Text(
                    dateStr + (locationStr.isNotEmpty ? ' • $locationStr' : ''),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withAlpha(191),
                    ),
                  ),
                  if (event.description != null && event.description!.isNotEmpty) ...[
                    const SizedBox(height: AnyStepSpacing.sm4),
                    Text(
                      event.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({required this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AnyStepSpacing.sm8),
        topRight: Radius.circular(AnyStepSpacing.sm8),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child:
            imageUrl != null && imageUrl!.isNotEmpty
                ? Image.network(imageUrl!, fit: BoxFit.cover)
                : Container(
                  color: theme.highlightColor.withAlpha(38),
                  child: Icon(Icons.event, size: 40, color: theme.highlightColor),
                ),
      ),
    );
  }
}
