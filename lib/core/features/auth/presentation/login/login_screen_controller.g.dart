// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginScreenController)
const loginScreenControllerProvider = LoginScreenControllerProvider._();

final class LoginScreenControllerProvider
    extends $NotifierProvider<LoginScreenController, LoginScreenState> {
  const LoginScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginScreenControllerHash();

  @$internal
  @override
  LoginScreenController create() => LoginScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginScreenState>(value),
    );
  }
}

String _$loginScreenControllerHash() =>
    r'e6de5624e0f2ed5ccef56f27789ef09812c617fc';

abstract class _$LoginScreenController extends $Notifier<LoginScreenState> {
  LoginScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LoginScreenState, LoginScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoginScreenState, LoginScreenState>,
              LoginScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
