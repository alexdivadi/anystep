import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_badge.dart';
import 'package:anystep/core/common/widgets/any_step_fade.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:anystep/core/features/user_events/data/user_event_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anystep/core/config/theme/colors.dart';

/// Sliver-based paginated attendance list (similar pattern to UpcomingEventsFeed)
class AttendanceList extends ConsumerWidget {
  const AttendanceList({
    super.key,
    required this.eventId,
    this.isAdmin = false,
    this.onAddAttendee,
  });

  final int eventId;
  final bool isAdmin;
  final VoidCallback? onAddAttendee;

  static const int pageSize = 25; // Should match backend page size for user events

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstPage = ref.watch(getUserEventsProvider(eventId: eventId, page: 0));

    return firstPage.when(
      loading:
          () => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AnyStepSpacing.lg32,
                vertical: AnyStepSpacing.md16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TitleRow(isAdmin: isAdmin, onAddAttendee: onAddAttendee),
                  const SizedBox(height: AnyStepSpacing.sm8),
                  const Center(child: CircularProgressIndicator.adaptive()),
                ],
              ),
            ),
          ),
      error:
          (e, st) => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AnyStepSpacing.lg32,
                vertical: AnyStepSpacing.md16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TitleRow(isAdmin: isAdmin, onAddAttendee: onAddAttendee),
                  const SizedBox(height: AnyStepSpacing.sm8),
                  AnyStepFade(
                    child: Text(
                      'Failed to load attendees',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
      data: (pageData) {
        final total = pageData.totalCount;
        if (total == 0) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AnyStepSpacing.lg32,
                vertical: AnyStepSpacing.md16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TitleRow(isAdmin: isAdmin, onAddAttendee: onAddAttendee),
                  const SizedBox(height: AnyStepSpacing.sm8),
                  const Text('No attendees'),
                ],
              ),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.only(
            left: AnyStepSpacing.lg32,
            right: AnyStepSpacing.lg32,
            top: AnyStepSpacing.md16,
            bottom: AnyStepSpacing.md16,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, idx) {
              // Header insertion at top
              if (idx == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TitleRow(isAdmin: isAdmin, onAddAttendee: onAddAttendee),
                    const SizedBox(height: AnyStepSpacing.sm8),
                  ],
                );
              }
              final logicalIdx = idx - 1; // after header
              if (logicalIdx.isOdd) return const SizedBox(height: AnyStepSpacing.sm4);
              final attendeeIndex = logicalIdx ~/ 2; // index into flattened attendee list

              final pageNum = attendeeIndex ~/ pageSize;
              final indexInPage = attendeeIndex % pageSize;
              final pageAsync = ref.watch(getUserEventsProvider(eventId: eventId, page: pageNum));

              return pageAsync.when(
                loading: () => const _AttendanceTileShimmer(),
                error: (e, st) => const SizedBox.shrink(),
                data: (page) {
                  if (indexInPage >= page.items.length) return const SizedBox.shrink();
                  final userEvent = page.items[indexInPage];
                  final user = userEvent.user;
                  if (user == null) return const SizedBox.shrink();
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Stack(
                      children: [
                        ProfileImage(user: user, size: 20),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 1.5),
                            ),
                            child:
                                userEvent.attended
                                    ? const Icon(
                                      Icons.check_circle,
                                      size: 12,
                                      color: AnyStepColors.success,
                                    )
                                    : const Icon(
                                      Icons.cancel,
                                      size: 12,
                                      color: AnyStepColors.error,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    title: Text(user.firstName),
                    trailing: AnyStepBadge(
                      color:
                          user.role == UserRole.admin
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                      child: Text(
                        user.role.displayName,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  );
                },
              );
            }, childCount: (total * 2) + 1), // +1 for header
          ),
        );
      },
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({this.onAddAttendee, this.isAdmin = false});

  final VoidCallback? onAddAttendee;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Attendees', style: Theme.of(context).textTheme.titleLarge),
        if (isAdmin && onAddAttendee != null)
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: onAddAttendee,
            tooltip: 'Add Attendee',
          ),
      ],
    );
  }
}

class _AttendanceTileShimmer extends StatelessWidget {
  const _AttendanceTileShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor.withAlpha(60),
              borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
            ),
          ),
          const SizedBox(width: AnyStepSpacing.sm8),
          Expanded(
            child: Container(
              height: 14,
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor.withAlpha(60),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
