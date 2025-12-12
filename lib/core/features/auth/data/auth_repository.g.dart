// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'41356c95341c04cb32c7aacf01fbd9c67e0794c9';

@ProviderFor(authStateStream)
const authStateStreamProvider = AuthStateStreamProvider._();

final class AuthStateStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthState?>,
          AuthState?,
          Stream<AuthState?>
        >
    with $FutureModifier<AuthState?>, $StreamProvider<AuthState?> {
  const AuthStateStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateStreamHash();

  @$internal
  @override
  $StreamProviderElement<AuthState?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<AuthState?> create(Ref ref) {
    return authStateStream(ref);
  }
}

String _$authStateStreamHash() => r'e4884613c35417d980aee2417cbf8c8f03703f5b';
