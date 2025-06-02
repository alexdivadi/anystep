import 'package:anystep/core/features/auth/presentation/login/login_screen_state.dart';
import 'package:anystep/core/utils/log_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
part 'login_screen_controller.g.dart';

@riverpod
class LoginScreenController extends _$LoginScreenController {
  @override
  LoginScreenState build() => const LoginScreenState();

  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authRepository = ref.read(authRepositoryProvider.notifier);
      final result = await authRepository.login(email: email, password: password);
      if (result) {
        state = state.copyWith(isLoading: false, success: true);
        Log.d("Login successful");
      } else {
        state = state.copyWith(isLoading: false, error: 'Login failed');
      }
    } catch (e, st) {
      Log.e("Error logging in", e, st);
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
