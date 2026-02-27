// Removed unused dart:ui import after refactor.

import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/common/widgets/max_width_container.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/data/event_repository.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_form.dart';
import 'package:anystep/core/features/events/presentation/event_detail/event_detail_info.dart';
import 'package:anystep/core/features/events/presentation/widgets/attendance_list.dart';
import 'package:anystep/core/features/events/presentation/widgets/share_event_button.dart';
import 'package:anystep/core/features/events/presentation/widgets/sign_up_list.dart';
import 'package:anystep/core/features/events/utils/launch_calendar.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:anystep/core/features/user_events/presentation/add_attendee_screen.dart';
import 'package:anystep/core/features/user_events/presentation/sign_up_button.dart';
import 'package:anystep/core/common/widgets/share_button.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _EventDetailMenuAction { share, addToCalendar, edit }

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
    final loc = AppLocalizations.of(context);

    final leading = context.canPop()
        ? null
        : IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              context.go(EventFeedScreen.path);
            },
          );

    return eventAsync.when(
      loading: () => AnyStepScaffold(
        appBar: AnyStepAppBar(title: Text(loc.eventDetailTitle), leading: leading),
        body: const Center(child: AnyStepLoadingIndicator()),
      ),
      error: (e, st) => AnyStepScaffold(
        appBar: AnyStepAppBar(title: Text(loc.eventDetailTitle), leading: leading),
        body: RefreshIndicator(
          onRefresh: () async => ref.invalidate(getEventProvider(widget.id)),
          child: ScrollableCenteredContent(child: AnyStepErrorWidget()),
        ),
      ),
      data: (event) {
        final isPast = event.endTime.isBefore(DateTime.now().toUtc());
        final canEdit = userAsync.value?.role.canEditEvent == true;
        final actions = <Widget>[
          PopupMenuButton<_EventDetailMenuAction>(
            onSelected: (action) async {
              switch (action) {
                case _EventDetailMenuAction.share:
                  await shareContent(
                    title: ShareEventButton.buildShareTitle(),
                    content: ShareEventButton.buildShareText(event),
                  );
                  break;
                case _EventDetailMenuAction.addToCalendar:
                  try {
                    await openGoogleCalendar(event);
                  } catch (e, st) {
                    Log.e('Error opening calendar', e, st);
                  }
                  break;
                case _EventDetailMenuAction.edit:
                  _toggleEdit();
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: _EventDetailMenuAction.share, child: Text(loc.shareAction)),
              if (!isPast)
                PopupMenuItem(
                  value: _EventDetailMenuAction.addToCalendar,
                  child: Text(loc.addToCalendarMenuItem),
                ),
              if (canEdit)
                PopupMenuItem(
                  value: _EventDetailMenuAction.edit,
                  child: Text(isEditing ? loc.stopEditingAction : loc.editEventAction),
                ),
            ],
          ),
        ];

        return AnyStepScaffold(
          appBar: AnyStepAppBar(
            title: Text(loc.eventDetailTitle),
            actions: isPast ? null : actions,
            leading: leading,
          ),
          body: MaxWidthContainer(
            child: SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                fit: StackFit.expand,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: isEditing
                            ? EventDetailForm(
                                event: event,
                                physics: const NeverScrollableScrollPhysics(),
                                onSuccess: _onSuccess,
                              )
                            : EventDetailInfo(event: event),
                      ),
                      if (!isPast && userAsync.hasValue && userAsync.value != null && !isEditing)
                        SliverToBoxAdapter(
                          child: Center(child: SignUpButton(event: event)),
                        ),
                      if (userAsync.hasValue && !isEditing)
                        if (userAsync.value?.role.canEditEvent == true)
                          isPast
                              ? AttendanceList(
                                  eventId: widget.id,
                                  isAdmin: true,
                                  onAddAttendee: () =>
                                      context.push(AddAttendeeScreen.getPath(widget.id)),
                                )
                              : SliverToBoxAdapter(child: SignUpList(eventId: widget.id))
                        else
                          const SliverToBoxAdapter(child: SizedBox.shrink()),
                      if (!isPast && userAsync.hasValue && userAsync.value == null)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: .only(
                              top: AnyStepSpacing.md16,
                              left: AnyStepSpacing.md16,
                              right: AnyStepSpacing.md16,
                            ),
                            child: ElevatedButton(
                              onPressed: () => context.go(LoginScreen.path),
                              child: Text(loc.signUp),
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
          ),
        );
      },
    );
  }
}
