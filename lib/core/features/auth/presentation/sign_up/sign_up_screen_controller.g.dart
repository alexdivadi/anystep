// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignUpScreenController)
const signUpScreenControllerProvider = SignUpScreenControllerProvider._();

final class SignUpScreenControllerProvider
    extends $NotifierProvider<SignUpScreenController, SignUpScreenState> {
  const SignUpScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpScreenControllerHash();

  @$internal
  @override
  SignUpScreenController create() => SignUpScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignUpScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignUpScreenState>(value),
    );
  }
}

String _$signUpScreenControllerHash() =>
    r'85c197ff6bab73b6cd37d5928144cc8e8b8d612e';

abstract class _$SignUpScreenController extends $Notifier<SignUpScreenState> {
  SignUpScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignUpScreenState, SignUpScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignUpScreenState, SignUpScreenState>,
              SignUpScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
