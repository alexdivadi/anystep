import 'package:anystep/appwrite/appwrite_client.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' hide Log;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anystep/core/utils/log_utils.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
class AuthRepository extends _$AuthRepository {
  AuthRepository();
  late final AppPreferences _appPreferences;
  late final Account _account;
  Session? _session;
  User? _user;

  User? get user => _user;
  Session? get session => _session;

  @override
  Future<String?> build() async {
    _appPreferences = ref.watch(appPreferencesProvider).requireValue;
    _account = Account(ref.watch(appwriteClientProvider));
    try {
      _user = await _account.get();
      _session = await _account.getSession(sessionId: 'current');
      _appPreferences.setSessionId(_session!.$id);
      return _user!.$id;
    } catch (e) {
      Log.i('User session not found');
      _appPreferences.clearSessionId();
      return null;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    state = await AsyncValue.guard(() async {
      _session = await _account.createEmailPasswordSession(email: email, password: password);
      _user = await _account.get();
      _appPreferences.setSessionId(_session!.$id);
      return _session!.userId;
    });
    return true;
  }

  Future<bool> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    state = await AsyncValue.guard(() async {
      _user = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: '$firstName $lastName',
      );
      _session = await _account.createEmailPasswordSession(email: email, password: password);
      _appPreferences.setSessionId(_session!.$id);
      return _session!.userId;
    });
    return true;
  }

  Future<void> logout() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (e, st) {
      Log.e('Logout failed', e, st);
    } finally {
      _appPreferences.clearSessionId();
      _session = null;
      _user = null;
      state = AsyncValue.data(null);
    }
  }

  bool get isLoggedIn => state.valueOrNull != null;
}
