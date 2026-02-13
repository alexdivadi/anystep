// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_subscription_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChannelSubscriptionController)
const channelSubscriptionControllerProvider =
    ChannelSubscriptionControllerFamily._();

final class ChannelSubscriptionControllerProvider
    extends $AsyncNotifierProvider<ChannelSubscriptionController, bool> {
  const ChannelSubscriptionControllerProvider._({
    required ChannelSubscriptionControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'channelSubscriptionControllerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$channelSubscriptionControllerHash();

  @override
  String toString() {
    return r'channelSubscriptionControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChannelSubscriptionController create() => ChannelSubscriptionController();

  @override
  bool operator ==(Object other) {
    return other is ChannelSubscriptionControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$channelSubscriptionControllerHash() =>
    r'a09ca69f96fc31bbe4a64c4f8bc31c50281cdea0';

final class ChannelSubscriptionControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ChannelSubscriptionController,
          AsyncValue<bool>,
          bool,
          FutureOr<bool>,
          int
        > {
  const ChannelSubscriptionControllerFamily._()
    : super(
        retry: null,
        name: r'channelSubscriptionControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ChannelSubscriptionControllerProvider call(int channelId) =>
      ChannelSubscriptionControllerProvider._(argument: channelId, from: this);

  @override
  String toString() => r'channelSubscriptionControllerProvider';
}

abstract class _$ChannelSubscriptionController extends $AsyncNotifier<bool> {
  late final _$args = ref.$arg as int;
  int get channelId => _$args;

  FutureOr<bool> build(int channelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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
