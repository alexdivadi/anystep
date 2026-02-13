// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(blogRepository)
const blogRepositoryProvider = BlogRepositoryProvider._();

final class BlogRepositoryProvider
    extends $FunctionalProvider<BlogRepository, BlogRepository, BlogRepository>
    with $Provider<BlogRepository> {
  const BlogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'blogRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$blogRepositoryHash();

  @$internal
  @override
  $ProviderElement<BlogRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BlogRepository create(Ref ref) {
    return blogRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BlogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BlogRepository>(value),
    );
  }
}

String _$blogRepositoryHash() => r'b3131a58650a6fc52377c50812add94c884badeb';
