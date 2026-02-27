import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/presentation/widgets/did_attend_indicator.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:anystep/core/features/profile/presentation/user_feed.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class AttendeeSearchForm extends StatefulWidget {
  const AttendeeSearchForm({
    super.key,
    required this.eventId,
    required this.onUserSelected,
  });

  final int eventId;
  final ValueChanged<UserModel> onUserSelected;

  @override
  State<AttendeeSearchForm> createState() => _AttendeeSearchFormState();
}

class _AttendeeSearchFormState extends State<AttendeeSearchForm> {
  String search = '';

  void _onSearchChanged(String value) {
    setState(() {
      search = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          title: AnyStepSearchBar(
            onChanged: _onSearchChanged,
            hintText: AppLocalizations.of(context).search,
          ),
        ),
        UserFeed(
          search: search,
          onTapUser: (user) {
            widget.onUserSelected(user);
            Navigator.of(context).pop();
          },
          leadingBuilder: (user) => Stack(
            children: [
              ProfileImage(user: user, size: 20),
              Positioned(
                bottom: 0,
                right: 0,
                child: DidAttendIndicator(eventId: widget.eventId, userId: user.id, size: 12.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
