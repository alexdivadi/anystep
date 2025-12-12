// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_template_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(eventTemplateRepository)
const eventTemplateRepositoryProvider = EventTemplateRepositoryProvider._();

final class EventTemplateRepositoryProvider
    extends
        $FunctionalProvider<
          EventTemplateRepository,
          EventTemplateRepository,
          EventTemplateRepository
        >
    with $Provider<EventTemplateRepository> {
  const EventTemplateRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventTemplateRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventTemplateRepositoryHash();

  @$internal
  @override
  $ProviderElement<EventTemplateRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EventTemplateRepository create(Ref ref) {
    return eventTemplateRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventTemplateRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventTemplateRepository>(value),
    );
  }
}

String _$eventTemplateRepositoryHash() =>
    r'83c5783228622e6b8726a84723b389842e3629d8';
