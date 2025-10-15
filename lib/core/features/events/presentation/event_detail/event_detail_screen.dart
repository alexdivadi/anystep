// Removed unused dart:ui import after refactor.

import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_info.dart';
import 'package:anystep/core/features/events/presentation/widgets/attendance_list.dart';
import 'package:anystep/core/features/events/presentation/widgets/share_event_button.dart';
import 'package:anystep/core/features/events/presentation/widgets/sign_up_list.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:anystep/core/features/user_events/presentation/attendee_search_form.dart';
import 'package:anystep/core/features/user_events/presentation/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventDetailScreen extends ConsumerStatefulWidget {
  const EventDetailScreen({super.key, required this.id});
  static const path = '/events/:id';
  static String getPath(int id) => '/events/$id';

  static const name = 'event-detail';

  final int id;

  @override
  ConsumerState<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends ConsumerState<EventDetailScreen> {
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
  }

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _onSuccess() {
    if (!mounted) return;
    ref.invalidate(getEventProvider(widget.id));
    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventAsync = ref.watch(getEventProvider(widget.id));
    final userAsync = ref.watch(currentUserStreamProvider);

    return eventAsync.when(
      loading:
          () => AnyStepScaffold(
            appBar: const AnyStepAppBar(title: Text('Event Detail')),
            body: const Center(child: AnyStepLoadingIndicator()),
          ),
      error:
          (e, st) => AnyStepScaffold(
            appBar: const AnyStepAppBar(title: Text('Event Detail')),
            body: RefreshIndicator(
              onRefresh: () async => ref.invalidate(getEventProvider(widget.id)),
              child: ScrollableCenteredContent(child: AnyStepErrorWidget()),
            ),
          ),
      data: (event) {
        final isPast = event.endTime.isBefore(DateTime.now().toUtc());
        // Build actions list based on user role
        final actions = <Widget>[
          ShareEventButton(event: event),
          userAsync.maybeWhen(
            data: (u) {
              if (u?.role.canEditEvent == true) {
                return IconButton(
                  icon: Icon(isEditing ? Icons.edit_off : Icons.edit),
                  onPressed: _toggleEdit,
                );
              }
              return const SizedBox.shrink();
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ];

        return AnyStepScaffold(
          appBar: AnyStepAppBar(
            title: const Text('Event Detail'),
            actions: isPast ? null : actions,
          ),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.expand,
              children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child:
                          isEditing
                              ? EventDetailForm(
                                event: event,
                                physics: const NeverScrollableScrollPhysics(),
                                onSuccess: _onSuccess,
                              )
                              : EventDetailInfo(event: event),
                    ),
                    if (!isPast && userAsync.hasValue && userAsync.value != null && !isEditing)
                      SliverToBoxAdapter(child: Center(child: SignUpButton(eventId: widget.id))),
                    if (userAsync.hasValue && !isEditing)
                      isPast
                          ? AttendanceList(
                            eventId: widget.id,
                            isAdmin: userAsync.valueOrNull?.role.canEditEvent == true,
                            onAddAttendee:
                                () => context.showModal(
                                  AttendeeSearchForm(eventId: widget.id),
                                  isScrollControlled: false,
                                ),
                          )
                          : SliverToBoxAdapter(child: SignUpList(eventId: widget.id)),
                    if (userAsync.hasValue && userAsync.value == null)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: AnyStepSpacing.md16),
                          child: ElevatedButton(
                            onPressed: () => context.go(LoginScreen.path),
                            child: const Text('Sign up'),
                          ),
                        ),
                      ),
                    const SliverToBoxAdapter(child: SizedBox(height: AnyStepSpacing.xl64)),
                  ],
                ),
                const BottomFadeWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
