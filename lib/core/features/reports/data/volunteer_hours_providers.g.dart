// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_hours_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userEventsInRangeHash() => r'5c837a22e927057062e1dc001a58049e0f1689d1';

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

/// Raw list of user events (with embedded event & user) for a date range.
/// We request both user and event models from repository.
///
/// Copied from [userEventsInRange].
@ProviderFor(userEventsInRange)
const userEventsInRangeProvider = UserEventsInRangeFamily();

/// Raw list of user events (with embedded event & user) for a date range.
/// We request both user and event models from repository.
///
/// Copied from [userEventsInRange].
class UserEventsInRangeFamily extends Family<AsyncValue<List<UserEventModel>>> {
  /// Raw list of user events (with embedded event & user) for a date range.
  /// We request both user and event models from repository.
  ///
  /// Copied from [userEventsInRange].
  const UserEventsInRangeFamily();

  /// Raw list of user events (with embedded event & user) for a date range.
  /// We request both user and event models from repository.
  ///
  /// Copied from [userEventsInRange].
  UserEventsInRangeProvider call({
    required DateTime start,
    required DateTime end,
  }) {
    return UserEventsInRangeProvider(start: start, end: end);
  }

  @override
  UserEventsInRangeProvider getProviderOverride(
    covariant UserEventsInRangeProvider provider,
  ) {
    return call(start: provider.start, end: provider.end);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userEventsInRangeProvider';
}

/// Raw list of user events (with embedded event & user) for a date range.
/// We request both user and event models from repository.
///
/// Copied from [userEventsInRange].
class UserEventsInRangeProvider
    extends AutoDisposeFutureProvider<List<UserEventModel>> {
  /// Raw list of user events (with embedded event & user) for a date range.
  /// We request both user and event models from repository.
  ///
  /// Copied from [userEventsInRange].
  UserEventsInRangeProvider({required DateTime start, required DateTime end})
    : this._internal(
        (ref) => userEventsInRange(
          ref as UserEventsInRangeRef,
          start: start,
          end: end,
        ),
        from: userEventsInRangeProvider,
        name: r'userEventsInRangeProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$userEventsInRangeHash,
        dependencies: UserEventsInRangeFamily._dependencies,
        allTransitiveDependencies:
            UserEventsInRangeFamily._allTransitiveDependencies,
        start: start,
        end: end,
      );

  UserEventsInRangeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  Override overrideWith(
    FutureOr<List<UserEventModel>> Function(UserEventsInRangeRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserEventsInRangeProvider._internal(
        (ref) => create(ref as UserEventsInRangeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<UserEventModel>> createElement() {
    return _UserEventsInRangeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserEventsInRangeProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserEventsInRangeRef
    on AutoDisposeFutureProviderRef<List<UserEventModel>> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _UserEventsInRangeProviderElement
    extends AutoDisposeFutureProviderElement<List<UserEventModel>>
    with UserEventsInRangeRef {
  _UserEventsInRangeProviderElement(super.provider);

  @override
  DateTime get start => (origin as UserEventsInRangeProvider).start;
  @override
  DateTime get end => (origin as UserEventsInRangeProvider).end;
}

String _$volunteerHoursAggregateHash() =>
    r'10176eafd4c64e34bd68ffe1ee9cb4424041074e';

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
///
/// Copied from [volunteerHoursAggregate].
@ProviderFor(volunteerHoursAggregate)
const volunteerHoursAggregateProvider = VolunteerHoursAggregateFamily();

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
///
/// Copied from [volunteerHoursAggregate].
class VolunteerHoursAggregateFamily
    extends Family<AsyncValue<List<VolunteerHoursReport>>> {
  /// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
  ///
  /// Copied from [volunteerHoursAggregate].
  const VolunteerHoursAggregateFamily();

  /// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
  ///
  /// Copied from [volunteerHoursAggregate].
  VolunteerHoursAggregateProvider call({
    required DateTime start,
    required DateTime end,
  }) {
    return VolunteerHoursAggregateProvider(start: start, end: end);
  }

  @override
  VolunteerHoursAggregateProvider getProviderOverride(
    covariant VolunteerHoursAggregateProvider provider,
  ) {
    return call(start: provider.start, end: provider.end);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'volunteerHoursAggregateProvider';
}

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
///
/// Copied from [volunteerHoursAggregate].
class VolunteerHoursAggregateProvider
    extends AutoDisposeFutureProvider<List<VolunteerHoursReport>> {
  /// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
  ///
  /// Copied from [volunteerHoursAggregate].
  VolunteerHoursAggregateProvider({
    required DateTime start,
    required DateTime end,
  }) : this._internal(
         (ref) => volunteerHoursAggregate(
           ref as VolunteerHoursAggregateRef,
           start: start,
           end: end,
         ),
         from: volunteerHoursAggregateProvider,
         name: r'volunteerHoursAggregateProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$volunteerHoursAggregateHash,
         dependencies: VolunteerHoursAggregateFamily._dependencies,
         allTransitiveDependencies:
             VolunteerHoursAggregateFamily._allTransitiveDependencies,
         start: start,
         end: end,
       );

  VolunteerHoursAggregateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  Override overrideWith(
    FutureOr<List<VolunteerHoursReport>> Function(
      VolunteerHoursAggregateRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VolunteerHoursAggregateProvider._internal(
        (ref) => create(ref as VolunteerHoursAggregateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<VolunteerHoursReport>> createElement() {
    return _VolunteerHoursAggregateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VolunteerHoursAggregateProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VolunteerHoursAggregateRef
    on AutoDisposeFutureProviderRef<List<VolunteerHoursReport>> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _VolunteerHoursAggregateProviderElement
    extends AutoDisposeFutureProviderElement<List<VolunteerHoursReport>>
    with VolunteerHoursAggregateRef {
  _VolunteerHoursAggregateProviderElement(super.provider);

  @override
  DateTime get start => (origin as VolunteerHoursAggregateProvider).start;
  @override
  DateTime get end => (origin as VolunteerHoursAggregateProvider).end;
}

String _$volunteerHoursYtdHash() => r'4d3cfe11eeafb69879ea30051ce4543c7bf81cc1';

/// Convenience provider: Year-to-date
///
/// Copied from [volunteerHoursYtd].
@ProviderFor(volunteerHoursYtd)
final volunteerHoursYtdProvider =
    AutoDisposeFutureProvider<List<VolunteerHoursReport>>.internal(
      volunteerHoursYtd,
      name: r'volunteerHoursYtdProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$volunteerHoursYtdHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VolunteerHoursYtdRef =
    AutoDisposeFutureProviderRef<List<VolunteerHoursReport>>;
String _$volunteerHoursThisMonthHash() =>
    r'b7c49894b18d3bd439e2963d26c60d33e2a9a539';

/// Convenience provider: Current month
///
/// Copied from [volunteerHoursThisMonth].
@ProviderFor(volunteerHoursThisMonth)
final volunteerHoursThisMonthProvider =
    AutoDisposeFutureProvider<List<VolunteerHoursReport>>.internal(
      volunteerHoursThisMonth,
      name: r'volunteerHoursThisMonthProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$volunteerHoursThisMonthHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VolunteerHoursThisMonthRef =
    AutoDisposeFutureProviderRef<List<VolunteerHoursReport>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
