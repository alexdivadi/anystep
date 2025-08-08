// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventDetailFormControllerHash() =>
    r'0d1f7c1ba61aeb642a7055b486175abcd8a5d461';

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

abstract class _$EventDetailFormController
    extends BuildlessAutoDisposeNotifier<EventDetailFormState> {
  late final int? eventId;

  EventDetailFormState build(int? eventId);
}

/// See also [EventDetailFormController].
@ProviderFor(EventDetailFormController)
const eventDetailFormControllerProvider = EventDetailFormControllerFamily();

/// See also [EventDetailFormController].
class EventDetailFormControllerFamily extends Family<EventDetailFormState> {
  /// See also [EventDetailFormController].
  const EventDetailFormControllerFamily();

  /// See also [EventDetailFormController].
  EventDetailFormControllerProvider call(int? eventId) {
    return EventDetailFormControllerProvider(eventId);
  }

  @override
  EventDetailFormControllerProvider getProviderOverride(
    covariant EventDetailFormControllerProvider provider,
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
  String? get name => r'eventDetailFormControllerProvider';
}

/// See also [EventDetailFormController].
class EventDetailFormControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          EventDetailFormController,
          EventDetailFormState
        > {
  /// See also [EventDetailFormController].
  EventDetailFormControllerProvider(int? eventId)
    : this._internal(
        () => EventDetailFormController()..eventId = eventId,
        from: eventDetailFormControllerProvider,
        name: r'eventDetailFormControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$eventDetailFormControllerHash,
        dependencies: EventDetailFormControllerFamily._dependencies,
        allTransitiveDependencies:
            EventDetailFormControllerFamily._allTransitiveDependencies,
        eventId: eventId,
      );

  EventDetailFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
  }) : super.internal();

  final int? eventId;

  @override
  EventDetailFormState runNotifierBuild(
    covariant EventDetailFormController notifier,
  ) {
    return notifier.build(eventId);
  }

  @override
  Override overrideWith(EventDetailFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EventDetailFormControllerProvider._internal(
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
    EventDetailFormController,
    EventDetailFormState
  >
  createElement() {
    return _EventDetailFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EventDetailFormControllerProvider &&
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
mixin EventDetailFormControllerRef
    on AutoDisposeNotifierProviderRef<EventDetailFormState> {
  /// The parameter `eventId` of this provider.
  int? get eventId;
}

class _EventDetailFormControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          EventDetailFormController,
          EventDetailFormState
        >
    with EventDetailFormControllerRef {
  _EventDetailFormControllerProviderElement(super.provider);

  @override
  int? get eventId => (origin as EventDetailFormControllerProvider).eventId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
