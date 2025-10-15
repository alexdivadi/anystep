import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/user_events/data/user_event_repository.dart';
import 'package:anystep/core/features/user_events/domain/sign_up_status.dart';
import 'package:anystep/database/pagination_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_status.g.dart';

/// Fetches the sign-up status for a specific event.
/// It checks if the user can sign up, if they have already signed up,
/// and retrieves the user event details if available.
////// Returns a [SignUpStatus] containing the sign-up information or an error message.
@riverpod
Future<SignUpStatus> signUpStatus(Ref ref, int eventId) async {
  try {
    final [userEvents as PaginationResult, event as EventModel] = await Future.wait([
      ref.watch(getCurrentUserEventsProvider(eventId: eventId).future),
      ref.watch(getEventProvider(eventId).future),
    ]);
    return SignUpStatus.data(
      didSignUp: userEvents.totalCount > 0,
      canSignUp: event.startTime.isAfter(DateTime.now()),
      userEvent: userEvents.items.isNotEmpty ? userEvents.items.first : null,
    );
  } catch (e) {
    return SignUpStatus.error(e.toString());
  }
}
