import 'dart:convert';

import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
Stream<UserModel?> currentUserStream(Ref ref) async* {
  final pref = await ref.watch(appPreferencesProvider.future);

  final cachedUser = pref.getCurrentUser();
  if (cachedUser != null) {
    Log.d('Using cached user data');
    yield UserModel.fromJson(jsonDecode(cachedUser)).copyWith(isCachedValue: true);
  }

  try {
    final authState = await ref.watch(authStateStreamProvider.future);
    if (authState == null) throw Exception('No user logged in');

    final user = await ref.read(userRepositoryProvider).get(documentId: authState.uid);
    pref.setCurrentUser(jsonEncode(user.toJson()));
    yield user;
  } catch (e) {
    Log.e('Error fetching current user', e);
    pref.clearCurrentUser();
    yield null;
  }
}
