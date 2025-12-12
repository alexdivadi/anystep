import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_app_bar.dart';
import 'package:anystep/core/common/widgets/any_step_scaffold.dart';
import 'package:anystep/core/features/screens.dart';
import 'package:flutter/material.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ConfirmEmailScreen extends StatelessWidget {
  const ConfirmEmailScreen({super.key});

  static const String path = '/confirm-email';
  static const String name = 'confirm-email';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return AnyStepScaffold(
      appBar: const AnyStepAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(loc.confirmEmailMessage, style: Theme.of(context).textTheme.titleMedium),
          Text(loc.emailSentToInbox, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: AnyStepSpacing.md16),
          ElevatedButton(onPressed: () => context.go(EventFeedScreen.path), child: Text(loc.retry)),
          const SizedBox(height: AnyStepSpacing.md16),
        ],
      ),
    );
  }
}
