// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(eventRepository)
const eventRepositoryProvider = EventRepositoryProvider._();

final class EventRepositoryProvider
    extends
        $FunctionalProvider<EventRepository, EventRepository, EventRepository>
    with $Provider<EventRepository> {
  const EventRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventRepositoryHash();

  @$internal
  @override
  $ProviderElement<EventRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EventRepository create(Ref ref) {
    return eventRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventRepository>(value),
    );
  }
}

String _$eventRepositoryHash() => r'91fd9a3b10390062e18cef77cb13521e86c6d448';

@ProviderFor(getEvent)
const getEventProvider = GetEventFamily._();

final class GetEventProvider
    extends
        $FunctionalProvider<
          AsyncValue<EventModel>,
          EventModel,
          FutureOr<EventModel>
        >
    with $FutureModifier<EventModel>, $FutureProvider<EventModel> {
  const GetEventProvider._({
    required GetEventFamily super.from,
    required (int, {bool withAddress}) super.argument,
  }) : super(
         retry: null,
         name: r'getEventProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getEventHash();

  @override
  String toString() {
    return r'getEventProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<EventModel> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<EventModel> create(Ref ref) {
    final argument = this.argument as (int, {bool withAddress});
    return getEvent(ref, argument.$1, withAddress: argument.withAddress);
  }

  @override
  bool operator ==(Object other) {
    return other is GetEventProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getEventHash() => r'a1c6cab3570b28dc4e73ccd970b477aced839f14';

final class GetEventFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<EventModel>,
          (int, {bool withAddress})
        > {
  const GetEventFamily._()
    : super(
        retry: null,
        name: r'getEventProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetEventProvider call(int id, {bool withAddress = true}) =>
      GetEventProvider._(argument: (id, withAddress: withAddress), from: this);

  @override
  String toString() => r'getEventProvider';
}

@ProviderFor(getEvents)
const getEventsProvider = GetEventsFamily._();

final class GetEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PaginationResult<EventModel>>,
          PaginationResult<EventModel>,
          FutureOr<PaginationResult<EventModel>>
        >
    with
        $FutureModifier<PaginationResult<EventModel>>,
        $FutureProvider<PaginationResult<EventModel>> {
  const GetEventsProvider._({
    required GetEventsFamily super.from,
    required ({
      int? page,
      String? search,
      List<AnyStepFilter<dynamic>>? filters,
      AnyStepOrder? order,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'getEventsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getEventsHash();

  @override
  String toString() {
    return r'getEventsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PaginationResult<EventModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PaginationResult<EventModel>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int? page,
              String? search,
              List<AnyStepFilter<dynamic>>? filters,
              AnyStepOrder? order,
            });
    return getEvents(
      ref,
      page: argument.page,
      search: argument.search,
      filters: argument.filters,
      order: argument.order,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetEventsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getEventsHash() => r'd084cf0138c8e8121f9f9a3990f15571deb2857b';

final class GetEventsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PaginationResult<EventModel>>,
          ({
            int? page,
            String? search,
            List<AnyStepFilter<dynamic>>? filters,
            AnyStepOrder? order,
          })
        > {
  const GetEventsFamily._()
    : super(
        retry: null,
        name: r'getEventsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetEventsProvider call({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) => GetEventsProvider._(
    argument: (page: page, search: search, filters: filters, order: order),
    from: this,
  );

  @override
  String toString() => r'getEventsProvider';
}

@ProviderFor(getUpcomingEvents)
const getUpcomingEventsProvider = GetUpcomingEventsFamily._();

final class GetUpcomingEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PaginationResult<EventModel>>,
          PaginationResult<EventModel>,
          FutureOr<PaginationResult<EventModel>>
        >
    with
        $FutureModifier<PaginationResult<EventModel>>,
        $FutureProvider<PaginationResult<EventModel>> {
  const GetUpcomingEventsProvider._({
    required GetUpcomingEventsFamily super.from,
    required ({
      int? page,
      String? search,
      List<AnyStepFilter<dynamic>>? filters,
      AnyStepOrder? order,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'getUpcomingEventsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUpcomingEventsHash();

  @override
  String toString() {
    return r'getUpcomingEventsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PaginationResult<EventModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PaginationResult<EventModel>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int? page,
              String? search,
              List<AnyStepFilter<dynamic>>? filters,
              AnyStepOrder? order,
            });
    return getUpcomingEvents(
      ref,
      page: argument.page,
      search: argument.search,
      filters: argument.filters,
      order: argument.order,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetUpcomingEventsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUpcomingEventsHash() => r'0887d30dafb4f176385152bb01cfc3f2db8912ee';

final class GetUpcomingEventsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PaginationResult<EventModel>>,
          ({
            int? page,
            String? search,
            List<AnyStepFilter<dynamic>>? filters,
            AnyStepOrder? order,
          })
        > {
  const GetUpcomingEventsFamily._()
    : super(
        retry: null,
        name: r'getUpcomingEventsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetUpcomingEventsProvider call({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) => GetUpcomingEventsProvider._(
    argument: (page: page, search: search, filters: filters, order: order),
    from: this,
  );

  @override
  String toString() => r'getUpcomingEventsProvider';
}

@ProviderFor(getPastEvents)
const getPastEventsProvider = GetPastEventsFamily._();

final class GetPastEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PaginationResult<EventModel>>,
          PaginationResult<EventModel>,
          FutureOr<PaginationResult<EventModel>>
        >
    with
        $FutureModifier<PaginationResult<EventModel>>,
        $FutureProvider<PaginationResult<EventModel>> {
  const GetPastEventsProvider._({
    required GetPastEventsFamily super.from,
    required ({
      int? page,
      String? search,
      List<AnyStepFilter<dynamic>>? filters,
      AnyStepOrder? order,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'getPastEventsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getPastEventsHash();

  @override
  String toString() {
    return r'getPastEventsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PaginationResult<EventModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PaginationResult<EventModel>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              int? page,
              String? search,
              List<AnyStepFilter<dynamic>>? filters,
              AnyStepOrder? order,
            });
    return getPastEvents(
      ref,
      page: argument.page,
      search: argument.search,
      filters: argument.filters,
      order: argument.order,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetPastEventsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getPastEventsHash() => r'f1c7356fd9383c6b71c3494f6a35aa1221690546';

final class GetPastEventsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PaginationResult<EventModel>>,
          ({
            int? page,
            String? search,
            List<AnyStepFilter<dynamic>>? filters,
            AnyStepOrder? order,
          })
        > {
  const GetPastEventsFamily._()
    : super(
        retry: null,
        name: r'getPastEventsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetPastEventsProvider call({
    int? page,
    String? search,
    List<AnyStepFilter<dynamic>>? filters,
    AnyStepOrder? order,
  }) => GetPastEventsProvider._(
    argument: (page: page, search: search, filters: filters, order: order),
    from: this,
  );

  @override
  String toString() => r'getPastEventsProvider';
}
