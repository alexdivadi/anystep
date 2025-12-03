import 'dart:math';

import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/any_step_badge.dart';
import 'package:anystep/core/common/widgets/any_step_loading_indicator.dart';
import 'package:anystep/core/features/profile/domain/user_role.dart';
import 'package:anystep/core/features/profile/presentation/profile/profile_image.dart';
import 'package:anystep/core/features/user_events/data/user_event_repository.dart';
import 'package:flutter/material.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpList extends ConsumerWidget {
  const SignUpList({super.key, required this.eventId});

  final int eventId;

  static const int numToShow = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Could set withEvents to false, but currently not a significant performance improvement
    final responseAsync = ref.watch(getUserEventsProvider(eventId: eventId));
    final loc = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AnyStepSpacing.lg32,
        vertical: AnyStepSpacing.md16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(loc.signUps, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AnyStepSpacing.sm8),
          responseAsync.when(
            data: (data) {
              final count = data.totalCount;
              final n = min(count, numToShow);
              if (count == 0) {
                return Text(loc.noSignUpsYet);
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: n + 1,
                itemBuilder: (context, index) {
                  if (index == n) {
                    if (count == 0) {
                      return const SizedBox(height: AnyStepSpacing.md16);
                    }
                    if (count > n) {
                      return Center(
                        child: Text(
                          '+ ${count - n} more',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  }

                  final user = data.items[index].user;
                  if (user == null) {
                    return const SizedBox();
                  }
                  return ListTile(
                    leading: ProfileImage(user: user, size: 20),
                    title: Text(user.firstName),
                    trailing: AnyStepBadge(
                      color: user.role == UserRole.admin
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      child: Text(
                        user.role.displayName,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: AnyStepLoadingIndicator()),
            error: (error, stack) => const SizedBox(),
          ),
        ],
      ),
    );
  }
}
