import 'package:anystep/core/common/widgets/any_step_fade.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/user_events/data/user_event_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DidAttendIndicator extends ConsumerWidget {
  const DidAttendIndicator({super.key, required this.eventId, this.userId, this.size});

  final int eventId;
  final String? userId;
  final double? size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpStatusAsync =
        userId != null
            ? ref.watch(getUserEventsProvider(eventId: eventId, userId: userId!))
            : ref.watch(getCurrentUserEventsProvider(eventId: eventId));
    return signUpStatusAsync.maybeWhen(
      data: (uevents) {
        if (uevents.items.isEmpty) {
          return const SizedBox.shrink();
        } else {
          final userEvent = uevents.items.first;
          return Container(
            width: size ?? 12,
            height: size ?? 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
            ),
            child: AnyStepFade(
              child:
                  userEvent.attended
                      ? Icon(Icons.check_circle, color: AnyStepColors.green, size: size)
                      : Icon(Icons.cancel, color: AnyStepColors.red, size: size),
            ),
          );
        }
      },
      orElse: SizedBox.shrink,
    );
  }
}
