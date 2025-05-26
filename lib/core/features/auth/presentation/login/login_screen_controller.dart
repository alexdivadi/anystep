import 'package:anystep/core/features/auth/presentation/login/login_screen_state.dart';
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
      final repo = ref.read(authRepositoryProvider);
      final result = await repo.login(email: email, password: password);
      if (result) {
        state = state.copyWith(isLoading: false, success: true);
      } else {
        state = state.copyWith(isLoading: false, error: 'Login failed');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
