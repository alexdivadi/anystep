import 'package:anystep/core/config/locale/locale_controller.dart';
import 'package:anystep/core/features/settings/presentation/locale_setting.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:anystep/core/common/widgets/any_step_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LocaleIconButton extends ConsumerWidget {
  const LocaleIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context);
    final currentAsync = ref.watch(localeControllerProvider);
    final current = currentAsync.hasValue ? currentAsync.value : null;

    return IconButton(
      icon: const Icon(Icons.translate),
      onPressed: () {
        context.showModal(
          LocaleSelectionList(
            current: current,
            onSelected: (newLocale) {
              ref.read(localeControllerProvider.notifier).setLocale(newLocale);
              context.pop();
            },
            loc: loc,
          ),
        );
      },
    );
  }
}
