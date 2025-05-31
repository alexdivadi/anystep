import 'package:anystep/core/shared_prefs/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_repository.g.dart';

@Riverpod(keepAlive: true)
class OnboardingRepository extends _$OnboardingRepository {
  OnboardingRepository();
  late final AppPreferences _prefs;

  @override
  FutureOr<bool> build() async {
    _prefs = await ref.watch(appPreferencesProvider.future);
    return _prefs.isOnboarded();
  }

  Future<void> setOnboarded() async {
    await _prefs.setIsOnboarded(isOnboarded: true);
    state = AsyncValue.data(true);
  }

  Future<void> clearOnboarded() async {
    await _prefs.clearIsOnboarded();
    state = AsyncValue.data(false);
  }
}
