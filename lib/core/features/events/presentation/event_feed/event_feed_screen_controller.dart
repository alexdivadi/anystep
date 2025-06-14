import 'package:appwrite/appwrite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'event_feed_screen_state.dart';
part 'event_feed_screen_controller.g.dart';

@riverpod
class EventFeedScreenController extends _$EventFeedScreenController {
  @override
  Future<EventFeedScreenState> build() async => _fetch();

  static const int limit = 25;

  Future<EventFeedScreenState> _fetch({String? lastId, EventFeedScreenState? prevState}) async {
    final repo = ref.read(eventRepositoryProvider);
    final page = await repo.list(
      queries: [
        Query.orderDesc('start_time'),
        Query.limit(limit),
        if (lastId != null) Query.cursorAfter(lastId),
      ],
    );
    final prev = prevState ?? const EventFeedScreenState();
    final items = lastId == null ? page : [...prev.items, ...page];
    final newLastId = page.isNotEmpty ? page.last.id : prev.lastId;
    return prev.copyWith(items: items, page: page, lastId: newLastId);
  }

  Future<void> fetchEvents({String? lastId}) async {
    state = await AsyncValue.guard(
      () async => await _fetch(lastId: lastId, prevState: state.valueOrNull),
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    await fetchEvents();
  }
}
