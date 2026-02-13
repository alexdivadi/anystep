// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_channels_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BlogChannelsController)
const blogChannelsControllerProvider = BlogChannelsControllerFamily._();

final class BlogChannelsControllerProvider
    extends
        $AsyncNotifierProvider<BlogChannelsController, List<BlogChannelModel>> {
  const BlogChannelsControllerProvider._({
    required BlogChannelsControllerFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'blogChannelsControllerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$blogChannelsControllerHash();

  @override
  String toString() {
    return r'blogChannelsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BlogChannelsController create() => BlogChannelsController();

  @override
  bool operator ==(Object other) {
    return other is BlogChannelsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$blogChannelsControllerHash() =>
    r'64ee4cc69f66eaa2e72a1adcd6d033ffb29c192f';

final class BlogChannelsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          BlogChannelsController,
          AsyncValue<List<BlogChannelModel>>,
          List<BlogChannelModel>,
          FutureOr<List<BlogChannelModel>>,
          int?
        > {
  const BlogChannelsControllerFamily._()
    : super(
        retry: null,
        name: r'blogChannelsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  BlogChannelsControllerProvider call({int? eventId}) =>
      BlogChannelsControllerProvider._(argument: eventId, from: this);

  @override
  String toString() => r'blogChannelsControllerProvider';
}

abstract class _$BlogChannelsController
    extends $AsyncNotifier<List<BlogChannelModel>> {
  late final _$args = ref.$arg as int?;
  int? get eventId => _$args;

  FutureOr<List<BlogChannelModel>> build({int? eventId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(eventId: _$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<List<BlogChannelModel>>, List<BlogChannelModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<BlogChannelModel>>,
                List<BlogChannelModel>
              >,
              AsyncValue<List<BlogChannelModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
