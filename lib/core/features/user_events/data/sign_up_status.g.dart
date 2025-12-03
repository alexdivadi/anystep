// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpStatusHash() => r'02390b445a29c931ca1f4496e9aec8182ad00f3f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Fetches the sign-up status for a specific event.
/// It checks if the user can sign up, if they have already signed up,
/// and retrieves the user event details if available.
////// Returns a [SignUpStatus] containing the sign-up information or an error message.
///
/// Copied from [signUpStatus].
@ProviderFor(signUpStatus)
const signUpStatusProvider = SignUpStatusFamily();

/// Fetches the sign-up status for a specific event.
/// It checks if the user can sign up, if they have already signed up,
/// and retrieves the user event details if available.
////// Returns a [SignUpStatus] containing the sign-up information or an error message.
///
/// Copied from [signUpStatus].
class SignUpStatusFamily extends Family<AsyncValue<SignUpStatus>> {
  /// Fetches the sign-up status for a specific event.
  /// It checks if the user can sign up, if they have already signed up,
  /// and retrieves the user event details if available.
  ////// Returns a [SignUpStatus] containing the sign-up information or an error message.
  ///
  /// Copied from [signUpStatus].
  const SignUpStatusFamily();

  /// Fetches the sign-up status for a specific event.
  /// It checks if the user can sign up, if they have already signed up,
  /// and retrieves the user event details if available.
  ////// Returns a [SignUpStatus] containing the sign-up information or an error message.
  ///
  /// Copied from [signUpStatus].
  SignUpStatusProvider call(int eventId) {
    return SignUpStatusProvider(eventId);
  }

  @override
  SignUpStatusProvider getProviderOverride(
    covariant SignUpStatusProvider provider,
  ) {
    return call(provider.eventId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signUpStatusProvider';
}

/// Fetches the sign-up status for a specific event.
/// It checks if the user can sign up, if they have already signed up,
/// and retrieves the user event details if available.
////// Returns a [SignUpStatus] containing the sign-up information or an error message.
///
/// Copied from [signUpStatus].
class SignUpStatusProvider extends AutoDisposeFutureProvider<SignUpStatus> {
  /// Fetches the sign-up status for a specific event.
  /// It checks if the user can sign up, if they have already signed up,
  /// and retrieves the user event details if available.
  ////// Returns a [SignUpStatus] containing the sign-up information or an error message.
  ///
  /// Copied from [signUpStatus].
  SignUpStatusProvider(int eventId)
    : this._internal(
        (ref) => signUpStatus(ref as SignUpStatusRef, eventId),
        from: signUpStatusProvider,
        name: r'signUpStatusProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$signUpStatusHash,
        dependencies: SignUpStatusFamily._dependencies,
        allTransitiveDependencies:
            SignUpStatusFamily._allTransitiveDependencies,
        eventId: eventId,
      );

  SignUpStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
  }) : super.internal();

  final int eventId;

  @override
  Override overrideWith(
    FutureOr<SignUpStatus> Function(SignUpStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignUpStatusProvider._internal(
        (ref) => create(ref as SignUpStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SignUpStatus> createElement() {
    return _SignUpStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpStatusProvider && other.eventId == eventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignUpStatusRef on AutoDisposeFutureProviderRef<SignUpStatus> {
  /// The parameter `eventId` of this provider.
  int get eventId;
}

class _SignUpStatusProviderElement
    extends AutoDisposeFutureProviderElement<SignUpStatus>
    with SignUpStatusRef {
  _SignUpStatusProviderElement(super.provider);

  @override
  int get eventId => (origin as SignUpStatusProvider).eventId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
