import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/common/widgets/dropdown_section.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_time_table.dart';
import 'package:anystep/core/features/location/utils/launch_map.dart';
import 'package:flutter/material.dart';

class EventDetailInfo extends StatelessWidget {
  const EventDetailInfo({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
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
                )
                : const SizedBox.shrink(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AnyStepSpacing.md12,
                vertical: AnyStepSpacing.md16,
              ),
              child: Text(
                event.name,
                style: Theme.of(context).textTheme.displayLarge,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DropdownSection(
              title: Text('Description', style: Theme.of(context).textTheme.titleMedium),
              content: event.description ?? 'No description',
              maxLines: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(AnyStepSpacing.md16),
              child: EventTimeTable(event: event),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text('Address', style: Theme.of(context).textTheme.titleMedium),
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
                    : 'No address provided',
              ),
              onTap:
                  event.address != null
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
