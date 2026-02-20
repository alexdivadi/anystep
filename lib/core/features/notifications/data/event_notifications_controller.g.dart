// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_notifications_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EventNotificationsController)
const eventNotificationsControllerProvider =
    EventNotificationsControllerProvider._();

final class EventNotificationsControllerProvider
    extends $AsyncNotifierProvider<EventNotificationsController, bool> {
  const EventNotificationsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventNotificationsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventNotificationsControllerHash();

  @$internal
  @override
  EventNotificationsController create() => EventNotificationsController();
}

String _$eventNotificationsControllerHash() =>
    r'c6db4a7984c1bee29080daaf3a9547b067d63e6d';

abstract class _$EventNotificationsController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
