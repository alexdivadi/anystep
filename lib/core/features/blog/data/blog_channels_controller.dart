import 'package:anystep/core/features/blog/data/blog_repository_impl.dart';
import 'package:anystep/core/features/blog/domain/models/blog_channel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blog_channels_controller.g.dart';

@Riverpod(keepAlive: true)
class BlogChannelsController extends _$BlogChannelsController {
  @override
  Future<List<BlogChannelModel>> build({int? eventId}) async {
    return ref.read(blogRepositoryProvider).listChannels(eventId: eventId);
  }

  Future<void> refresh({int? eventId}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(blogRepositoryProvider).listChannels(eventId: eventId),
    );
  }

  Future<void> createChannel({required BlogChannelModel channel}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(blogRepositoryProvider).createOrUpdateChannel(channel: channel);
      return ref.read(blogRepositoryProvider).listChannels(eventId: channel.eventId);
    });
  }
}
