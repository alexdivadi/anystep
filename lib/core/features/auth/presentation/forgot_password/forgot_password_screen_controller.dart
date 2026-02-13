import 'package:anystep/core/config/router/deep_link_config.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/presentation/forgot_password/forgot_password_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_screen_controller.g.dart';

@riverpod
class ForgotPasswordScreenController extends _$ForgotPasswordScreenController {
  @override
  ForgotPasswordScreenState build() => const ForgotPasswordScreenState();

  Future<void> sendResetEmail({required String email}) async {
    state = state.copyWith(isLoading: true, error: null, success: false);
    final authRepository = ref.read(authRepositoryProvider);
    final redirectTo = DeepLinkConfig.passwordResetRedirect().toString();
    final result = await authRepository.sendPasswordReset(
      email: email,
      redirectTo: redirectTo,
    );
    if (result == null) {
      state = state.copyWith(isLoading: false, success: true);
    } else {
      state = state.copyWith(isLoading: false, error: result);
    }
  }
}
