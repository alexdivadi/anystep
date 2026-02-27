import 'dart:async';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_screen_controller.g.dart';

@riverpod
class OnboardingScreenController extends _$OnboardingScreenController {
  @override
  FutureOr<void> build() {}

  Future<void> updateUserDetails({required Map<String, dynamic> values}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final authState = await ref.read(authStateStreamProvider.future);
      final authRepo = ref.read(authRepositoryProvider);
      Log.d(authRepo.userId ?? 'No session found');
      Log.d('Fetching user details for Email: ${authRepo.user?.email}');
      final addressId = values['addressId'];
      final userRepo = ref.read(userRepositoryProvider);
      final existing = await userRepo.findByEmail(email: authState!.email);
      final addressValue =
          addressId is int ? addressId : int.tryParse(addressId?.toString() ?? '');
      if (existing == null) {
        final created = UserModel(
          id: authState.uid,
          email: authState.email,
          authId: authState.uid,
          addressId: addressValue,
          firstName: values['firstName'],
          lastName: values['lastName'],
          ageGroup: values['ageGroup'],
          role: UserRole.volunteer,
          phoneNumber: values['phoneNumber'],
        );
        await userRepo.createOrUpdate(obj: created, documentId: authState.uid);
      } else {
        final updated = existing.copyWith(
          authId: authState.uid,
          addressId: addressValue,
          firstName: values['firstName'],
          lastName: values['lastName'],
          ageGroup: values['ageGroup'],
          role: existing.role,
          phoneNumber: values['phoneNumber'],
        );
        await userRepo.createOrUpdate(obj: updated, documentId: existing.id);
      }

      PostHogManager.capture(
        'user_onboarding_completed',
        properties: <String, Object>{'user_id': authState.uid},
      );
    });
    ref.invalidate(currentUserStreamProvider);
  }
}
