import 'package:anystep/core/common/widgets/paginated_list_view.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/events/presentation/widgets/event_card.dart';
import 'package:anystep/core/features/profile/data/user_repository.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/profile/presentation/no_users_widget.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:flutter/material.dart';

class UserFeed extends StatelessWidget {
  const UserFeed({super.key, this.onTapUser, this.search, this.leadingBuilder});

  final void Function(UserModel)? onTapUser;
  final String? search;
  final Widget Function(UserModel)? leadingBuilder;

  @override
  Widget build(BuildContext context) {
    return PaginatedListView<UserModel>(
      pageProvider: (ref, page) => ref.watch(getUsersProvider(page: page, search: search)),
      pageSize: UserRepository.pageSize,
      noItemsWidget: const NoUsersWidget(),
      shimmer: const EventCardShimmer(),
      errorBuilder: (context, error) => const SizedBox.shrink(),
      itemBuilder:
          (context, user) => ListTile(
            onTap: onTapUser != null ? () => onTapUser!(user) : null,
            enabled: onTapUser != null,
            leading:
                leadingBuilder != null ? leadingBuilder!(user) : ProfileImage(user: user, size: 20),
            title: Text(user.firstName),
            trailing: AnyStepBadge(
              color:
                  user.role == UserRole.admin
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
              child: Text(
                user.role.displayName,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          ),
    );
  }
}
