import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/presentation/reset_password/reset_password_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_screen_controller.g.dart';

@riverpod
class ResetPasswordScreenController extends _$ResetPasswordScreenController {
  @override
  ResetPasswordScreenState build() => const ResetPasswordScreenState();

  Future<void> updatePassword({required String password}) async {
    state = state.copyWith(isLoading: true, error: null, success: false);
    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.updatePassword(newPassword: password);
    if (result == null) {
      state = state.copyWith(isLoading: false, success: true);
    } else {
      state = state.copyWith(isLoading: false, error: result);
    }
  }
}
