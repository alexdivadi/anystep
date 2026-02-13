import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class CreateChannelScreen extends StatelessWidget {
  const CreateChannelScreen({super.key});

  static const path = '/blog/create';
  static const name = 'blog-create-channel';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.blogCreateChannel)),
      body: ScrollableCenteredContent(
        child: Padding(
          padding: const EdgeInsets.all(AnyStepSpacing.md16),
          child: Text(
            loc.blogCreateChannelPlaceholder,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
