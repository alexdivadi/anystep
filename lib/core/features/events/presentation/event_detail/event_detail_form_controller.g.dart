// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EventDetailFormController)
const eventDetailFormControllerProvider = EventDetailFormControllerFamily._();

final class EventDetailFormControllerProvider
    extends $NotifierProvider<EventDetailFormController, EventDetailFormState> {
  const EventDetailFormControllerProvider._({
    required EventDetailFormControllerFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'eventDetailFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$eventDetailFormControllerHash();

  @override
  String toString() {
    return r'eventDetailFormControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EventDetailFormController create() => EventDetailFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventDetailFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventDetailFormState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EventDetailFormControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$eventDetailFormControllerHash() =>
    r'7a7702d263176f0b26f413df8f9c72989bf89bcd';

final class EventDetailFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          EventDetailFormController,
          EventDetailFormState,
          EventDetailFormState,
          EventDetailFormState,
          int?
        > {
  const EventDetailFormControllerFamily._()
    : super(
        retry: null,
        name: r'eventDetailFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EventDetailFormControllerProvider call(int? eventId) =>
      EventDetailFormControllerProvider._(argument: eventId, from: this);

  @override
  String toString() => r'eventDetailFormControllerProvider';
}

abstract class _$EventDetailFormController
    extends $Notifier<EventDetailFormState> {
  late final _$args = ref.$arg as int?;
  int? get eventId => _$args;

  EventDetailFormState build(int? eventId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<EventDetailFormState, EventDetailFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EventDetailFormState, EventDetailFormState>,
              EventDetailFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
