import 'package:anystep/core/common/widgets/paginated_list_view.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_screen.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_card.dart';
import 'package:anystep/core/features/events/presentation/widgets/no_events_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpcomingEventsFeed extends StatelessWidget {
  const UpcomingEventsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedListView(
      pageProvider: (ref, page) => ref.watch(getUpcomingEventsProvider(page: page)),
      pageSize: EventRepository.pageSize,
      noItemsWidget: const NoEventsWidget(),
      shimmer: const EventCardShimmer(),
      errorBuilder: (context, error) => const EventCardError(),
      itemBuilder:
          (context, event) => EventCard(
            event: event,
            onTap: () => context.push(EventDetailScreen.getPath(event.id!)),
          ),
    );
  }
}
