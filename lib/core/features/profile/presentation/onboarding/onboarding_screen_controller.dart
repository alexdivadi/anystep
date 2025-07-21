import 'dart:async';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/location/domain/address_model.dart';
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
      final address = AddressModel.withGeohash(
        street: values['street'],
        streetSecondary: values['streetSecondary'],
        city: values['city'],
        state: values['state'],
        country: values['country'],
        postalCode: values['postalCode'],
        isUserAddress: true,
      );
      final user = UserModel(
        email: authState!.email,
        address: address,
        firstName: values['firstName'],
        lastName: values['lastName'],
        ageGroup: values['ageGroup'],
        role: UserRole.volunteer,
        phoneNumber: values['phoneNumber'],
      );
      await ref.read(userRepositoryProvider).createOrUpdate(obj: user, documentId: authState.uid);
    });
    ref.invalidate(currentUserStreamProvider);
  }
}
