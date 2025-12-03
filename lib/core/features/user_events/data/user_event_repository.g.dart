// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_event_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userEventRepositoryHash() =>
    r'cf1a42849b08f22684db1163bba108fb81184a08';

/// See also [userEventRepository].
@ProviderFor(userEventRepository)
final userEventRepositoryProvider =
    AutoDisposeProvider<UserEventRepository>.internal(
      userEventRepository,
      name: r'userEventRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userEventRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserEventRepositoryRef = AutoDisposeProviderRef<UserEventRepository>;
String _$getUserEventHash() => r'7dd975bd13172a1c0e3404ce8685390456d1bc69';

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

/// See also [getUserEvent].
@ProviderFor(getUserEvent)
const getUserEventProvider = GetUserEventFamily();

/// See also [getUserEvent].
class GetUserEventFamily extends Family<AsyncValue<UserEventModel>> {
  /// See also [getUserEvent].
  const GetUserEventFamily();

  /// See also [getUserEvent].
  GetUserEventProvider call(int id) {
    return GetUserEventProvider(id);
  }

  @override
  GetUserEventProvider getProviderOverride(
    covariant GetUserEventProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserEventProvider';
}

/// See also [getUserEvent].
class GetUserEventProvider extends AutoDisposeFutureProvider<UserEventModel> {
  /// See also [getUserEvent].
  GetUserEventProvider(int id)
    : this._internal(
        (ref) => getUserEvent(ref as GetUserEventRef, id),
        from: getUserEventProvider,
        name: r'getUserEventProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$getUserEventHash,
        dependencies: GetUserEventFamily._dependencies,
        allTransitiveDependencies:
            GetUserEventFamily._allTransitiveDependencies,
        id: id,
      );

  GetUserEventProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<UserEventModel> Function(GetUserEventRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserEventProvider._internal(
        (ref) => create(ref as GetUserEventRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserEventModel> createElement() {
    return _GetUserEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserEventProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUserEventRef on AutoDisposeFutureProviderRef<UserEventModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetUserEventProviderElement
    extends AutoDisposeFutureProviderElement<UserEventModel>
    with GetUserEventRef {
  _GetUserEventProviderElement(super.provider);

  @override
  int get id => (origin as GetUserEventProvider).id;
}

String _$getUserEventsHash() => r'60c6a575c37f2d26748e92e88e294c249422051c';

/// See also [getUserEvents].
@ProviderFor(getUserEvents)
const getUserEventsProvider = GetUserEventsFamily();

/// See also [getUserEvents].
class GetUserEventsFamily
    extends Family<AsyncValue<PaginationResult<UserEventModel>>> {
  /// See also [getUserEvents].
  const GetUserEventsFamily();

  /// See also [getUserEvents].
  GetUserEventsProvider call({
    int? page,
    int? eventId,
    String? userId,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) {
    return GetUserEventsProvider(
      page: page,
      eventId: eventId,
      userId: userId,
      filters: filters,
      order: order,
    );
  }

  @override
  GetUserEventsProvider getProviderOverride(
    covariant GetUserEventsProvider provider,
  ) {
    return call(
      page: provider.page,
      eventId: provider.eventId,
      userId: provider.userId,
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
  String? get name => r'getUserEventsProvider';
}

/// See also [getUserEvents].
class GetUserEventsProvider
    extends AutoDisposeFutureProvider<PaginationResult<UserEventModel>> {
  /// See also [getUserEvents].
  GetUserEventsProvider({
    int? page,
    int? eventId,
    String? userId,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) : this._internal(
         (ref) => getUserEvents(
           ref as GetUserEventsRef,
           page: page,
           eventId: eventId,
           userId: userId,
           filters: filters,
           order: order,
         ),
         from: getUserEventsProvider,
         name: r'getUserEventsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$getUserEventsHash,
         dependencies: GetUserEventsFamily._dependencies,
         allTransitiveDependencies:
             GetUserEventsFamily._allTransitiveDependencies,
         page: page,
         eventId: eventId,
         userId: userId,
         filters: filters,
         order: order,
       );

  GetUserEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.eventId,
    required this.userId,
    required this.filters,
    required this.order,
  }) : super.internal();

  final int? page;
  final int? eventId;
  final String? userId;
  final List<AnyStepFilter<dynamic>>? filters;
  final AnyStepOrder? order;

  @override
  Override overrideWith(
    FutureOr<PaginationResult<UserEventModel>> Function(
      GetUserEventsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserEventsProvider._internal(
        (ref) => create(ref as GetUserEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        eventId: eventId,
        userId: userId,
        filters: filters,
        order: order,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginationResult<UserEventModel>>
  createElement() {
    return _GetUserEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserEventsProvider &&
        other.page == page &&
        other.eventId == eventId &&
        other.userId == userId &&
        other.filters == filters &&
        other.order == order;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);
    hash = _SystemHash.combine(hash, order.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUserEventsRef
    on AutoDisposeFutureProviderRef<PaginationResult<UserEventModel>> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `eventId` of this provider.
  int? get eventId;

  /// The parameter `userId` of this provider.
  String? get userId;

  /// The parameter `filters` of this provider.
  List<AnyStepFilter<dynamic>>? get filters;

  /// The parameter `order` of this provider.
  AnyStepOrder? get order;
}

class _GetUserEventsProviderElement
    extends AutoDisposeFutureProviderElement<PaginationResult<UserEventModel>>
    with GetUserEventsRef {
  _GetUserEventsProviderElement(super.provider);

  @override
  int? get page => (origin as GetUserEventsProvider).page;
  @override
  int? get eventId => (origin as GetUserEventsProvider).eventId;
  @override
  String? get userId => (origin as GetUserEventsProvider).userId;
  @override
  List<AnyStepFilter<dynamic>>? get filters =>
      (origin as GetUserEventsProvider).filters;
  @override
  AnyStepOrder? get order => (origin as GetUserEventsProvider).order;
}

String _$getCurrentUserEventsHash() =>
    r'80043a6b955e64ce90473a8aec3c62ecf6809e7d';

/// See also [getCurrentUserEvents].
@ProviderFor(getCurrentUserEvents)
const getCurrentUserEventsProvider = GetCurrentUserEventsFamily();

/// See also [getCurrentUserEvents].
class GetCurrentUserEventsFamily
    extends Family<AsyncValue<PaginationResult<UserEventModel>>> {
  /// See also [getCurrentUserEvents].
  const GetCurrentUserEventsFamily();

  /// See also [getCurrentUserEvents].
  GetCurrentUserEventsProvider call({
    int? page,
    int? eventId,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) {
    return GetCurrentUserEventsProvider(
      page: page,
      eventId: eventId,
      filters: filters,
      order: order,
    );
  }

  @override
  GetCurrentUserEventsProvider getProviderOverride(
    covariant GetCurrentUserEventsProvider provider,
  ) {
    return call(
      page: provider.page,
      eventId: provider.eventId,
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
  String? get name => r'getCurrentUserEventsProvider';
}

/// See also [getCurrentUserEvents].
class GetCurrentUserEventsProvider
    extends AutoDisposeFutureProvider<PaginationResult<UserEventModel>> {
  /// See also [getCurrentUserEvents].
  GetCurrentUserEventsProvider({
    int? page,
    int? eventId,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) : this._internal(
         (ref) => getCurrentUserEvents(
           ref as GetCurrentUserEventsRef,
           page: page,
           eventId: eventId,
           filters: filters,
           order: order,
         ),
         from: getCurrentUserEventsProvider,
         name: r'getCurrentUserEventsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$getCurrentUserEventsHash,
         dependencies: GetCurrentUserEventsFamily._dependencies,
         allTransitiveDependencies:
             GetCurrentUserEventsFamily._allTransitiveDependencies,
         page: page,
         eventId: eventId,
         filters: filters,
         order: order,
       );

  GetCurrentUserEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.eventId,
    required this.filters,
    required this.order,
  }) : super.internal();

  final int? page;
  final int? eventId;
  final List<AnyStepFilter<dynamic>>? filters;
  final AnyStepOrder? order;

  @override
  Override overrideWith(
    FutureOr<PaginationResult<UserEventModel>> Function(
      GetCurrentUserEventsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCurrentUserEventsProvider._internal(
        (ref) => create(ref as GetCurrentUserEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        eventId: eventId,
        filters: filters,
        order: order,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginationResult<UserEventModel>>
  createElement() {
    return _GetCurrentUserEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCurrentUserEventsProvider &&
        other.page == page &&
        other.eventId == eventId &&
        other.filters == filters &&
        other.order == order;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);
    hash = _SystemHash.combine(hash, order.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCurrentUserEventsRef
    on AutoDisposeFutureProviderRef<PaginationResult<UserEventModel>> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `eventId` of this provider.
  int? get eventId;

  /// The parameter `filters` of this provider.
  List<AnyStepFilter<dynamic>>? get filters;

  /// The parameter `order` of this provider.
  AnyStepOrder? get order;
}

class _GetCurrentUserEventsProviderElement
    extends AutoDisposeFutureProviderElement<PaginationResult<UserEventModel>>
    with GetCurrentUserEventsRef {
  _GetCurrentUserEventsProviderElement(super.provider);

  @override
  int? get page => (origin as GetCurrentUserEventsProvider).page;
  @override
  int? get eventId => (origin as GetCurrentUserEventsProvider).eventId;
  @override
  List<AnyStepFilter<dynamic>>? get filters =>
      (origin as GetCurrentUserEventsProvider).filters;
  @override
  AnyStepOrder? get order => (origin as GetCurrentUserEventsProvider).order;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
