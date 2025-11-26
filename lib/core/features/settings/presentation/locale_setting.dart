import 'package:anystep/core/config/locale/locale_controller.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleSetting extends ConsumerWidget {
  const LocaleSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context);
    final currentAsync = ref.watch(localeControllerProvider);
    final current = currentAsync.hasValue ? currentAsync.value : null;

    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text('Language'),
      subtitle: Text(_labelForLocale(current, loc)),
      trailing: DropdownButton<Locale?>(
        value: current,
        items: const [
          DropdownMenuItem(value: null, child: Text('System Default')),
          DropdownMenuItem(value: Locale('en'), child: Text('English')),
          DropdownMenuItem(value: Locale('es'), child: Text('Español')),
        ],
        onChanged: (newLocale) {
          ref.read(localeControllerProvider.notifier).setLocale(newLocale);
        },
      ),
    );
  }

  String _labelForLocale(Locale? locale, AppLocalizations loc) {
    if (locale == null) return 'System Default';
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      default:
        return locale.languageCode;
    }
  }
}
