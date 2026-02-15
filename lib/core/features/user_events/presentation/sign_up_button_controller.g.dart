// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_button_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignUpButtonController)
const signUpButtonControllerProvider = SignUpButtonControllerProvider._();

final class SignUpButtonControllerProvider
    extends $AsyncNotifierProvider<SignUpButtonController, void> {
  const SignUpButtonControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpButtonControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpButtonControllerHash();

  @$internal
  @override
  SignUpButtonController create() => SignUpButtonController();
}

String _$signUpButtonControllerHash() =>
    r'df78a19fa5f056558f5e2eefe08fd40e04b7432d';

abstract class _$SignUpButtonController extends $AsyncNotifier<void> {
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
