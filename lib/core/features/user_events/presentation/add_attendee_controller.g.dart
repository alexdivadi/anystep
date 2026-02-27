// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_attendee_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddAttendeeController)
const addAttendeeControllerProvider = AddAttendeeControllerProvider._();

final class AddAttendeeControllerProvider
    extends $AsyncNotifierProvider<AddAttendeeController, void> {
  const AddAttendeeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addAttendeeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addAttendeeControllerHash();

  @$internal
  @override
  AddAttendeeController create() => AddAttendeeController();
}

String _$addAttendeeControllerHash() =>
    r'1e18d542d468f6e018ad100545e6a8005161e1c2';

abstract class _$AddAttendeeController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
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
