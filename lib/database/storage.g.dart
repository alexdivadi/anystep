// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storage)
const storageProvider = StorageProvider._();

final class StorageProvider
    extends $FunctionalProvider<Storage, Storage, Storage>
    with $Provider<Storage> {
  const StorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageHash();

  @$internal
  @override
  $ProviderElement<Storage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Storage create(Ref ref) {
    return storage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Storage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Storage>(value),
    );
  }
}

String _$storageHash() => r'9ac9dc55a3340e5aaa5e87cce23370542bca667d';
