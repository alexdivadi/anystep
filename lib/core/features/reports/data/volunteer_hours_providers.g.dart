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
    required ({DateTime start, DateTime end, bool attendedOnly, String? userId})
    super.argument,
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
        this.argument
            as ({
              DateTime start,
              DateTime end,
              bool attendedOnly,
              String? userId,
            });
    return userEventsInRange(
      ref,
      start: argument.start,
      end: argument.end,
      attendedOnly: argument.attendedOnly,
      userId: argument.userId,
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

String _$userEventsInRangeHash() => r'cf99a0ed79ba208b576282cfdb14b4a4d5451acd';

/// Raw list of user events (with embedded event & user) for a date range.
/// We request both user and event models from repository.

final class UserEventsInRangeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<UserEventModel>>,
          ({DateTime start, DateTime end, bool attendedOnly, String? userId})
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
    String? userId,
  }) => UserEventsInRangeProvider._(
    argument: (
      start: start,
      end: end,
      attendedOnly: attendedOnly,
      userId: userId,
    ),
    from: this,
  );

  @override
  String toString() => r'userEventsInRangeProvider';
}

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
/// Uses check-in/check-out when available, otherwise falls back to event start/end.

@ProviderFor(volunteerHoursAggregate)
const volunteerHoursAggregateProvider = VolunteerHoursAggregateFamily._();

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
/// Uses check-in/check-out when available, otherwise falls back to event start/end.

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
  /// Uses check-in/check-out when available, otherwise falls back to event start/end.
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
    r'3234e414926116f17569d96ac2f39fd6f1a9b944';

/// Aggregates volunteer hours per user given user events. Applies an 8 hour cap per event day.
/// Uses check-in/check-out when available, otherwise falls back to event start/end.

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
  /// Uses check-in/check-out when available, otherwise falls back to event start/end.

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

@ProviderFor(volunteerHoursSummaryThisMonth)
const volunteerHoursSummaryThisMonthProvider =
    VolunteerHoursSummaryThisMonthProvider._();

final class VolunteerHoursSummaryThisMonthProvider
    extends
        $FunctionalProvider<
          AsyncValue<VolunteerHoursSummary>,
          VolunteerHoursSummary,
          FutureOr<VolunteerHoursSummary>
        >
    with
        $FutureModifier<VolunteerHoursSummary>,
        $FutureProvider<VolunteerHoursSummary> {
  const VolunteerHoursSummaryThisMonthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'volunteerHoursSummaryThisMonthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$volunteerHoursSummaryThisMonthHash();

  @$internal
  @override
  $FutureProviderElement<VolunteerHoursSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<VolunteerHoursSummary> create(Ref ref) {
    return volunteerHoursSummaryThisMonth(ref);
  }
}

String _$volunteerHoursSummaryThisMonthHash() =>
    r'3f7c791c6f7c14ddd41e2334c50fd22b25ee121b';

@ProviderFor(volunteerHoursSummaryYtd)
const volunteerHoursSummaryYtdProvider = VolunteerHoursSummaryYtdProvider._();

final class VolunteerHoursSummaryYtdProvider
    extends
        $FunctionalProvider<
          AsyncValue<VolunteerHoursSummary>,
          VolunteerHoursSummary,
          FutureOr<VolunteerHoursSummary>
        >
    with
        $FutureModifier<VolunteerHoursSummary>,
        $FutureProvider<VolunteerHoursSummary> {
  const VolunteerHoursSummaryYtdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'volunteerHoursSummaryYtdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$volunteerHoursSummaryYtdHash();

  @$internal
  @override
  $FutureProviderElement<VolunteerHoursSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<VolunteerHoursSummary> create(Ref ref) {
    return volunteerHoursSummaryYtd(ref);
  }
}

String _$volunteerHoursSummaryYtdHash() =>
    r'147c87aabc1785684595157dab26dabe9a4f81a9';

@ProviderFor(volunteerMonthlyHoursYtd)
const volunteerMonthlyHoursYtdProvider = VolunteerMonthlyHoursYtdProvider._();

final class VolunteerMonthlyHoursYtdProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MonthlyHoursPoint>>,
          List<MonthlyHoursPoint>,
          FutureOr<List<MonthlyHoursPoint>>
        >
    with
        $FutureModifier<List<MonthlyHoursPoint>>,
        $FutureProvider<List<MonthlyHoursPoint>> {
  const VolunteerMonthlyHoursYtdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'volunteerMonthlyHoursYtdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$volunteerMonthlyHoursYtdHash();

  @$internal
  @override
  $FutureProviderElement<List<MonthlyHoursPoint>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MonthlyHoursPoint>> create(Ref ref) {
    return volunteerMonthlyHoursYtd(ref);
  }
}

String _$volunteerMonthlyHoursYtdHash() =>
    r'49703bc217d317de105a9ce44936d83194b0a5f7';

@ProviderFor(currentUserHoursSummaryThisMonth)
const currentUserHoursSummaryThisMonthProvider =
    CurrentUserHoursSummaryThisMonthProvider._();

final class CurrentUserHoursSummaryThisMonthProvider
    extends
        $FunctionalProvider<
          AsyncValue<VolunteerHoursSummary>,
          VolunteerHoursSummary,
          FutureOr<VolunteerHoursSummary>
        >
    with
        $FutureModifier<VolunteerHoursSummary>,
        $FutureProvider<VolunteerHoursSummary> {
  const CurrentUserHoursSummaryThisMonthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserHoursSummaryThisMonthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHoursSummaryThisMonthHash();

  @$internal
  @override
  $FutureProviderElement<VolunteerHoursSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<VolunteerHoursSummary> create(Ref ref) {
    return currentUserHoursSummaryThisMonth(ref);
  }
}

String _$currentUserHoursSummaryThisMonthHash() =>
    r'f8ddc9d7df031e72ff50b5926b78f2712177a381';

@ProviderFor(currentUserHoursSummaryYtd)
const currentUserHoursSummaryYtdProvider =
    CurrentUserHoursSummaryYtdProvider._();

final class CurrentUserHoursSummaryYtdProvider
    extends
        $FunctionalProvider<
          AsyncValue<VolunteerHoursSummary>,
          VolunteerHoursSummary,
          FutureOr<VolunteerHoursSummary>
        >
    with
        $FutureModifier<VolunteerHoursSummary>,
        $FutureProvider<VolunteerHoursSummary> {
  const CurrentUserHoursSummaryYtdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserHoursSummaryYtdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHoursSummaryYtdHash();

  @$internal
  @override
  $FutureProviderElement<VolunteerHoursSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<VolunteerHoursSummary> create(Ref ref) {
    return currentUserHoursSummaryYtd(ref);
  }
}

String _$currentUserHoursSummaryYtdHash() =>
    r'6d39d3a9b52e50926fd0dd39ddfc720ba4020224';

@ProviderFor(currentUserMonthlyHoursYtd)
const currentUserMonthlyHoursYtdProvider =
    CurrentUserMonthlyHoursYtdProvider._();

final class CurrentUserMonthlyHoursYtdProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MonthlyHoursPoint>>,
          List<MonthlyHoursPoint>,
          FutureOr<List<MonthlyHoursPoint>>
        >
    with
        $FutureModifier<List<MonthlyHoursPoint>>,
        $FutureProvider<List<MonthlyHoursPoint>> {
  const CurrentUserMonthlyHoursYtdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserMonthlyHoursYtdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserMonthlyHoursYtdHash();

  @$internal
  @override
  $FutureProviderElement<List<MonthlyHoursPoint>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MonthlyHoursPoint>> create(Ref ref) {
    return currentUserMonthlyHoursYtd(ref);
  }
}

String _$currentUserMonthlyHoursYtdHash() =>
    r'2622c1d4dcc1a5891ec2f1e6c4df2be4c048b78c';
