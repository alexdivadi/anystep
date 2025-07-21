import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/age_group.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static const path = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserStreamProvider);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: const Text('Profile')),
      body: userAsync.when(
        loading: () => AnyStepLoadingIndicator(),
        error:
            (e, st) => RefreshIndicator(
              onRefresh: () async => ref.invalidate(currentUserStreamProvider),
              child: ScrollableCenteredContent(child: AnyStepErrorWidget()),
            ),

        data: (user) {
          if (user == null) {
            return AnyStepLoadingIndicator();
          }
          return ListView(
            padding: const EdgeInsets.all(AnyStepSpacing.md16),
            children: [
              ListTile(title: Text('Name'), subtitle: Text('${user.firstName} ${user.lastName}')),
              ListTile(title: Text('Email'), subtitle: Text(user.email)),
              ListTile(title: Text('Phone'), subtitle: Text(user.phoneNumber ?? '—')),
              ListTile(title: Text('Role'), subtitle: Text(user.role.displayName)),
              ListTile(title: Text('Age Group'), subtitle: Text(user.ageGroup.displayName)),
              ListTile(
                title: Text('Address'),
                subtitle: Text(
                  user.address.street +
                      ((user.address.streetSecondary ?? '').isNotEmpty
                          ? ' ${user.address.streetSecondary}'
                          : '') +
                      (user.address.city.isNotEmpty ? '\n${user.address.city}' : '') +
                      (user.address.state.isNotEmpty ? ', ${user.address.state}' : '') +
                      (user.address.postalCode.isNotEmpty ? ' ${user.address.postalCode}' : ''),
                ),
              ),
              const SizedBox(height: AnyStepSpacing.md24),
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor: Theme.of(context).colorScheme.onError,
                ),
                onPressed: () async => await ref.read(authRepositoryProvider).logout(),
              ),
            ],
          );
        },
      ),
    );
  }
}
