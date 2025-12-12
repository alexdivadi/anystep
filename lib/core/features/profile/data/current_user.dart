import 'dart:convert';

import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/config/posthog/posthog_manager.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'current_user.g.dart';

Map<String, Object> _removeNulls(Map<String, dynamic>? map) {
  final result = <String, Object>{};
  map?.forEach((key, value) {
    if (value != null) {
      result[key] = value;
    }
  });
  return result;
}

@Riverpod(keepAlive: true)
Stream<UserModel?> currentUserStream(Ref ref) async* {
  final pref = await ref.watch(appPreferencesProvider.future);
  final authState = ref.watch(authStateStreamProvider);

  final cachedUser = pref.getCurrentUser();
  if (cachedUser != null) {
    Log.d('Using cached user data');
    try {
      final userMap = jsonDecode(cachedUser);
      PostHogManager.identify(userMap['id'] as String, properties: {..._removeNulls(userMap)});
      yield UserModel.fromJson(userMap).copyWith(isCachedValue: true);
    } catch (e) {
      Log.e('Error parsing cached user data', e);
      pref.clearCurrentUser();
      PostHogManager.reset();
    }
  }

  try {
    if (authState.value == null) throw Exception('No user logged in');

    final user = await ref
        .read(userRepositoryProvider)
        .get(documentId: authState.requireValue!.uid);
    PostHogManager.identify(user.id, properties: _removeNulls(user.toJson()));
    pref.setCurrentUser(jsonEncode(user.toJson()));
    yield user;
  } on AuthApiException catch (_) {
    pref.clearCurrentUser();
    PostHogManager.reset();
    yield null;
  } catch (e) {
    Log.e('Error fetching current user', e);
    pref.clearCurrentUser();
    PostHogManager.reset();
    yield null;
  }
}
