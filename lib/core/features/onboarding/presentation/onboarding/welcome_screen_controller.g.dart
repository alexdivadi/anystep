// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WelcomeScreenController)
const welcomeScreenControllerProvider = WelcomeScreenControllerProvider._();

final class WelcomeScreenControllerProvider
    extends $NotifierProvider<WelcomeScreenController, WelcomeScreenState> {
  const WelcomeScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'welcomeScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$welcomeScreenControllerHash();

  @$internal
  @override
  WelcomeScreenController create() => WelcomeScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WelcomeScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WelcomeScreenState>(value),
    );
  }
}

String _$welcomeScreenControllerHash() =>
    r'a6a3839f47e561a2462f5e288dc3b3df736a2136';

abstract class _$WelcomeScreenController extends $Notifier<WelcomeScreenState> {
  WelcomeScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<WelcomeScreenState, WelcomeScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WelcomeScreenState, WelcomeScreenState>,
              WelcomeScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
