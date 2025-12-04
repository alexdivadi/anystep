// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_prefs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appPreferences)
const appPreferencesProvider = AppPreferencesProvider._();

final class AppPreferencesProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppPreferences>,
          AppPreferences,
          FutureOr<AppPreferences>
        >
    with $FutureModifier<AppPreferences>, $FutureProvider<AppPreferences> {
  const AppPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<AppPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppPreferences> create(Ref ref) {
    return appPreferences(ref);
  }
}

String _$appPreferencesHash() => r'1580d6ba5499a64f1e7ca2315995000049ab48d0';
