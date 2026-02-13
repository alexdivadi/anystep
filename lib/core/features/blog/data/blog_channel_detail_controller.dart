import 'dart:async';

import 'package:anystep/core/features/blog/data/blog_repository_impl.dart';
import 'package:anystep/core/features/blog/domain/models/blog_channel.dart';
import 'package:anystep/core/features/blog/domain/models/blog_comment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blog_channel_detail_controller.g.dart';

@riverpod
Future<BlogChannelModel> getBlogChannel(Ref ref, int channelId) async {
  return ref.watch(blogRepositoryProvider).getChannel(channelId: channelId);
}

@riverpod
Future<List<BlogCommentModel>> getBlogChannelComments(Ref ref, int channelId) async {
  return ref.watch(blogRepositoryProvider).listComments(channelId: channelId);
}

@riverpod
class BlogChannelActionsController extends _$BlogChannelActionsController {
  @override
  FutureOr<void> build() {}

  Future<void> addComment({required BlogCommentModel comment}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(blogRepositoryProvider).createComment(comment: comment);
    });
    ref.invalidate(getBlogChannelCommentsProvider(comment.channelId));
  }

  Future<void> updateComment({required BlogCommentModel comment}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(blogRepositoryProvider).updateComment(comment: comment);
    });
    ref.invalidate(getBlogChannelCommentsProvider(comment.channelId));
  }

  Future<void> deleteComment({required int channelId, required int commentId}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(blogRepositoryProvider).deleteComment(commentId: commentId);
    });
    ref.invalidate(getBlogChannelCommentsProvider(channelId));
  }

  Future<void> setCommentPinned({
    required int channelId,
    required int commentId,
    required bool isPinned,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(blogRepositoryProvider).setCommentPinned(
            commentId: commentId,
            isPinned: isPinned,
          );
    });
    ref.invalidate(getBlogChannelCommentsProvider(channelId));
  }

  Future<void> setChannelClosed({required int channelId, required bool isClosed}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(blogRepositoryProvider).setChannelClosed(
            channelId: channelId,
            isClosed: isClosed,
          );
    });
    ref.invalidate(getBlogChannelProvider(channelId));
  }
}
