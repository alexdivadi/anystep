# Architecture

## Overview
AnyStep is a Flutter app with a feature-first, layered architecture. The primary entry point is `lib/main.dart`, which boots `AnyStepApp` in `lib/core/app.dart`. Navigation uses GoRouter with a Riverpod-provided router. State, data access, and app configuration are built around Riverpod (with code generation).

## Top-level Structure
- `lib/core`: App framework and feature modules.
- `lib/database`: Shared database/storage abstractions.
- `lib/l10n`: Localization resources and generated localizations.
- `lib/env`: Environment config.

## Feature-First Layers
Each feature lives under `lib/core/features/<feature>/` and is split into layers.

- `domain/`: Entities and value objects (Freezed + JSON). Pure Dart models, no Flutter UI.
- `data/`: Repositories, data sources, and Riverpod providers. Depends on `domain/`.
- `presentation/`: Screens, widgets, controllers, and view models. Depends on `domain/` and `data/`.

Examples:
- `lib/core/features/events/domain/event.dart`
- `lib/core/features/events/data/event_repository.dart`
- `lib/core/features/events/presentation/event_feed/event_feed_screen.dart`

Shared screens are typically exported via `lib/core/features/<feature>/presentation/screens.dart` and aggregated in `lib/core/features/screens.dart` for routing.

### Dependency Rules
- `presentation` can depend on `data` + `domain`.
- `data` can depend on `domain` and core/common utilities.
- `domain` should stay framework-agnostic.
- Cross-feature usage should go through `data` providers or shared core utilities, not direct widget imports.

## Core Layers
- `lib/core/common`: reusable widgets, constants, utilities, and shared services.
  - `constants/spacing.dart` for layout spacing.
  - `widgets/` for shared UI components.
- `lib/core/config`: app-wide configuration.
  - `router/` for GoRouter setup and routes.
  - `theme/` for color tokens, text styles, and ThemeData.
  - `locale/` for locale controller.
- `lib/core/app_startup`: bootstrap tasks and startup gate.

## Theming Utilities
The theming system is centralized in `lib/core/config/theme/`:
- `colors.dart`: `AnyStepColors` tokens.
- `text_styles.dart`: `AnyStepTextStyles` tokens.
- `theme.dart`: `AnyStepTheme` light/dark/high-contrast themes.
- `theme_mode.dart`: Riverpod controller for theme mode.

Use the tokens instead of inline color values. Prefer `AnyStepSpacing` for consistent spacing.

## Riverpod + Code Generation
The app uses Riverpod with `riverpod_annotation` and generated `.g.dart` files.

Pattern:
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'example.g.dart';

@riverpod
Future<Foo> foo(Ref ref) async { ... }
```

- Generated files are created by `build_runner` and should not be edited.
- Providers are accessed via the generated `<name>Provider` symbols.
- `@Riverpod(keepAlive: true)` is used for app-wide or long-lived providers.

## Routing
`lib/core/config/router/router.dart` defines the GoRouter instance via Riverpod. Routes are defined in `routes.dart`, and routing decisions are influenced by onboarding state and authentication status.

## Localization
Localization uses Flutter gen-l10n:
- ARB files: `lib/l10n/app_en.arb`, `lib/l10n/app_es.arb`
- Generated: `lib/l10n/generated/`

Use `AppLocalizations.of(context)` in UI layers.
