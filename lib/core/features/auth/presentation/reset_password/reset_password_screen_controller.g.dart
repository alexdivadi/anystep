// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ResetPasswordScreenController)
const resetPasswordScreenControllerProvider =
    ResetPasswordScreenControllerProvider._();

final class ResetPasswordScreenControllerProvider
    extends
        $NotifierProvider<
          ResetPasswordScreenController,
          ResetPasswordScreenState
        > {
  const ResetPasswordScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resetPasswordScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resetPasswordScreenControllerHash();

  @$internal
  @override
  ResetPasswordScreenController create() => ResetPasswordScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResetPasswordScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResetPasswordScreenState>(value),
    );
  }
}

String _$resetPasswordScreenControllerHash() =>
    r'f7dbc7650fec82dbf76e5ff3d37ed1fab4adadc1';

abstract class _$ResetPasswordScreenController
    extends $Notifier<ResetPasswordScreenState> {
  ResetPasswordScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ResetPasswordScreenState, ResetPasswordScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ResetPasswordScreenState, ResetPasswordScreenState>,
              ResetPasswordScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
