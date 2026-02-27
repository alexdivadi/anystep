// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(remoteConfig)
const remoteConfigProvider = RemoteConfigProvider._();

final class RemoteConfigProvider
    extends
        $FunctionalProvider<
          AsyncValue<RemoteConfigService>,
          RemoteConfigService,
          FutureOr<RemoteConfigService>
        >
    with
        $FutureModifier<RemoteConfigService>,
        $FutureProvider<RemoteConfigService> {
  const RemoteConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteConfigHash();

  @$internal
  @override
  $FutureProviderElement<RemoteConfigService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RemoteConfigService> create(Ref ref) {
    return remoteConfig(ref);
  }
}

String _$remoteConfigHash() => r'5ebebdfe2f2a08b62c777046dbeaa575215598a7';
