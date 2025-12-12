// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'd4d6f3930c9ec06b882a93dab83e41af5e1dce21';

@ProviderFor(getUsers)
const getUsersProvider = GetUsersFamily._();

final class GetUsersProvider
    extends
        $FunctionalProvider<
          AsyncValue<PaginationResult<UserModel>>,
          PaginationResult<UserModel>,
          FutureOr<PaginationResult<UserModel>>
        >
    with
        $FutureModifier<PaginationResult<UserModel>>,
        $FutureProvider<PaginationResult<UserModel>> {
  const GetUsersProvider._({
    required GetUsersFamily super.from,
    required ({
      int? page,
      String? search,
      List<AnyStepFilter<dynamic>>? filters,
      AnyStepOrder? order,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'getUsersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUsersHash();

  @override
  String toString() {
    return r'getUsersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PaginationResult<UserModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PaginationResult<UserModel>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int? page,
              String? search,
              List<AnyStepFilter<dynamic>>? filters,
              AnyStepOrder? order,
            });
    return getUsers(
      ref,
      page: argument.page,
      search: argument.search,
      filters: argument.filters,
      order: argument.order,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetUsersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUsersHash() => r'037380a11d04a473a88f4cd53fe48b198749c97f';

final class GetUsersFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PaginationResult<UserModel>>,
          ({
            int? page,
            String? search,
            List<AnyStepFilter<dynamic>>? filters,
            AnyStepOrder? order,
          })
        > {
  const GetUsersFamily._()
    : super(
        retry: null,
        name: r'getUsersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUsersProvider call({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) => GetUsersProvider._(
    argument: (page: page, search: search, filters: filters, order: order),
    from: this,
  );

  @override
  String toString() => r'getUsersProvider';
}
