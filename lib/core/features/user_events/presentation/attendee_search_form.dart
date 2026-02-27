import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/presentation/widgets/did_attend_indicator.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/profile/presentation/admin/create_user_screen.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:anystep/core/features/profile/presentation/user_feed.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendeeSearchForm extends ConsumerStatefulWidget {
  const AttendeeSearchForm({
    super.key,
    required this.eventId,
    required this.onUserSelected,
  });

  final int eventId;
  final ValueChanged<UserModel> onUserSelected;

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
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () async {
                final userId = await context.push<String?>(CreateUserScreen.path);
                if (!mounted || userId == null) return;
                final user = await ref.read(userRepositoryProvider).get(documentId: userId);
                widget.onUserSelected(user);
                if (mounted && context.canPop()) {
                  context.pop();
                }
              },
              icon: const Icon(Icons.person_add),
              label: Text(AppLocalizations.of(context).createUser),
            ),
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
