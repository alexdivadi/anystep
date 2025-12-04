// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_agreement_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignAgreementScreenController)
const signAgreementScreenControllerProvider =
    SignAgreementScreenControllerProvider._();

final class SignAgreementScreenControllerProvider
    extends $AsyncNotifierProvider<SignAgreementScreenController, void> {
  const SignAgreementScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signAgreementScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signAgreementScreenControllerHash();

  @$internal
  @override
  SignAgreementScreenController create() => SignAgreementScreenController();
}

String _$signAgreementScreenControllerHash() =>
    r'76f3b0cb9a77ddda338384028b7e334d23f77c9e';

abstract class _$SignAgreementScreenController extends $AsyncNotifier<void> {
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
