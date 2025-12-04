// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_hours_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Raw list of user events (with embedded event & user) for a date range.
/// We request both user and event models from repository.

@ProviderFor(userEventsInRange)
const userEventsInRangeProvider = UserEventsInRangeFamily._();

/// Raw list of user events (with embedded event & user) for a date range.
/// We request both user and event models from repository.

final class UserEventsInRangeProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserEventModel>>,
          List<UserEventModel>,
          FutureOr<List<UserEventModel>>
        >
    with
        $FutureModifier<List<UserEventModel>>,
        $FutureProvider<List<UserEventModel>> {
  /// Raw list of user events (with embedded event & user) for a date range.
  /// We request both user and event models from repository.
  const UserEventsInRangeProvider._({
    required UserEventsInRangeFamily super.from,
    required ({DateTime start, DateTime end, bool attendedOnly}) super.argument,
  }) : super(
         retry: null,
         name: r'userEventsInRangeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userEventsInRangeHash();

  @override
  String toString() {
    return r'userEventsInRangeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<UserEventModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserEventModel>> create(Ref ref) {
    final argument =
        this.argument as ({DateTime start, DateTime end, bool attendedOnly});
    return userEventsInRange(
      ref,
      start: argument.start,
      end: argument.end,
      attendedOnly: argument.attendedOnly,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserEventsInRangeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userEventsInRangeHash() => r'ee760e47a276d34bb7406434588037548c9a92fa';

/// Raw list of user events (with embedded event & user) for a date range.
/// We request both user and event models from repository.

final class UserEventsInRangeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<UserEventModel>>,
          ({DateTime start, DateTime end, bool attendedOnly})
        > {
  const UserEventsInRangeFamily._()
    : super(
        retry: null,
        name: r'userEventsInRangeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Raw list of user events (with embedded event & user) for a date range.
  /// We request both user and event models from repository.

  UserEventsInRangeProvider call({
    required DateTime start,
    required DateTime end,
    bool attendedOnly = true,
  }) => UserEventsInRangeProvider._(
    argument: (start: start, end: end, attendedOnly: attendedOnly),
    from: this,
  );

  @override
  String toString() => r'userEventsInRangeProvider';
}

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.

@ProviderFor(volunteerHoursAggregate)
const volunteerHoursAggregateProvider = VolunteerHoursAggregateFamily._();

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.

final class VolunteerHoursAggregateProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VolunteerHoursReport>>,
          List<VolunteerHoursReport>,
          FutureOr<List<VolunteerHoursReport>>
        >
    with
        $FutureModifier<List<VolunteerHoursReport>>,
        $FutureProvider<List<VolunteerHoursReport>> {
  /// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
  const VolunteerHoursAggregateProvider._({
    required VolunteerHoursAggregateFamily super.from,
    required ({DateTime start, DateTime end}) super.argument,
  }) : super(
         retry: null,
         name: r'volunteerHoursAggregateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$volunteerHoursAggregateHash();

  @override
  String toString() {
    return r'volunteerHoursAggregateProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<VolunteerHoursReport>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VolunteerHoursReport>> create(Ref ref) {
    final argument = this.argument as ({DateTime start, DateTime end});
    return volunteerHoursAggregate(
      ref,
      start: argument.start,
      end: argument.end,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VolunteerHoursAggregateProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$volunteerHoursAggregateHash() =>
    r'10176eafd4c64e34bd68ffe1ee9cb4424041074e';

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.

final class VolunteerHoursAggregateFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<VolunteerHoursReport>>,
          ({DateTime start, DateTime end})
        > {
  const VolunteerHoursAggregateFamily._()
    : super(
        retry: null,
        name: r'volunteerHoursAggregateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.

  VolunteerHoursAggregateProvider call({
    required DateTime start,
    required DateTime end,
  }) => VolunteerHoursAggregateProvider._(
    argument: (start: start, end: end),
    from: this,
  );

  @override
  String toString() => r'volunteerHoursAggregateProvider';
}

/// Convenience provider: Year-to-date

@ProviderFor(volunteerHoursYtd)
const volunteerHoursYtdProvider = VolunteerHoursYtdProvider._();

/// Convenience provider: Year-to-date

final class VolunteerHoursYtdProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VolunteerHoursReport>>,
          List<VolunteerHoursReport>,
          FutureOr<List<VolunteerHoursReport>>
        >
    with
        $FutureModifier<List<VolunteerHoursReport>>,
        $FutureProvider<List<VolunteerHoursReport>> {
  /// Convenience provider: Year-to-date
  const VolunteerHoursYtdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'volunteerHoursYtdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$volunteerHoursYtdHash();

  @$internal
  @override
  $FutureProviderElement<List<VolunteerHoursReport>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VolunteerHoursReport>> create(Ref ref) {
    return volunteerHoursYtd(ref);
  }
}

String _$volunteerHoursYtdHash() => r'4d3cfe11eeafb69879ea30051ce4543c7bf81cc1';

/// Convenience provider: Current month

@ProviderFor(volunteerHoursThisMonth)
const volunteerHoursThisMonthProvider = VolunteerHoursThisMonthProvider._();

/// Convenience provider: Current month

final class VolunteerHoursThisMonthProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VolunteerHoursReport>>,
          List<VolunteerHoursReport>,
          FutureOr<List<VolunteerHoursReport>>
        >
    with
        $FutureModifier<List<VolunteerHoursReport>>,
        $FutureProvider<List<VolunteerHoursReport>> {
  /// Convenience provider: Current month
  const VolunteerHoursThisMonthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'volunteerHoursThisMonthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$volunteerHoursThisMonthHash();

  @$internal
  @override
  $FutureProviderElement<List<VolunteerHoursReport>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VolunteerHoursReport>> create(Ref ref) {
    return volunteerHoursThisMonth(ref);
  }
}

String _$volunteerHoursThisMonthHash() =>
    r'b7c49894b18d3bd439e2963d26c60d33e2a9a539';
