// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventDetailScreenControllerHash() =>
    r'400f4643ac6399d95dd7bd99985906607b80d5cb';

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

abstract class _$EventDetailScreenController
    extends BuildlessAutoDisposeNotifier<AsyncValue<EventModel>> {
  late final String eventId;

  AsyncValue<EventModel> build(String eventId);
}

/// See also [EventDetailScreenController].
@ProviderFor(EventDetailScreenController)
const eventDetailScreenControllerProvider = EventDetailScreenControllerFamily();

/// See also [EventDetailScreenController].
class EventDetailScreenControllerFamily extends Family<AsyncValue<EventModel>> {
  /// See also [EventDetailScreenController].
  const EventDetailScreenControllerFamily();

  /// See also [EventDetailScreenController].
  EventDetailScreenControllerProvider call(String eventId) {
    return EventDetailScreenControllerProvider(eventId);
  }

  @override
  EventDetailScreenControllerProvider getProviderOverride(
    covariant EventDetailScreenControllerProvider provider,
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
  String? get name => r'eventDetailScreenControllerProvider';
}

/// See also [EventDetailScreenController].
class EventDetailScreenControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          EventDetailScreenController,
          AsyncValue<EventModel>
        > {
  /// See also [EventDetailScreenController].
  EventDetailScreenControllerProvider(String eventId)
    : this._internal(
        () => EventDetailScreenController()..eventId = eventId,
        from: eventDetailScreenControllerProvider,
        name: r'eventDetailScreenControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$eventDetailScreenControllerHash,
        dependencies: EventDetailScreenControllerFamily._dependencies,
        allTransitiveDependencies:
            EventDetailScreenControllerFamily._allTransitiveDependencies,
        eventId: eventId,
      );

  EventDetailScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
  }) : super.internal();

  final String eventId;

  @override
  AsyncValue<EventModel> runNotifierBuild(
    covariant EventDetailScreenController notifier,
  ) {
    return notifier.build(eventId);
  }

  @override
  Override overrideWith(EventDetailScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EventDetailScreenControllerProvider._internal(
        () => create()..eventId = eventId,
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
  AutoDisposeNotifierProviderElement<
    EventDetailScreenController,
    AsyncValue<EventModel>
  >
  createElement() {
    return _EventDetailScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EventDetailScreenControllerProvider &&
        other.eventId == eventId;
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
mixin EventDetailScreenControllerRef
    on AutoDisposeNotifierProviderRef<AsyncValue<EventModel>> {
  /// The parameter `eventId` of this provider.
  String get eventId;
}

class _EventDetailScreenControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          EventDetailScreenController,
          AsyncValue<EventModel>
        >
    with EventDetailScreenControllerRef {
  _EventDetailScreenControllerProviderElement(super.provider);

  @override
  String get eventId => (origin as EventDetailScreenControllerProvider).eventId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
