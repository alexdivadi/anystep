import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String _formatUtcForCalendar(DateTime dateTime) {
  return DateFormat("yyyyMMdd'T'HHmmss'Z'").format(dateTime.toUtc());
}

Uri buildGoogleCalendarUrl(EventModel event) {
  final start = _formatUtcForCalendar(event.startTime);
  final end = _formatUtcForCalendar(event.endTime);
  final params = <String, String>{
    'action': 'TEMPLATE',
    'text': event.name,
    'dates': '$start/$end',
  };
  final description = (event.description ?? '').trim();
  if (description.isNotEmpty) {
    params['details'] = description;
  }
  final address = event.address?.formattedAddress;
  if (address != null && address.trim().isNotEmpty) {
    params['location'] = address.trim();
  }
  return Uri.https('calendar.google.com', '/calendar/render', params);
}

Future<void> openGoogleCalendar(EventModel event) async {
  final url = buildGoogleCalendarUrl(event);

  PostHogManager.capture(
    'calendar_add_clicked',
    properties: {
      'event_id': event.id ?? '',
      'start_time': event.startTime.toIso8601String(),
      'end_time': event.endTime.toIso8601String(),
    },
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch calendar';
  }
}
