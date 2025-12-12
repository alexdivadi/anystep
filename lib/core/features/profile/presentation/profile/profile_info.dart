import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(AnyStepSpacing.md16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImage(user: user),
            const SizedBox(height: AnyStepSpacing.sm8),
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
              title: Text(loc.email, style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(user.email),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(loc.phone, style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(user.phoneNumber ?? '—'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(loc.address, style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(
                user.address != null
                    ? user.address!.street +
                          ((user.address!.streetSecondary ?? '').isNotEmpty
                              ? ' ${user.address!.streetSecondary}'
                              : '') +
                          (user.address!.city.isNotEmpty ? '\n${user.address!.city}' : '') +
                          (user.address!.state.isNotEmpty ? ', ${user.address!.state}' : '') +
                          (user.address!.postalCode.isNotEmpty
                              ? ' ${user.address!.postalCode}'
                              : '')
                    : 'No address provided',
              ),
            ),
            user.createdAt != null
                ? ListTile(
                    leading: const Icon(Icons.cake),
                    title: Text(loc.dateJoined, style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(DateFormat.yMMMd().format(user.createdAt!.toLocal())),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
