import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/blog/presentation/screens.dart';
import 'package:anystep/core/features/profile/data/current_user.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BlogChannelsScreen extends ConsumerWidget {
  const BlogChannelsScreen({super.key});

  static const path = '/blog';
  static const pathAnonymous = '/anonymous/blog';
  static const pathAdmin = '/admin/blog';

  static const name = 'blog';
  static const nameAnonymous = 'anonymous-blog';
  static const nameAdmin = 'admin-blog';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserStreamProvider);
    final isAdmin = userAsync.value?.role == UserRole.admin;
    final loc = AppLocalizations.of(context);

    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.blogTitle)),
      body: ScrollableCenteredContent(
        child: Padding(
          padding: const EdgeInsets.all(AnyStepSpacing.md16),
          child: Text(
            loc.blogEmptyState,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: isAdmin
          ? AnyStepFab(
              onPressed: () => context.push(CreateChannelScreen.path),
              icon: Icons.add,
              tooltip: loc.blogCreateChannel,
            )
          : null,
    );
  }
}
