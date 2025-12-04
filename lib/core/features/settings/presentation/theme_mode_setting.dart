import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/config/theme/theme_mode.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:anystep/core/common/widgets/any_step_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ThemeModeSetting extends ConsumerWidget {
  const ThemeModeSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeControllerProvider);
    final loc = AppLocalizations.of(context);
    final trailing = themeModeAsync.when(
      data: (mode) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_labelForThemeMode(mode, loc)),
          const SizedBox(width: AnyStepSpacing.sm8),
          const Icon(Icons.expand_more),
        ],
      ),
      loading: () => const SizedBox.shrink(),
      error: (e, _) => const SizedBox.shrink(),
    );

    return ListTile(
      leading: const Icon(Icons.color_lens),
      title: Text(loc.themeLabel),
      trailing: trailing,
      onTap: () {
        final current = themeModeAsync.value;
        context.showModal(
          _ThemeModeSelectionList(
            current: current ?? ThemeMode.system,
            onSelected: (mode) {
              ref.read(themeModeControllerProvider.notifier).setThemeMode(mode);
              context.pop();
            },
            loc: loc,
          ),
        );
      },
    );
  }

  String _labelForThemeMode(ThemeMode mode, AppLocalizations loc) {
    switch (mode) {
      case ThemeMode.system:
        return loc.themeAuto;
      case ThemeMode.light:
        return loc.themeLight;
      case ThemeMode.dark:
        return loc.themeDark;
    }
  }
}

class _ThemeModeSelectionList extends StatelessWidget {
  const _ThemeModeSelectionList({
    required this.current,
    required this.onSelected,
    required this.loc,
  });

  final ThemeMode current;
  final ValueChanged<ThemeMode> onSelected;
  final AppLocalizations loc;

  @override
  Widget build(BuildContext context) {
    final options = <ThemeMode>[ThemeMode.system, ThemeMode.light, ThemeMode.dark];
    String labelFor(ThemeMode m) => switch (m) {
      ThemeMode.system => loc.themeAuto,
      ThemeMode.light => loc.themeLight,
      ThemeMode.dark => loc.themeDark,
    };

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AnyStepSpacing.md16),
      children: [
        ...options.map(
          (m) => ListTile(
            title: Text(labelFor(m)),
            trailing: m == current ? const Icon(Icons.check) : null,
            onTap: () => onSelected(m),
          ),
        ),
        const SizedBox(height: AnyStepSpacing.sm8),
      ],
    );
  }
}
