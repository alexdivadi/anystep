import 'package:anystep/core/features/blog/domain/models/blog_channel.dart';
import 'package:anystep/core/features/blog/domain/models/blog_comment.dart';
import 'package:anystep/core/features/blog/domain/repositories/blog_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blog_repository_impl.g.dart';

class BlogRepositoryImpl implements BlogRepository {
  const BlogRepositoryImpl();

  @override
  Future<BlogChannelModel> createOrUpdateChannel({
    required BlogChannelModel channel,
    String? documentId,
  }) {
    throw UnimplementedError('BlogRepositoryImpl.createOrUpdateChannel');
  }

  @override
  Future<void> deleteComment({required int commentId}) {
    throw UnimplementedError('BlogRepositoryImpl.deleteComment');
  }

  @override
  Future<BlogChannelModel> getChannel({required int channelId}) {
    throw UnimplementedError('BlogRepositoryImpl.getChannel');
  }

  @override
  Future<bool> isSubscribed({required int channelId}) {
    throw UnimplementedError('BlogRepositoryImpl.isSubscribed');
  }

  @override
  Future<List<BlogChannelModel>> listChannels({int? eventId}) {
    throw UnimplementedError('BlogRepositoryImpl.listChannels');
  }

  @override
  Future<List<BlogCommentModel>> listComments({required int channelId}) {
    throw UnimplementedError('BlogRepositoryImpl.listComments');
  }

  @override
  Future<BlogCommentModel> createComment({required BlogCommentModel comment}) {
    throw UnimplementedError('BlogRepositoryImpl.createComment');
  }

  @override
  Future<BlogCommentModel> updateComment({required BlogCommentModel comment}) {
    throw UnimplementedError('BlogRepositoryImpl.updateComment');
  }

  @override
  Future<void> setChannelClosed({required int channelId, required bool isClosed}) {
    throw UnimplementedError('BlogRepositoryImpl.setChannelClosed');
  }

  @override
  Future<void> setCommentPinned({required int commentId, required bool isPinned}) {
    throw UnimplementedError('BlogRepositoryImpl.setCommentPinned');
  }

  @override
  Future<void> subscribe({required int channelId}) {
    throw UnimplementedError('BlogRepositoryImpl.subscribe');
  }

  @override
  Future<void> unsubscribe({required int channelId}) {
    throw UnimplementedError('BlogRepositoryImpl.unsubscribe');
  }
}

@riverpod
BlogRepository blogRepository(Ref ref) {
  return const BlogRepositoryImpl();
}
