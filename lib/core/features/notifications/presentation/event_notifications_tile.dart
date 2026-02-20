import 'package:anystep/core/features/notifications/data/event_notifications_controller.dart';
import 'package:anystep/core/common/utils/snackbar_message.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventNotificationsTile extends ConsumerWidget {
  const EventNotificationsTile({super.key, required this.title, this.subtitle, this.dense = false});

  final String title;
  final String? subtitle;
  final bool dense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabledAsync = ref.watch(eventNotificationsControllerProvider);
    final loc = AppLocalizations.of(context);

    return enabledAsync.when(
      data: (enabled) => SwitchListTile(
        value: enabled,
        onChanged: (value) async {
          try {
            await ref.read(eventNotificationsControllerProvider.notifier).setEnabled(value);
            if (!context.mounted) return;
            context.showSuccessSnackbar(loc.notificationSettingsUpdated);
          } catch (_) {
            if (!context.mounted) return;
            context.showErrorSnackbar(loc.notificationSettingsUpdateFailed);
          }
        },
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle!),
        dense: dense,
      ),
      loading: () => ListTile(
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle!),
        trailing: const SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (_, __) => ListTile(
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle!),
        trailing: const Icon(Icons.error_outline),
      ),
    );
  }
}
