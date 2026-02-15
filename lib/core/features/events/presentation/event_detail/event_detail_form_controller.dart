import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form_state.dart';
import 'package:anystep/database/storage.dart'; // Added import for storage provider
import 'package:image_picker/image_picker.dart'; // Import XFile for image upload
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_detail_form_controller.g.dart';

@riverpod
class EventDetailFormController extends _$EventDetailFormController {
  @override
  EventDetailFormState build(int? eventId) => EventDetailFormState(eventId: eventId);

  Future<bool> createOrUpdateEvent(Map<String, dynamic> values, {XFile? image}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final maxVolunteersRaw = values['maxVolunteers'];
      final maxVolunteers = (maxVolunteersRaw == null || maxVolunteersRaw.toString().trim().isEmpty)
          ? null
          : int.tryParse(maxVolunteersRaw.toString());
      final externalLinkRaw = values['externalLink'];
      final externalLink =
          (externalLinkRaw == null || externalLinkRaw.toString().trim().isEmpty)
              ? null
              : externalLinkRaw.toString();
      final addressIdRaw = values['addressId'];
      final addressId =
          addressIdRaw is int ? addressIdRaw : int.tryParse(addressIdRaw?.toString() ?? '');

      final event = EventModel(
        id: state.eventId,
        name: values['name']!,
        startTime: (values['startTime'] as DateTime).toUtc(),
        endTime: (values['endTime'] as DateTime).toUtc(),
        imageUrl: values['imageUrl'],
        addressId: addressId,
        description: values['description'],
        isVolunteerEligible: values['isVolunteerEligible'] ?? true,
        maxVolunteers: maxVolunteers,
        registrationDeadline: (values['registrationDeadline'] as DateTime?)?.toUtc(),
        externalLink: externalLink,
      );

      String? imageUrl;
      if (image != null) {
        final bytes = await image.readAsBytes();
        final storage = ref.read(storageProvider);
        imageUrl = await storage.upsertPublicImage(bytes: bytes, fileName: image.name);
      }
      final repo = ref.read(eventRepositoryProvider);
      await repo.createOrUpdate(
        obj: event.copyWith(imageUrl: imageUrl ?? event.imageUrl),
        documentId: "${event.id}",
      );

      PostHogManager.capture(
        state.eventId == null ? 'event_created' : 'event_updated',
        properties: {
          'event_id': state.eventId ?? '',
          'name': event.name,
          'start_time': event.startTime.toIso8601String(),
          'end_time': event.endTime.toIso8601String(),
          'image_url': imageUrl ?? event.imageUrl ?? '',
          'city': event.address?.city ?? '',
          'state': event.address?.state ?? '',
        },
      );

      if (state.eventId != null) ref.invalidate(getEventProvider(state.eventId!));
      ref.invalidate(getEventsProvider);
      state = state.copyWith(isLoading: false, error: null);
      return true;
    } catch (e) {
      Log.e('Error creating/updating event: $e');
      state = state.copyWith(isLoading: false, error: e.toString());
    }
    return false;
  }
}
