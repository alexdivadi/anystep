// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee_search_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attendeeSearchFormControllerHash() =>
    r'ad3bb0956f00b1b3dc7d9b3dc79a95864d98e83c';

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

abstract class _$AttendeeSearchFormController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final int eventId;

  FutureOr<void> build(int eventId);
}

/// See also [AttendeeSearchFormController].
@ProviderFor(AttendeeSearchFormController)
const attendeeSearchFormControllerProvider =
    AttendeeSearchFormControllerFamily();

/// See also [AttendeeSearchFormController].
class AttendeeSearchFormControllerFamily extends Family<AsyncValue<void>> {
  /// See also [AttendeeSearchFormController].
  const AttendeeSearchFormControllerFamily();

  /// See also [AttendeeSearchFormController].
  AttendeeSearchFormControllerProvider call(int eventId) {
    return AttendeeSearchFormControllerProvider(eventId);
  }

  @override
  AttendeeSearchFormControllerProvider getProviderOverride(
    covariant AttendeeSearchFormControllerProvider provider,
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
  String? get name => r'attendeeSearchFormControllerProvider';
}

/// See also [AttendeeSearchFormController].
class AttendeeSearchFormControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          AttendeeSearchFormController,
          void
        > {
  /// See also [AttendeeSearchFormController].
  AttendeeSearchFormControllerProvider(int eventId)
    : this._internal(
        () => AttendeeSearchFormController()..eventId = eventId,
        from: attendeeSearchFormControllerProvider,
        name: r'attendeeSearchFormControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$attendeeSearchFormControllerHash,
        dependencies: AttendeeSearchFormControllerFamily._dependencies,
        allTransitiveDependencies:
            AttendeeSearchFormControllerFamily._allTransitiveDependencies,
        eventId: eventId,
      );

  AttendeeSearchFormControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(
    covariant AttendeeSearchFormController notifier,
  ) {
    return notifier.build(eventId);
  }

  @override
  Override overrideWith(AttendeeSearchFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AttendeeSearchFormControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AttendeeSearchFormController, void>
  createElement() {
    return _AttendeeSearchFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AttendeeSearchFormControllerProvider &&
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
mixin AttendeeSearchFormControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `eventId` of this provider.
  int get eventId;
}

class _AttendeeSearchFormControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          AttendeeSearchFormController,
          void
        >
    with AttendeeSearchFormControllerRef {
  _AttendeeSearchFormControllerProviderElement(super.provider);

  @override
  int get eventId => (origin as AttendeeSearchFormControllerProvider).eventId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
