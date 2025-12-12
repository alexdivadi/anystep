import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/location/domain/address_model.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_screen_controller_state.dart';
import 'package:anystep/database/storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_screen_controller.g.dart';

@riverpod
class ProfileScreenController extends _$ProfileScreenController {
  @override
  ProfileScreenControllerState build() => ProfileScreenControllerState();

  Future<void> save(Map<String, dynamic> values, {XFile? image}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authState = ref.read(authStateStreamProvider).requireValue!;
      if (image != null) {
        final storage = ref.read(storageProvider);
        final bytes = await image.readAsBytes();
        final fileName = await storage.upsertProfileImage(bytes: bytes, userId: authState.uid);
        Log.d('Profile image uploaded: $fileName');
      }

      final currentUser = ref.read(currentUserStreamProvider).requireValue!;
      final user = currentUser.copyWith(
        id: authState.uid,
        firstName: values['firstName'],
        lastName: values['lastName'],
        phoneNumber: values['phoneNumber'],
        address: AddressModel(
          street: values['street'],
          streetSecondary: values['streetSecondary'],
          city: values['city'],
          state: values['state'],
          country: "US",
          postalCode: values['postalCode'],
          isUserAddress: true,
        ),
        ageGroup: values['ageGroup'],
      );
      await ref.read(userRepositoryProvider).createOrUpdate(obj: user, documentId: authState.uid);

      PostHogManager.capture('profile_updated', properties: {'user_id': user.id});

      state = state.copyWith(isLoading: false, error: null);
    } on AuthApiException catch (e) {
      Log.e('Error saving user profile: ${e.message}', e);
      state = state.copyWith(
        isLoading: false,
        error: "Something went wrong. Please try again later.",
      );
    } catch (e, st) {
      Log.e('Error saving user profile: $e', e, st);
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
