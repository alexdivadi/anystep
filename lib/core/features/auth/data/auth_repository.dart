import 'dart:async';
import 'package:anystep/database/client.dart';
import 'package:anystep/core/features/auth/domain/auth_state.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;

part 'auth_repository.g.dart';

class AuthRepository {
  final AppPreferences _appPreferences;
  final GoTrueClient _supabase;
  final StreamController<AuthState?> _authStateController =
      StreamController<AuthState?>.broadcast();
  Session? _session;
  User? _user;

  bool get isLoggedIn => _session != null;
  bool get isEmailConfirmed => _user?.emailConfirmedAt != null;
  String? get userId => _user?.id;

  AuthRepository._(this._appPreferences, this._supabase) {
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
    final userId = _appPreferences.getAuthStateJson();
    if (userId != null) {
      Log.i('Using locally stored session: $userId');
      if (_user != null) {
        yield AuthState(uid: userId, email: _user!.email ?? "", isCachedValue: true);
      } else {
        yield null;
      }
    }

    _session = _supabase.currentSession;
    _user = _supabase.currentUser;
    if (_session != null || _user != null) {
      final user = _user ?? _session?.user as User;
      Log.i('Current session: ${user.id}, email: ${user.email}');
      _appPreferences.setAuthStateJson(user.id);
      yield AuthState(uid: user.id, email: user.email ?? "", isCachedValue: false);
    } else {
      yield null;
    }

    yield* _supabase.onAuthStateChange.map((data) {
      final session = data.session;
      if (session != null) {
        _session = session;
        _user = session.user;
        _appPreferences.setAuthStateJson(_user!.id);
        Log.i('User logged in: ${_user!.email}');
        return AuthState(uid: session.user.id, email: _user!.email ?? '', isCachedValue: false);
      } else {
        Log.i('User logged out');
        _session = null;
        _user = null;
        _appPreferences.clearAuthStateJson();
        return null;
      }
    });
  }

  Future<String?> login({required String email, required String password}) async {
    try {
      await _supabase.signInWithPassword(email: email, password: password);
      return null;
    } on AuthApiException catch (e) {
      if (e.code == "email_not_confirmed") {
        Log.w('Email not confirmed for user: $email');
        return 'Please confirm your email address and try again. An email has been sent to you with instructions.';
      }
      return 'Login failed. Please try again.';
    } catch (e, st) {
      Log.e('Login failed', e, st);
      // _authStateController.add(null);
      return 'An error occurred';
    }
  }

  Future<String?> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      await _supabase.signUp(
        email: email,
        password: password,
        data: {'first_name': firstName, 'last_name': lastName},
      );
      await _supabase.signInWithPassword(email: email, password: password);
      return null;
    } on AuthApiException catch (e) {
      if (e.code == "email_not_confirmed") {
        Log.w('Email not confirmed for user: $email');
        return 'Please confirm your email address and try again. An email has been sent to you with instructions.';
      }
      return 'Signup failed. Please try again.';
    } catch (e, st) {
      Log.e('Signup failed', e, st);
      return 'An error occurred';
    }
  }

  Future<void> logout() async {
    try {
      await _supabase.signOut();
    } catch (e, st) {
      Log.e('Logout failed', e, st);
    } finally {
      _appPreferences.clearAuthStateJson();
      _session = null;
      _user = null;
      _authStateController.add(null);
    }
  }

  void dispose() {
    _authStateController.close();
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final appPreferences = ref.watch(appPreferencesProvider).requireValue;
  final account = ref.watch(clientProvider).auth;
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
