// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_channel_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getBlogChannel)
const getBlogChannelProvider = GetBlogChannelFamily._();

final class GetBlogChannelProvider
    extends
        $FunctionalProvider<
          AsyncValue<BlogChannelModel>,
          BlogChannelModel,
          FutureOr<BlogChannelModel>
        >
    with $FutureModifier<BlogChannelModel>, $FutureProvider<BlogChannelModel> {
  const GetBlogChannelProvider._({
    required GetBlogChannelFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getBlogChannelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getBlogChannelHash();

  @override
  String toString() {
    return r'getBlogChannelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<BlogChannelModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BlogChannelModel> create(Ref ref) {
    final argument = this.argument as int;
    return getBlogChannel(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBlogChannelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getBlogChannelHash() => r'5132135a4891033dec1be0d3d806ba4905b21959';

final class GetBlogChannelFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<BlogChannelModel>, int> {
  const GetBlogChannelFamily._()
    : super(
        retry: null,
        name: r'getBlogChannelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetBlogChannelProvider call(int channelId) =>
      GetBlogChannelProvider._(argument: channelId, from: this);

  @override
  String toString() => r'getBlogChannelProvider';
}

@ProviderFor(getBlogChannelComments)
const getBlogChannelCommentsProvider = GetBlogChannelCommentsFamily._();

final class GetBlogChannelCommentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BlogCommentModel>>,
          List<BlogCommentModel>,
          FutureOr<List<BlogCommentModel>>
        >
    with
        $FutureModifier<List<BlogCommentModel>>,
        $FutureProvider<List<BlogCommentModel>> {
  const GetBlogChannelCommentsProvider._({
    required GetBlogChannelCommentsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getBlogChannelCommentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getBlogChannelCommentsHash();

  @override
  String toString() {
    return r'getBlogChannelCommentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<BlogCommentModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BlogCommentModel>> create(Ref ref) {
    final argument = this.argument as int;
    return getBlogChannelComments(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBlogChannelCommentsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getBlogChannelCommentsHash() =>
    r'cc4b3080819731a9521c17635ce13c4c9bf286ad';

final class GetBlogChannelCommentsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<BlogCommentModel>>, int> {
  const GetBlogChannelCommentsFamily._()
    : super(
        retry: null,
        name: r'getBlogChannelCommentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetBlogChannelCommentsProvider call(int channelId) =>
      GetBlogChannelCommentsProvider._(argument: channelId, from: this);

  @override
  String toString() => r'getBlogChannelCommentsProvider';
}

@ProviderFor(BlogChannelActionsController)
const blogChannelActionsControllerProvider =
    BlogChannelActionsControllerProvider._();

final class BlogChannelActionsControllerProvider
    extends $AsyncNotifierProvider<BlogChannelActionsController, void> {
  const BlogChannelActionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'blogChannelActionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$blogChannelActionsControllerHash();

  @$internal
  @override
  BlogChannelActionsController create() => BlogChannelActionsController();
}

String _$blogChannelActionsControllerHash() =>
    r'8337e7eb04ac5bc159dcb656722bcd32ed3a782a';

abstract class _$BlogChannelActionsController extends $AsyncNotifier<void> {
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
