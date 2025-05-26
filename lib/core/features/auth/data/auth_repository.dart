import 'package:anystep/appwrite/appwrite_client.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  const AuthRepository(this._appPreferences, this._account);
  final AppPreferences _appPreferences;
  final Account _account;

  Future<bool> login({required String email, required String password}) async {
    // TODO: Implement login logic (e.g., call API)
    await Future.delayed(Duration(seconds: 1));
    _appPreferences.setUserToken('fake_token');
    return true;
  }

  Future<bool> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final user = await _account.create(
      userId: ID.unique(),
      email: email,
      password: password,
      name: '$firstName $lastName',
    );
    final session = await _account.createEmailPasswordSession(email: email, password: password);
    _appPreferences.setUserToken(session.providerAccessToken);
    return true;
  }

  Future<void> logout() async {
    // TODO: Implement logout logic (e.g., clear token)
    await Future.delayed(Duration(milliseconds: 500));
    _appPreferences.clearUserToken();
  }

  bool get isLoggedIn => _appPreferences.getUserToken() != null;
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final appPreferences = ref.watch(appPreferencesProvider).requireValue;
  final account = Account(ref.watch(appwriteClientProvider));
  return AuthRepository(appPreferences, account);
}
