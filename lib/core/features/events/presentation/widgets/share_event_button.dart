import 'package:anystep/core/common/widgets/share_button.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShareEventButton extends StatelessWidget {
  const ShareEventButton({super.key, required this.event});

  final EventModel event;

  static String buildShareTitle() => "Join AnyStep's event!";

  static String buildShareText(EventModel event) {
    return """
Please join us for AnyStep's ${event.name} 
on ${DateFormat('MMM dd, yyyy').format(event.startTime.toLocal())} 
at ${event.address?.city}, ${event.address?.state}. Stepping up for seniors in need!
""";
  }

  @override
  Widget build(BuildContext context) {
    return ShareButton(
      title: buildShareTitle(),
      text: buildShareText(event),
    );
  }
}
