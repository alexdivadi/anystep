import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AnyStepSpacing.md16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                '${user.firstName} ${user.lastName}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              trailing: AnyStepBadge(
                child: Text(
                  user.role.displayName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text('Email', style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(user.email),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text('Phone', style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(user.phoneNumber ?? '—'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text('Address', style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(
                user.address != null
                    ? user.address!.street +
                        ((user.address!.streetSecondary ?? '').isNotEmpty
                            ? ' ${user.address!.streetSecondary}'
                            : '') +
                        (user.address!.city.isNotEmpty ? '\n${user.address!.city}' : '') +
                        (user.address!.state.isNotEmpty ? ', ${user.address!.state}' : '') +
                        (user.address!.postalCode.isNotEmpty ? ' ${user.address!.postalCode}' : '')
                    : 'No address provided',
              ),
            ),
            user.createdAt != null
                ? ListTile(
                  leading: const Icon(Icons.cake),
                  title: Text('Date Joined', style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(DateFormat.yMMMd().format(user.createdAt!.toLocal())),
                )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
