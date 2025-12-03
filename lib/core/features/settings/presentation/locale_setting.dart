import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/config/locale/locale_controller.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:anystep/core/common/widgets/any_step_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LocaleSetting extends ConsumerWidget {
  const LocaleSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context);
    final currentAsync = ref.watch(localeControllerProvider);
    final current = currentAsync.hasValue ? currentAsync.value : null;

    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(loc.languageLabel),
      subtitle: Text(_labelForLocale(current, loc)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_labelForLocale(current, loc)),
          const SizedBox(width: AnyStepSpacing.sm8),
          const Icon(Icons.expand_more),
        ],
      ),
      onTap: () {
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

  String _labelForLocale(Locale? locale, AppLocalizations loc) {
    if (locale == null) return loc.systemDefault;
    switch (locale.languageCode) {
      case 'en':
        return loc.languageEnglish;
      case 'es':
        return loc.languageSpanish;
      default:
        return locale.languageCode;
    }
  }
}

class LocaleSelectionList extends StatelessWidget {
  const LocaleSelectionList({
    super.key,
    required this.current,
    required this.onSelected,
    required this.loc,
  });

  final Locale? current;
  final ValueChanged<Locale?> onSelected;
  final AppLocalizations loc;

  @override
  Widget build(BuildContext context) {
    final options = <Locale?>[
      null, // System default
      const Locale('en'),
      const Locale('es'),
    ];
    String labelFor(Locale? l) => switch (l?.languageCode) {
      null => loc.systemDefault,
      'en' => loc.languageEnglish,
      'es' => loc.languageSpanish,
      _ => l!.languageCode,
    };

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AnyStepSpacing.md16),
      children: [
        ...options.map(
          (l) => ListTile(
            title: Text(labelFor(l)),
            trailing: (l == current || (l == null && current == null))
                ? const Icon(Icons.check)
                : null,
            onTap: () => onSelected(l),
          ),
        ),
        const SizedBox(height: AnyStepSpacing.sm8),
      ],
    );
  }
}
