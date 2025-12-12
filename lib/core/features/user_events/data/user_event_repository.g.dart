// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_event_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userEventRepository)
const userEventRepositoryProvider = UserEventRepositoryProvider._();

final class UserEventRepositoryProvider
    extends
        $FunctionalProvider<
          UserEventRepository,
          UserEventRepository,
          UserEventRepository
        >
    with $Provider<UserEventRepository> {
  const UserEventRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userEventRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userEventRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserEventRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserEventRepository create(Ref ref) {
    return userEventRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserEventRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserEventRepository>(value),
    );
  }
}

String _$userEventRepositoryHash() =>
    r'cf1a42849b08f22684db1163bba108fb81184a08';

@ProviderFor(getUserEvent)
const getUserEventProvider = GetUserEventFamily._();

final class GetUserEventProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserEventModel>,
          UserEventModel,
          FutureOr<UserEventModel>
        >
    with $FutureModifier<UserEventModel>, $FutureProvider<UserEventModel> {
  const GetUserEventProvider._({
    required GetUserEventFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getUserEventProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUserEventHash();

  @override
  String toString() {
    return r'getUserEventProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<UserEventModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserEventModel> create(Ref ref) {
    final argument = this.argument as int;
    return getUserEvent(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserEventProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserEventHash() => r'7dd975bd13172a1c0e3404ce8685390456d1bc69';

final class GetUserEventFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<UserEventModel>, int> {
  const GetUserEventFamily._()
    : super(
        retry: null,
        name: r'getUserEventProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUserEventProvider call(int id) =>
      GetUserEventProvider._(argument: id, from: this);

  @override
  String toString() => r'getUserEventProvider';
}

@ProviderFor(getUserEvents)
const getUserEventsProvider = GetUserEventsFamily._();

final class GetUserEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PaginationResult<UserEventModel>>,
          PaginationResult<UserEventModel>,
          FutureOr<PaginationResult<UserEventModel>>
        >
    with
        $FutureModifier<PaginationResult<UserEventModel>>,
        $FutureProvider<PaginationResult<UserEventModel>> {
  const GetUserEventsProvider._({
    required GetUserEventsFamily super.from,
    required ({
      int? page,
      int? eventId,
      String? userId,
      List<AnyStepFilter<dynamic>>? filters,
      AnyStepOrder? order,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'getUserEventsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUserEventsHash();

  @override
  String toString() {
    return r'getUserEventsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PaginationResult<UserEventModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PaginationResult<UserEventModel>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int? page,
              int? eventId,
              String? userId,
              List<AnyStepFilter<dynamic>>? filters,
              AnyStepOrder? order,
            });
    return getUserEvents(
      ref,
      page: argument.page,
      eventId: argument.eventId,
      userId: argument.userId,
      filters: argument.filters,
      order: argument.order,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserEventsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserEventsHash() => r'60c6a575c37f2d26748e92e88e294c249422051c';

final class GetUserEventsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PaginationResult<UserEventModel>>,
          ({
            int? page,
            int? eventId,
            String? userId,
            List<AnyStepFilter<dynamic>>? filters,
            AnyStepOrder? order,
          })
        > {
  const GetUserEventsFamily._()
    : super(
        retry: null,
        name: r'getUserEventsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUserEventsProvider call({
    int? page,
    int? eventId,
    String? userId,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) => GetUserEventsProvider._(
    argument: (
      page: page,
      eventId: eventId,
      userId: userId,
      filters: filters,
      order: order,
    ),
    from: this,
  );

  @override
  String toString() => r'getUserEventsProvider';
}

@ProviderFor(getCurrentUserEvents)
const getCurrentUserEventsProvider = GetCurrentUserEventsFamily._();

final class GetCurrentUserEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PaginationResult<UserEventModel>>,
          PaginationResult<UserEventModel>,
          FutureOr<PaginationResult<UserEventModel>>
        >
    with
        $FutureModifier<PaginationResult<UserEventModel>>,
        $FutureProvider<PaginationResult<UserEventModel>> {
  const GetCurrentUserEventsProvider._({
    required GetCurrentUserEventsFamily super.from,
    required ({
      int? page,
      int? eventId,
      List<AnyStepFilter<dynamic>>? filters,
      AnyStepOrder? order,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'getCurrentUserEventsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getCurrentUserEventsHash();

  @override
  String toString() {
    return r'getCurrentUserEventsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PaginationResult<UserEventModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PaginationResult<UserEventModel>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int? page,
              int? eventId,
              List<AnyStepFilter<dynamic>>? filters,
              AnyStepOrder? order,
            });
    return getCurrentUserEvents(
      ref,
      page: argument.page,
      eventId: argument.eventId,
      filters: argument.filters,
      order: argument.order,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetCurrentUserEventsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getCurrentUserEventsHash() =>
    r'80043a6b955e64ce90473a8aec3c62ecf6809e7d';

final class GetCurrentUserEventsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PaginationResult<UserEventModel>>,
          ({
            int? page,
            int? eventId,
            List<AnyStepFilter<dynamic>>? filters,
            AnyStepOrder? order,
          })
        > {
  const GetCurrentUserEventsFamily._()
    : super(
        retry: null,
        name: r'getCurrentUserEventsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetCurrentUserEventsProvider call({
    int? page,
    int? eventId,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) => GetCurrentUserEventsProvider._(
    argument: (page: page, eventId: eventId, filters: filters, order: order),
    from: this,
  );

  @override
  String toString() => r'getCurrentUserEventsProvider';
}
