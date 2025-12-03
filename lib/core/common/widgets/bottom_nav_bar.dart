import 'package:flutter/material.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';

abstract class AnyStepNavBar extends StatelessWidget {
  const AnyStepNavBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  /// Subclasses provide localized items using the current BuildContext.
  List<BottomNavigationBarItem> items(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      useLegacyColorScheme: false,
      items: items(context),
    );
  }
}

class AdminNavBar extends AnyStepNavBar {
  const AdminNavBar({super.key, required super.currentIndex, required super.onTap});

  @override
  List<BottomNavigationBarItem> items(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return [
      BottomNavigationBarItem(icon: const Icon(Icons.dashboard), label: loc.dashboard),
      BottomNavigationBarItem(icon: const Icon(Icons.line_axis_rounded), label: loc.reportsTitle),
      BottomNavigationBarItem(icon: const Icon(Icons.menu), label: loc.navSeeMore),
    ];
  }
}

class VolunteerNavBar extends AnyStepNavBar {
  const VolunteerNavBar({super.key, required super.currentIndex, required super.onTap});

  @override
  List<BottomNavigationBarItem> items(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return [
      BottomNavigationBarItem(icon: const Icon(Icons.event_rounded), label: loc.eventFeed),
      BottomNavigationBarItem(icon: const Icon(Icons.menu), label: loc.navSeeMore),
    ];
  }
}

class UnauthenticatedNavBar extends AnyStepNavBar {
  const UnauthenticatedNavBar({super.key, required super.currentIndex, required super.onTap});

  @override
  List<BottomNavigationBarItem> items(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return [
      BottomNavigationBarItem(icon: const Icon(Icons.event_rounded), label: loc.eventFeed),
      BottomNavigationBarItem(icon: const Icon(Icons.menu), label: loc.navSeeMore),
    ];
  }
}
