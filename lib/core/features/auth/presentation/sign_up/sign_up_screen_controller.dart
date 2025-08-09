import 'package:anystep/core/features/auth/presentation/sign_up/sign_up_screen_state.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
part 'sign_up_screen_controller.g.dart';

@riverpod
class SignUpScreenController extends _$SignUpScreenController {
  @override
  SignUpScreenState build() => const SignUpScreenState();

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authRepository = ref.read(authRepositoryProvider);
      final result = await authRepository.signup(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      if (result == null) {
        state = state.copyWith(isLoading: false, success: true);
        Log.d('Sign up successful, user created');
      } else {
        state = state.copyWith(isLoading: false, error: result);
      }
    } catch (e, st) {
      Log.e("Error signing up", e, st);
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
