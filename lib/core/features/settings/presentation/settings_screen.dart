import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:anystep/core/features/settings/presentation/widgets/donate_tile.dart';
import 'package:anystep/core/features/settings/presentation/widgets/theme_mode_setting.dart';
import 'package:anystep/core/features/settings/presentation/widgets/locale_setting.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const path = '/settings';
  static const pathAnonymous = '/anonymous/settings';
  static const pathAdmin = '/admin/settings';

  static const name = 'settings';
  static const nameAnonymous = 'anonymous-settings';
  static const nameAdmin = 'admin-settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthAsync = ref.watch(authStateStreamProvider);
    final loc = AppLocalizations.of(context);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.settingsTitle)),
      body: isAuthAsync.when(
        data: (isAuth) {
          return ListView(
            padding: const EdgeInsets.all(AnyStepSpacing.md16),
            children: [
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(loc.aboutTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(AboutScreen.path),
              ),
              const DonateTile(),
              const ThemeModeSetting(),
              const LocaleSetting(),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: Text(loc.notificationSettingsTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(NotificationSettingsScreen.path),
              ),
              if (isAuth != null) ...[
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text(loc.accountSettings),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push(ProfileScreen.path),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text(loc.logout),
                  onTap: () async {
                    await ref.read(authRepositoryProvider).logout();
                    if (context.mounted) {
                      context.go(LoginScreen.path);
                    }
                  },
                ),
              ] else
                ListTile(
                  leading: const Icon(Icons.login),
                  title: Text(loc.login),
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
