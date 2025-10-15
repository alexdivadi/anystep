import 'package:anystep/core/common/widgets/share_button.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShareEventButton extends StatelessWidget {
  const ShareEventButton({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return ShareButton(
      title: "Join AnyStep's event!",
      text: """
Please join us for AnyStep's ${event.name} 
on ${DateFormat('MMM dd, yyyy').format(event.startTime.toLocal())} 
at ${event.address?.city}, ${event.address?.state}. Stepping up for seniors in need!
""",
    );
  }
}
