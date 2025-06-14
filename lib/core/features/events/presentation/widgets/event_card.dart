import 'package:flutter/material.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/common/constants/spacing.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;
  const EventCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AnyStepSpacing.md12,
        vertical: AnyStepSpacing.sm6,
      ),
      child: ListTile(
        onTap: onTap,
        leading:
            event.imageUrl != null && event.imageUrl!.isNotEmpty
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
                  child: Image.network(
                    event.imageUrl!,
                    width: AnyStepSpacing.xl56,
                    height: AnyStepSpacing.xl56,
                    fit: BoxFit.cover,
                  ),
                )
                : Container(
                  width: AnyStepSpacing.xl56,
                  height: AnyStepSpacing.xl56,
                  decoration: BoxDecoration(
                    color: AnyStepColors.grayDark.withAlpha(20),
                    borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
                  ),
                  child: Icon(Icons.event, color: AnyStepColors.navyDark),
                ),
        title: Text(
          event.template?.name ?? event.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${event.startTime} • ${event.address.city}, ${event.address.state}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AnyStepColors.navyDark),
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
