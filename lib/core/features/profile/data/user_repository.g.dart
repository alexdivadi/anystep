// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'd4d6f3930c9ec06b882a93dab83e41af5e1dce21';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$getUsersHash() => r'037380a11d04a473a88f4cd53fe48b198749c97f';

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

/// See also [getUsers].
@ProviderFor(getUsers)
const getUsersProvider = GetUsersFamily();

/// See also [getUsers].
class GetUsersFamily extends Family<AsyncValue<PaginationResult<UserModel>>> {
  /// See also [getUsers].
  const GetUsersFamily();

  /// See also [getUsers].
  GetUsersProvider call({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) {
    return GetUsersProvider(
      page: page,
      search: search,
      filters: filters,
      order: order,
    );
  }

  @override
  GetUsersProvider getProviderOverride(covariant GetUsersProvider provider) {
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
  String? get name => r'getUsersProvider';
}

/// See also [getUsers].
class GetUsersProvider
    extends AutoDisposeFutureProvider<PaginationResult<UserModel>> {
  /// See also [getUsers].
  GetUsersProvider({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) : this._internal(
         (ref) => getUsers(
           ref as GetUsersRef,
           page: page,
           search: search,
           filters: filters,
           order: order,
         ),
         from: getUsersProvider,
         name: r'getUsersProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$getUsersHash,
         dependencies: GetUsersFamily._dependencies,
         allTransitiveDependencies: GetUsersFamily._allTransitiveDependencies,
         page: page,
         search: search,
         filters: filters,
         order: order,
       );

  GetUsersProvider._internal(
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
    FutureOr<PaginationResult<UserModel>> Function(GetUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUsersProvider._internal(
        (ref) => create(ref as GetUsersRef),
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
  AutoDisposeFutureProviderElement<PaginationResult<UserModel>>
  createElement() {
    return _GetUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUsersProvider &&
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
mixin GetUsersRef on AutoDisposeFutureProviderRef<PaginationResult<UserModel>> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `search` of this provider.
  String? get search;

  /// The parameter `filters` of this provider.
  List<AnyStepFilter<dynamic>>? get filters;

  /// The parameter `order` of this provider.
  AnyStepOrder? get order;
}

class _GetUsersProviderElement
    extends AutoDisposeFutureProviderElement<PaginationResult<UserModel>>
    with GetUsersRef {
  _GetUsersProviderElement(super.provider);

  @override
  int? get page => (origin as GetUsersProvider).page;
  @override
  String? get search => (origin as GetUsersProvider).search;
  @override
  List<AnyStepFilter<dynamic>>? get filters =>
      (origin as GetUsersProvider).filters;
  @override
  AnyStepOrder? get order => (origin as GetUsersProvider).order;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
