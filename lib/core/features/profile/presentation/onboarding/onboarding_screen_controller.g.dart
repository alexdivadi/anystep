// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnboardingScreenController)
const onboardingScreenControllerProvider =
    OnboardingScreenControllerProvider._();

final class OnboardingScreenControllerProvider
    extends $AsyncNotifierProvider<OnboardingScreenController, void> {
  const OnboardingScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingScreenControllerHash();

  @$internal
  @override
  OnboardingScreenController create() => OnboardingScreenController();
}

String _$onboardingScreenControllerHash() =>
    r'abcf3fd725b579ae6a2a9e52fe266d7434aedbb7';

abstract class _$OnboardingScreenController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
