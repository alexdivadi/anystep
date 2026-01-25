// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ForgotPasswordScreenController)
const forgotPasswordScreenControllerProvider =
    ForgotPasswordScreenControllerProvider._();

final class ForgotPasswordScreenControllerProvider
    extends
        $NotifierProvider<
          ForgotPasswordScreenController,
          ForgotPasswordScreenState
        > {
  const ForgotPasswordScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forgotPasswordScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forgotPasswordScreenControllerHash();

  @$internal
  @override
  ForgotPasswordScreenController create() => ForgotPasswordScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ForgotPasswordScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ForgotPasswordScreenState>(value),
    );
  }
}

String _$forgotPasswordScreenControllerHash() =>
    r'4ab48d433c383de0131d095551e76635334cc5ed';

abstract class _$ForgotPasswordScreenController
    extends $Notifier<ForgotPasswordScreenState> {
  ForgotPasswordScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ForgotPasswordScreenState, ForgotPasswordScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ForgotPasswordScreenState, ForgotPasswordScreenState>,
              ForgotPasswordScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
