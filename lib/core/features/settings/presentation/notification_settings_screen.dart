import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/notifications/presentation/event_notifications_tile.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  static const path = '/settings/notifications';
  static const name = 'notification-settings';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.notificationSettingsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        children: [
          EventNotificationsTile(
            title: loc.eventNotificationsTitle,
            subtitle: loc.eventNotificationsDescription,
          ),
        ],
      ),
    );
  }
}
