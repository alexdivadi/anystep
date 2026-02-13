import 'package:anystep/core/features/blog/domain/models/blog_channel.dart';
import 'package:anystep/core/features/blog/domain/models/blog_comment.dart';

abstract class BlogRepository {
  Future<List<BlogChannelModel>> listChannels({int? eventId});
  Future<BlogChannelModel> getChannel({required int channelId});
  Future<BlogChannelModel> createOrUpdateChannel({
    required BlogChannelModel channel,
    String? documentId,
  });
  Future<void> setChannelClosed({required int channelId, required bool isClosed});

  Future<List<BlogCommentModel>> listComments({required int channelId});
  Future<BlogCommentModel> createComment({required BlogCommentModel comment});
  Future<BlogCommentModel> updateComment({required BlogCommentModel comment});
  Future<void> deleteComment({required int commentId});
  Future<void> setCommentPinned({required int commentId, required bool isPinned});

  Future<bool> isSubscribed({required int channelId});
  Future<void> subscribe({required int channelId});
  Future<void> unsubscribe({required int channelId});
}
