import 'dart:async';
import 'package:anystep/appwrite/appwrite_client.dart';
import 'package:anystep/core/features/auth/domain/auth_state.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' hide Log;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final AppPreferences _appPreferences;
  final Account _account;
  final StreamController<AuthState?> _authStateController =
      StreamController<AuthState?>.broadcast();
  Session? _session;
  User? _user;

  AuthRepository._(this._appPreferences, this._account) {
    _init();
  }

  Stream<AuthState?> get authStateStream => _authStateController.stream;
  User? get user => _user;
  Session? get session => _session;

  void _init() {
    getUserId().listen(
      (authState) {
        if (authState != null && _user != null) {
          _authStateController.add(authState);
        } else {
          _authStateController.add(null);
        }
      },
      onError: (error) {
        Log.e('Error fetching user ID', error);
        _authStateController.add(null);
      },
    );
  }

  Stream<AuthState?> getUserId() async* {
    final userId = _appPreferences.getUserId();
    if (userId != null) {
      Log.i('Using locally stored session: $userId');
      if (_user != null) {
        yield AuthState(uid: userId, email: _user!.email, isCachedValue: true);
      } else {
        yield null;
      }
    }
    try {
      _user = await _account.get();
      _session = await _account.getSession(sessionId: 'current');
      _appPreferences.setUserId(_session!.userId);
      Log.i('User session found: ${_session!.userId}');
      yield AuthState(uid: _session!.userId, email: _user!.email);
    } catch (e) {
      Log.i('User session not found');
      _appPreferences.clearUserId();
      yield null;
    }
  }

  Future<String?> login({required String email, required String password}) async {
    try {
      _session = await _account.createEmailPasswordSession(email: email, password: password);
      _user = await _account.get();
      _appPreferences.setUserId(_session!.userId);
      _authStateController.add(AuthState(uid: _session!.userId, email: _user!.email));
      return null;
    } on AppwriteException catch (e) {
      Log.e("AppwriteException during login", e);
      _authStateController.add(null);
      return e.message ?? 'An error occurred';
    } catch (e, st) {
      Log.e('Login failed', e, st);
      _authStateController.add(null);
      return 'An error occurred';
    }
  }

  Future<bool> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      _user = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: '$firstName $lastName',
      );
      _session = await _account.createEmailPasswordSession(email: email, password: password);
      _appPreferences.setUserId(_session!.$id);
      _authStateController.add(AuthState(uid: _session!.userId, email: _user!.email));
      return true;
    } catch (e, st) {
      Log.e('Signup failed', e, st);
      _authStateController.add(null);
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (e, st) {
      Log.e('Logout failed', e, st);
    } finally {
      _appPreferences.clearUserId();
      _session = null;
      _user = null;
      _authStateController.add(null);
    }
  }

  bool get isLoggedIn => _session?.userId != null;

  void dispose() {
    _authStateController.close();
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final appPreferences = ref.watch(appPreferencesProvider).requireValue;
  final account = Account(ref.watch(appwriteClientProvider));
  final authRepository = AuthRepository._(appPreferences, account);
  ref.onDispose(() {
    authRepository.dispose();
  });
  return authRepository;
}

@Riverpod(keepAlive: true)
Stream<AuthState?> authStateStream(Ref ref) async* {
  await ref.watch(appPreferencesProvider.future);
  final repo = ref.watch(authRepositoryProvider);
  yield* repo.authStateStream;
}
