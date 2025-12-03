import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_error_widget.dart';
import 'package:anystep/core/common/widgets/scrollable_centered_content.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_screen.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_card.dart';
import 'package:anystep/core/features/events/presentation/widgets/no_events_widget.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchEventsFeed extends ConsumerWidget {
  const SearchEventsFeed({super.key, this.search});

  final String? search;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context);
    if (search == null || search!.isEmpty) {
      return ScrollableCenteredContent(
        child: Padding(
          padding: .all(AnyStepSpacing.md16),
          child: Text(
            loc.enterSearchTerm,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: .center,
          ),
        ),
      );
    }

    final eventsAsync = ref.watch(getEventsProvider(page: 0, search: search));
    return eventsAsync.when(
      loading: () => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(height: AnyStepSpacing.sm8),
        itemBuilder: (_, __) => const EventCardShimmer(),
      ),
      error: (e, st) => RefreshIndicator(
        onRefresh: () async => ref.invalidate(getEventsProvider),
        child: ScrollableCenteredContent(child: AnyStepErrorWidget()),
      ),

      data: (feedResult) {
        final items = feedResult.items;
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(getEventsProvider),
          child: items.isEmpty
              ? ScrollableCenteredContent(child: NoEventsWidget())
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.md12),
                  itemCount: feedResult.totalCount,
                  separatorBuilder: (_, __) => const SizedBox(height: AnyStepSpacing.sm8),
                  itemBuilder: (context, i) {
                    final pageNum = i ~/ EventRepository.pageSize;
                    final index = i % EventRepository.pageSize;

                    final eventsPage = ref.watch(getEventsProvider(page: pageNum, search: search));
                    return eventsPage.when(
                      loading: () => const EventCardShimmer(),
                      error: (e, st) => const EventCardError(),
                      data: (pageResult) {
                        final event = pageResult.items[index];
                        return EventCard(
                          event: event,
                          onTap: () => context.push(EventDetailScreen.getPath(event.id!)),
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
