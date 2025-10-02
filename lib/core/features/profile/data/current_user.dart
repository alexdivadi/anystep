import 'dart:convert';

import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
Stream<UserModel?> currentUserStream(Ref ref) async* {
  final pref = await ref.watch(appPreferencesProvider.future);
  final authState = ref.watch(authStateStreamProvider);

  final cachedUser = pref.getCurrentUser();
  if (cachedUser != null) {
    Log.d('Using cached user data');
    try {
      yield UserModel.fromJson(jsonDecode(cachedUser)).copyWith(isCachedValue: true);
    } catch (e) {
      Log.e('Error parsing cached user data', e);
      pref.clearCurrentUser();
    }
  }

  try {
    if (authState.valueOrNull == null) throw Exception('No user logged in');

    final user = await ref
        .read(userRepositoryProvider)
        .get(documentId: authState.requireValue!.uid);
    pref.setCurrentUser(jsonEncode(user.toJson()));
    yield user;
  } on AuthApiException catch (_) {
    pref.clearCurrentUser();
    yield null;
  } catch (e) {
    Log.e('Error fetching current user', e);
    pref.clearCurrentUser();
    yield null;
  }
}
