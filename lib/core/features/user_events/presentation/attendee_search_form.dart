import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/presentation/widgets/did_attend_indicator.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:anystep/core/features/profile/presentation/user_feed.dart';
import 'package:anystep/core/features/user_events/presentation/attendee_search_form_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class AttendeeSearchForm extends ConsumerStatefulWidget {
  const AttendeeSearchForm({super.key, required this.eventId});

  final int eventId;

  @override
  ConsumerState<AttendeeSearchForm> createState() => _AttendeeSearchFormState();
}

class _AttendeeSearchFormState extends ConsumerState<AttendeeSearchForm> {
  String search = '';

  void _onSearchChanged(String value) {
    setState(() {
      search = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(attendeeSearchFormControllerProvider(widget.eventId));
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          title: AnyStepSearchBar(onChanged: _onSearchChanged),
        ),
        UserFeed(
          search: search,
          onTapUser:
              state.isLoading
                  ? null
                  : ref
                      .read(attendeeSearchFormControllerProvider(widget.eventId).notifier)
                      .toggleAttendance,
          leadingBuilder:
              (user) => Stack(
                children: [
                  ProfileImage(user: user, size: 20),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.surface,
                      ),
                      child: DidAttendIndicator(
                        eventId: widget.eventId,
                        userId: user.id,
                        size: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ],
    );
  }
}
