import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/profile/domain/user_model.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:flutter/material.dart';

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
            ListTile(title: Text('Name'), subtitle: Text('${user.firstName} ${user.lastName}')),
            ListTile(title: Text('Email'), subtitle: Text(user.email)),
            ListTile(title: Text('Phone'), subtitle: Text(user.phoneNumber ?? '—')),
            ListTile(title: Text('Role'), subtitle: Text(user.role.displayName)),
            ListTile(title: Text('Age Group'), subtitle: Text(user.ageGroup.displayName)),
            ListTile(
              title: Text('Address'),
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
          ],
        ),
      ),
    );
  }
}
