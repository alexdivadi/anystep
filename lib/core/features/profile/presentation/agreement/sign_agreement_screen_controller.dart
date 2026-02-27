import 'dart:async';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_agreement_screen_controller.g.dart';

@riverpod
class SignAgreementScreenController extends _$SignAgreementScreenController {
  @override
  FutureOr<void> build() {}

  Future<void> signAgreement() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final auth = await ref.read(authStateStreamProvider.future);
      final repo = ref.read(userRepositoryProvider);
      final user = await repo.findByAuthId(authId: auth!.uid);
      if (user == null) {
        throw StateError('No user found for auth_id');
      }
      final updated = user.copyWith(agreementSignedOn: DateTime.now());
      Log.d('Signing agreement for user: ${user.id}');
      await repo.createOrUpdate(obj: updated, documentId: user.id);
    });
    // refresh current user cache/stream so UI reacts
    ref.invalidate(currentUserStreamProvider);
  }
}
