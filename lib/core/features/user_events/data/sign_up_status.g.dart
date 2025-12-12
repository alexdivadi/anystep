// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Fetches the sign-up status for a specific event.
/// It checks if the user can sign up, if they have already signed up,
/// and retrieves the user event details if available.
////// Returns a [SignUpStatus] containing the sign-up information or an error message.

@ProviderFor(signUpStatus)
const signUpStatusProvider = SignUpStatusFamily._();

/// Fetches the sign-up status for a specific event.
/// It checks if the user can sign up, if they have already signed up,
/// and retrieves the user event details if available.
////// Returns a [SignUpStatus] containing the sign-up information or an error message.

final class SignUpStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<SignUpStatus>,
          SignUpStatus,
          FutureOr<SignUpStatus>
        >
    with $FutureModifier<SignUpStatus>, $FutureProvider<SignUpStatus> {
  /// Fetches the sign-up status for a specific event.
  /// It checks if the user can sign up, if they have already signed up,
  /// and retrieves the user event details if available.
  ////// Returns a [SignUpStatus] containing the sign-up information or an error message.
  const SignUpStatusProvider._({
    required SignUpStatusFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'signUpStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$signUpStatusHash();

  @override
  String toString() {
    return r'signUpStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SignUpStatus> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SignUpStatus> create(Ref ref) {
    final argument = this.argument as int;
    return signUpStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$signUpStatusHash() => r'02390b445a29c931ca1f4496e9aec8182ad00f3f';

/// Fetches the sign-up status for a specific event.
/// It checks if the user can sign up, if they have already signed up,
/// and retrieves the user event details if available.
////// Returns a [SignUpStatus] containing the sign-up information or an error message.

final class SignUpStatusFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SignUpStatus>, int> {
  const SignUpStatusFamily._()
    : super(
        retry: null,
        name: r'signUpStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Fetches the sign-up status for a specific event.
  /// It checks if the user can sign up, if they have already signed up,
  /// and retrieves the user event details if available.
  ////// Returns a [SignUpStatus] containing the sign-up information or an error message.

  SignUpStatusProvider call(int eventId) =>
      SignUpStatusProvider._(argument: eventId, from: this);

  @override
  String toString() => r'signUpStatusProvider';
}
