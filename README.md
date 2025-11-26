# anystep

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:


For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Localization

This app uses Flutter's built-in gen-l10n with ARB files.

### Where the files live
- ARB source: `lib/l10n/app_en.arb`, `lib/l10n/app_es.arb`
- Config: `l10n.yaml`
- Generated: `lib/l10n/generated/`

### Add a new string
1. Edit `lib/l10n/app_en.arb` to add a key and description.
2. Add the Spanish translation in `lib/l10n/app_es.arb`.
3. Run codegen:
	 - `flutter gen-l10n` (runs automatically on build; restarting the app may be required).

Example:
```json
{
	"greeting": "Hello",
	"@greeting": {"description": "Simple greeting"}
}
```

Access in code:
```dart
final loc = AppLocalizations.of(context);
Text(loc.greeting);
```

### Supported locales
English (`en`) and Spanish (`es`) are enabled via `AppLocalizations.supportedLocales`.

### Notes
- Placeholders require an `example` string in metadata.
- Changing ARB files requires a full restart for hot reload to pick up generated code.
- If `lib/l10n/untranslated_messages.txt` is non-empty, add translations before release.
