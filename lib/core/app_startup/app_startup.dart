import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anystep/core/shared_prefs/shared_prefs.dart';

part 'app_startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  ref.onDispose(() {
    ref.invalidate(appPreferencesProvider);
  });
  await Future.wait([ref.watch(appPreferencesProvider.future)]);
}
