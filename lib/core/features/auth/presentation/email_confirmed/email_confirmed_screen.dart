import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_app_bar.dart';
import 'package:anystep/core/common/widgets/any_step_scaffold.dart';
import 'package:anystep/core/common/widgets/max_width_container.dart';
import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailConfirmedScreen extends StatelessWidget {
  const EmailConfirmedScreen({super.key});

  static const String path = '/email-confirmed';
  static const String name = 'email-confirmed';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.emailConfirmedTitle)),
      body: MaxWidthContainer(
        child: Padding(
          padding: const EdgeInsets.all(AnyStepSpacing.md16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(loc.emailConfirmedTitle, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: AnyStepSpacing.sm8),
                Text(loc.emailConfirmedMessage, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: AnyStepSpacing.md16),
                ElevatedButton(
                  onPressed: () => context.go(LoginScreen.path),
                  child: Text(loc.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
