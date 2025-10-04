// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventRepositoryHash() => r'91fd9a3b10390062e18cef77cb13521e86c6d448';

/// See also [eventRepository].
@ProviderFor(eventRepository)
final eventRepositoryProvider = AutoDisposeProvider<EventRepository>.internal(
  eventRepository,
  name: r'eventRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$eventRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EventRepositoryRef = AutoDisposeProviderRef<EventRepository>;
String _$getEventHash() => r'a1c6cab3570b28dc4e73ccd970b477aced839f14';

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

/// See also [getEvent].
@ProviderFor(getEvent)
const getEventProvider = GetEventFamily();

/// See also [getEvent].
class GetEventFamily extends Family<AsyncValue<EventModel>> {
  /// See also [getEvent].
  const GetEventFamily();

  /// See also [getEvent].
  GetEventProvider call(int id, {bool withAddress = true}) {
    return GetEventProvider(id, withAddress: withAddress);
  }

  @override
  GetEventProvider getProviderOverride(covariant GetEventProvider provider) {
    return call(provider.id, withAddress: provider.withAddress);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getEventProvider';
}

/// See also [getEvent].
class GetEventProvider extends AutoDisposeFutureProvider<EventModel> {
  /// See also [getEvent].
  GetEventProvider(int id, {bool withAddress = true})
    : this._internal(
        (ref) => getEvent(ref as GetEventRef, id, withAddress: withAddress),
        from: getEventProvider,
        name: r'getEventProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getEventHash,
        dependencies: GetEventFamily._dependencies,
        allTransitiveDependencies: GetEventFamily._allTransitiveDependencies,
        id: id,
        withAddress: withAddress,
      );

  GetEventProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.withAddress,
  }) : super.internal();

  final int id;
  final bool withAddress;

  @override
  Override overrideWith(
    FutureOr<EventModel> Function(GetEventRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetEventProvider._internal(
        (ref) => create(ref as GetEventRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        withAddress: withAddress,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EventModel> createElement() {
    return _GetEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetEventProvider &&
        other.id == id &&
        other.withAddress == withAddress;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, withAddress.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetEventRef on AutoDisposeFutureProviderRef<EventModel> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `withAddress` of this provider.
  bool get withAddress;
}

class _GetEventProviderElement
    extends AutoDisposeFutureProviderElement<EventModel>
    with GetEventRef {
  _GetEventProviderElement(super.provider);

  @override
  int get id => (origin as GetEventProvider).id;
  @override
  bool get withAddress => (origin as GetEventProvider).withAddress;
}

String _$getEventsHash() => r'd084cf0138c8e8121f9f9a3990f15571deb2857b';

/// See also [getEvents].
@ProviderFor(getEvents)
const getEventsProvider = GetEventsFamily();

/// See also [getEvents].
class GetEventsFamily extends Family<AsyncValue<PaginationResult<EventModel>>> {
  /// See also [getEvents].
  const GetEventsFamily();

  /// See also [getEvents].
  GetEventsProvider call({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) {
    return GetEventsProvider(
      page: page,
      search: search,
      filters: filters,
      order: order,
    );
  }

  @override
  GetEventsProvider getProviderOverride(covariant GetEventsProvider provider) {
    return call(
      page: provider.page,
      search: provider.search,
      filters: provider.filters,
      order: provider.order,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getEventsProvider';
}

/// See also [getEvents].
class GetEventsProvider
    extends AutoDisposeFutureProvider<PaginationResult<EventModel>> {
  /// See also [getEvents].
  GetEventsProvider({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) : this._internal(
         (ref) => getEvents(
           ref as GetEventsRef,
           page: page,
           search: search,
           filters: filters,
           order: order,
         ),
         from: getEventsProvider,
         name: r'getEventsProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$getEventsHash,
         dependencies: GetEventsFamily._dependencies,
         allTransitiveDependencies: GetEventsFamily._allTransitiveDependencies,
         page: page,
         search: search,
         filters: filters,
         order: order,
       );

  GetEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.search,
    required this.filters,
    required this.order,
  }) : super.internal();

  final int? page;
  final String? search;
  final List<AnyStepFilter<dynamic>>? filters;
  final AnyStepOrder? order;

  @override
  Override overrideWith(
    FutureOr<PaginationResult<EventModel>> Function(GetEventsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetEventsProvider._internal(
        (ref) => create(ref as GetEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        search: search,
        filters: filters,
        order: order,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginationResult<EventModel>>
  createElement() {
    return _GetEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetEventsProvider &&
        other.page == page &&
        other.search == search &&
        other.filters == filters &&
        other.order == order;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);
    hash = _SystemHash.combine(hash, order.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetEventsRef
    on AutoDisposeFutureProviderRef<PaginationResult<EventModel>> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `search` of this provider.
  String? get search;

  /// The parameter `filters` of this provider.
  List<AnyStepFilter<dynamic>>? get filters;

  /// The parameter `order` of this provider.
  AnyStepOrder? get order;
}

class _GetEventsProviderElement
    extends AutoDisposeFutureProviderElement<PaginationResult<EventModel>>
    with GetEventsRef {
  _GetEventsProviderElement(super.provider);

  @override
  int? get page => (origin as GetEventsProvider).page;
  @override
  String? get search => (origin as GetEventsProvider).search;
  @override
  List<AnyStepFilter<dynamic>>? get filters =>
      (origin as GetEventsProvider).filters;
  @override
  AnyStepOrder? get order => (origin as GetEventsProvider).order;
}

String _$getUpcomingEventsHash() => r'0887d30dafb4f176385152bb01cfc3f2db8912ee';

/// See also [getUpcomingEvents].
@ProviderFor(getUpcomingEvents)
const getUpcomingEventsProvider = GetUpcomingEventsFamily();

/// See also [getUpcomingEvents].
class GetUpcomingEventsFamily
    extends Family<AsyncValue<PaginationResult<EventModel>>> {
  /// See also [getUpcomingEvents].
  const GetUpcomingEventsFamily();

  /// See also [getUpcomingEvents].
  GetUpcomingEventsProvider call({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) {
    return GetUpcomingEventsProvider(
      page: page,
      search: search,
      filters: filters,
      order: order,
    );
  }

  @override
  GetUpcomingEventsProvider getProviderOverride(
    covariant GetUpcomingEventsProvider provider,
  ) {
    return call(
      page: provider.page,
      search: provider.search,
      filters: provider.filters,
      order: provider.order,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUpcomingEventsProvider';
}

/// See also [getUpcomingEvents].
class GetUpcomingEventsProvider
    extends AutoDisposeFutureProvider<PaginationResult<EventModel>> {
  /// See also [getUpcomingEvents].
  GetUpcomingEventsProvider({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) : this._internal(
         (ref) => getUpcomingEvents(
           ref as GetUpcomingEventsRef,
           page: page,
           search: search,
           filters: filters,
           order: order,
         ),
         from: getUpcomingEventsProvider,
         name: r'getUpcomingEventsProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$getUpcomingEventsHash,
         dependencies: GetUpcomingEventsFamily._dependencies,
         allTransitiveDependencies:
             GetUpcomingEventsFamily._allTransitiveDependencies,
         page: page,
         search: search,
         filters: filters,
         order: order,
       );

  GetUpcomingEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.search,
    required this.filters,
    required this.order,
  }) : super.internal();

  final int? page;
  final String? search;
  final List<AnyStepFilter<dynamic>>? filters;
  final AnyStepOrder? order;

  @override
  Override overrideWith(
    FutureOr<PaginationResult<EventModel>> Function(
      GetUpcomingEventsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUpcomingEventsProvider._internal(
        (ref) => create(ref as GetUpcomingEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        search: search,
        filters: filters,
        order: order,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginationResult<EventModel>>
  createElement() {
    return _GetUpcomingEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUpcomingEventsProvider &&
        other.page == page &&
        other.search == search &&
        other.filters == filters &&
        other.order == order;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);
    hash = _SystemHash.combine(hash, order.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUpcomingEventsRef
    on AutoDisposeFutureProviderRef<PaginationResult<EventModel>> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `search` of this provider.
  String? get search;

  /// The parameter `filters` of this provider.
  List<AnyStepFilter<dynamic>>? get filters;

  /// The parameter `order` of this provider.
  AnyStepOrder? get order;
}

class _GetUpcomingEventsProviderElement
    extends AutoDisposeFutureProviderElement<PaginationResult<EventModel>>
    with GetUpcomingEventsRef {
  _GetUpcomingEventsProviderElement(super.provider);

  @override
  int? get page => (origin as GetUpcomingEventsProvider).page;
  @override
  String? get search => (origin as GetUpcomingEventsProvider).search;
  @override
  List<AnyStepFilter<dynamic>>? get filters =>
      (origin as GetUpcomingEventsProvider).filters;
  @override
  AnyStepOrder? get order => (origin as GetUpcomingEventsProvider).order;
}

String _$getPastEventsHash() => r'f1c7356fd9383c6b71c3494f6a35aa1221690546';

/// See also [getPastEvents].
@ProviderFor(getPastEvents)
const getPastEventsProvider = GetPastEventsFamily();

/// See also [getPastEvents].
class GetPastEventsFamily
    extends Family<AsyncValue<PaginationResult<EventModel>>> {
  /// See also [getPastEvents].
  const GetPastEventsFamily();

  /// See also [getPastEvents].
  GetPastEventsProvider call({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) {
    return GetPastEventsProvider(
      page: page,
      search: search,
      filters: filters,
      order: order,
    );
  }

  @override
  GetPastEventsProvider getProviderOverride(
    covariant GetPastEventsProvider provider,
  ) {
    return call(
      page: provider.page,
      search: provider.search,
      filters: provider.filters,
      order: provider.order,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPastEventsProvider';
}

/// See also [getPastEvents].
class GetPastEventsProvider
    extends AutoDisposeFutureProvider<PaginationResult<EventModel>> {
  /// See also [getPastEvents].
  GetPastEventsProvider({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) : this._internal(
         (ref) => getPastEvents(
           ref as GetPastEventsRef,
           page: page,
           search: search,
           filters: filters,
           order: order,
         ),
         from: getPastEventsProvider,
         name: r'getPastEventsProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$getPastEventsHash,
         dependencies: GetPastEventsFamily._dependencies,
         allTransitiveDependencies:
             GetPastEventsFamily._allTransitiveDependencies,
         page: page,
         search: search,
         filters: filters,
         order: order,
       );

  GetPastEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.search,
    required this.filters,
    required this.order,
  }) : super.internal();

  final int? page;
  final String? search;
  final List<AnyStepFilter<dynamic>>? filters;
  final AnyStepOrder? order;

  @override
  Override overrideWith(
    FutureOr<PaginationResult<EventModel>> Function(GetPastEventsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPastEventsProvider._internal(
        (ref) => create(ref as GetPastEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        search: search,
        filters: filters,
        order: order,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginationResult<EventModel>>
  createElement() {
    return _GetPastEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPastEventsProvider &&
        other.page == page &&
        other.search == search &&
        other.filters == filters &&
        other.order == order;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);
    hash = _SystemHash.combine(hash, order.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetPastEventsRef
    on AutoDisposeFutureProviderRef<PaginationResult<EventModel>> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `search` of this provider.
  String? get search;

  /// The parameter `filters` of this provider.
  List<AnyStepFilter<dynamic>>? get filters;

  /// The parameter `order` of this provider.
  AnyStepOrder? get order;
}

class _GetPastEventsProviderElement
    extends AutoDisposeFutureProviderElement<PaginationResult<EventModel>>
    with GetPastEventsRef {
  _GetPastEventsProviderElement(super.provider);

  @override
  int? get page => (origin as GetPastEventsProvider).page;
  @override
  String? get search => (origin as GetPastEventsProvider).search;
  @override
  List<AnyStepFilter<dynamic>>? get filters =>
      (origin as GetPastEventsProvider).filters;
  @override
  AnyStepOrder? get order => (origin as GetPastEventsProvider).order;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
