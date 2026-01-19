# AGENTS

## Architecture Quick Guide
- Feature-first layout: `lib/core/features/<feature>/{domain,data,presentation}`.
- Layering rules: `presentation` -> `data` -> `domain`; avoid UI in `domain`.
- Shared app-level code lives in `lib/core/common` and `lib/core/config`.

## Riverpod Generator Usage
- Use `riverpod_annotation` and `@riverpod`/`@Riverpod` annotations.
- Always include `part '<file>.g.dart';` in annotated files.
- Do not edit generated `*.g.dart` files; run build runner instead.
- Keep long-lived providers `@Riverpod(keepAlive: true)` (see `theme_mode.dart`, `app_startup.dart`).
- Access providers via generated `<name>Provider` symbols.

## Theming and UI Tokens
- Theme tokens live in `lib/core/config/theme/`:
  - `AnyStepColors` in `colors.dart`
  - `AnyStepTextStyles` in `text_styles.dart`
  - `AnyStepTheme` in `theme.dart`
- Use `AnyStepSpacing` from `lib/core/common/constants/spacing.dart` for layout.
- Avoid hard-coded colors/sizes; prefer tokens or `Theme.of(context)`.

## Common UI/Utilities
- Reusable widgets are in `lib/core/common/widgets/`.
- Common utilities are in `lib/core/common/utils/`.
- Prefer shared widgets/utilities before creating new ones.

## Routing and Screens
- GoRouter is provided in `lib/core/config/router/router.dart`.
- Add new routes to `lib/core/config/router/routes.dart` and feature `screens.dart` exports.

## Localization
- Use `AppLocalizations` from `lib/l10n/generated/`.
- Keep ARB updates in sync with `flutter gen-l10n` if new strings are added.

## Codegen Notes
- Freezed/JSON models live in `domain/` and use `.freezed.dart` and `.g.dart` outputs.
- Avoid editing generated files; update sources and rerun build_runner.
