import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const path = '/settings';
  static const pathAnonymous = '/anonymous/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthAsync = ref.watch(authStateStreamProvider);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: const Text('Settings')),
      body: isAuthAsync.when(
        data: (isAuth) {
          return ListView(
            padding: const EdgeInsets.all(AnyStepSpacing.md16),
            children:
                isAuth != null
                    ? [
                      ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: const Text('Account Settings'),
                        onTap: () => context.push(ProfileScreen.path),
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout'),
                        onTap: () async {
                          await ref.read(authRepositoryProvider).logout();
                          if (context.mounted) {
                            context.go(LoginScreen.path);
                          }
                        },
                      ),
                    ]
                    : [
                      ListTile(
                        leading: const Icon(Icons.login),
                        title: const Text('Login'),
                        onTap: () => context.go(LoginScreen.path),
                      ),
                    ],
          );
        },
        loading: () => const AnyStepLoadingIndicator(),
        error: (error, stack) => AnyStepErrorWidget(error: error),
      ),
    );
  }
}
