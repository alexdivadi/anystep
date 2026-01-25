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
    r'9d861a1b60897a8b361e4e50e56c638b1f68e86a';

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
