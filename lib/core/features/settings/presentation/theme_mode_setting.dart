import 'package:anystep/core/config/theme/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeSetting extends ConsumerWidget {
  const ThemeModeSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeControllerProvider);
    return ListTile(
      leading: const Icon(Icons.color_lens),
      title: const Text('Theme'),
      trailing: themeModeAsync.when(
        data:
            (mode) => DropdownButton<ThemeMode>(
              value: mode,
              items: const [
                DropdownMenuItem(value: ThemeMode.system, child: Text('System Default')),
                DropdownMenuItem(value: ThemeMode.light, child: Text('Light Mode')),
                DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark Mode')),
              ],
              onChanged: (newMode) {
                if (newMode != null) {
                  ref.read(themeModeControllerProvider.notifier).setThemeMode(newMode);
                }
              },
            ),
        loading: () => null,
        error: (e, _) => null,
      ),
    );
  }
}
