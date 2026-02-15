// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee_search_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AttendeeSearchFormController)
const attendeeSearchFormControllerProvider =
    AttendeeSearchFormControllerFamily._();

final class AttendeeSearchFormControllerProvider
    extends $AsyncNotifierProvider<AttendeeSearchFormController, void> {
  const AttendeeSearchFormControllerProvider._({
    required AttendeeSearchFormControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'attendeeSearchFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$attendeeSearchFormControllerHash();

  @override
  String toString() {
    return r'attendeeSearchFormControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AttendeeSearchFormController create() => AttendeeSearchFormController();

  @override
  bool operator ==(Object other) {
    return other is AttendeeSearchFormControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$attendeeSearchFormControllerHash() =>
    r'9ce6c0c5c76074827c8514f42608701e26a75fe6';

final class AttendeeSearchFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          AttendeeSearchFormController,
          AsyncValue<void>,
          void,
          FutureOr<void>,
          int
        > {
  const AttendeeSearchFormControllerFamily._()
    : super(
        retry: null,
        name: r'attendeeSearchFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AttendeeSearchFormControllerProvider call(int eventId) =>
      AttendeeSearchFormControllerProvider._(argument: eventId, from: this);

  @override
  String toString() => r'attendeeSearchFormControllerProvider';
}

abstract class _$AttendeeSearchFormController extends $AsyncNotifier<void> {
  late final _$args = ref.$arg as int;
  int get eventId => _$args;

  FutureOr<void> build(int eventId);
  @$mustCallSuper
  @override
  void runBuild() {
    build(_$args);
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
