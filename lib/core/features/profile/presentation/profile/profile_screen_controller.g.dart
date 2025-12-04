// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileScreenController)
const profileScreenControllerProvider = ProfileScreenControllerProvider._();

final class ProfileScreenControllerProvider
    extends
        $NotifierProvider<
          ProfileScreenController,
          ProfileScreenControllerState
        > {
  const ProfileScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileScreenControllerHash();

  @$internal
  @override
  ProfileScreenController create() => ProfileScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileScreenControllerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileScreenControllerState>(value),
    );
  }
}

String _$profileScreenControllerHash() =>
    r'887975828d543746adcb56c3eeac68c65888b558';

abstract class _$ProfileScreenController
    extends $Notifier<ProfileScreenControllerState> {
  ProfileScreenControllerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<ProfileScreenControllerState, ProfileScreenControllerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ProfileScreenControllerState,
                ProfileScreenControllerState
              >,
              ProfileScreenControllerState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
