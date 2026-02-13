import 'package:anystep/core/features/blog/data/blog_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_subscription_controller.g.dart';

@Riverpod(keepAlive: true)
class ChannelSubscriptionController extends _$ChannelSubscriptionController {
  @override
  Future<bool> build(int channelId) async {
    return ref.read(blogRepositoryProvider).isSubscribed(channelId: channelId);
  }

  Future<void> subscribe(int channelId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(blogRepositoryProvider).subscribe(channelId: channelId);
      return true;
    });
  }

  Future<void> unsubscribe(int channelId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(blogRepositoryProvider).unsubscribe(channelId: channelId);
      return false;
    });
  }
}
