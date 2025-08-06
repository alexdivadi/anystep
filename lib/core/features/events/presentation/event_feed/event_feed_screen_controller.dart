import 'package:anystep/database/filter.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'event_feed_screen_state.dart';

part 'event_feed_screen_controller.g.dart';

@riverpod
class EventFeedScreenController extends _$EventFeedScreenController {
  @override
  Future<EventFeedScreenState> build() async => _fetch();

  static const int limit = 25;

  Future<EventFeedScreenState> _fetch({int? pageNum, EventFeedScreenState? prevState}) async {
    final repo = ref.read(eventRepositoryProvider);
    final page = await repo.list(
      order: AnyStepOrder(column: 'createdAt', ascending: false),
      limit: limit,
      page: pageNum ?? 0,
    );
    final prev = prevState ?? const EventFeedScreenState();
    final items = pageNum == null ? page : [...prev.items, ...page];
    final newPageNum = (pageNum ?? 0) + 1;
    return prev.copyWith(items: items, page: page, pageNum: newPageNum);
  }

  Future<void> fetchEvents({int? pageNum}) async {
    state = await AsyncValue.guard(
      () async => await _fetch(pageNum: pageNum, prevState: state.valueOrNull),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    await fetchEvents();
  }
}
