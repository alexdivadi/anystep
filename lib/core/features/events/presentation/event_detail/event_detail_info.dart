import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/events/domain/event.dart';
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
            ListTile(title: Text('Name'), subtitle: Text(event.name)),
            ListTile(
              title: Text('Description'),
              subtitle: Text(event.description ?? 'No description'),
            ),
            ListTile(title: Text('Start Time'), subtitle: Text(event.startTime.toString())),
            ListTile(title: Text('End Time'), subtitle: Text(event.endTime.toString())),
            ListTile(
              title: Text('Address'),
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
            ),
          ],
        ),
      ),
    );
  }
}
