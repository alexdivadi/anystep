import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class BlogChannelDetailScreen extends StatelessWidget {
  const BlogChannelDetailScreen({super.key, required this.channelId});

  static const path = '/blog/:id';
  static String getPath(int id) => '/blog/$id';
  static const name = 'blog-channel-detail';

  final int channelId;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.blogChannelTitle)),
      body: ScrollableCenteredContent(
        child: Padding(
          padding: const EdgeInsets.all(AnyStepSpacing.md16),
          child: Text(
            loc.blogChannelPlaceholder(channelId),
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
