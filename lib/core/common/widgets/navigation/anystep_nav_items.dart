import 'package:anystep/core/common/widgets/navigation/anystep_navigation.dart';
import 'package:anystep/core/common/widgets/navigation/nav_item.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class AdminNavigation extends AnyStepNavigation {
  const AdminNavigation({
    super.key,
    required super.currentIndex,
    required super.onTap,
    required super.navigationShell,
  });

  @override
  List<NavItem> items(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return [
      NavItem(icon: const Icon(Icons.dashboard), label: loc.dashboard),
      NavItem(icon: const Icon(Icons.line_axis_rounded), label: loc.reportsTitle),
      NavItem(icon: const Icon(Icons.menu), label: loc.navSeeMore),
    ];
  }
}

class VolunteerNavigation extends AnyStepNavigation {
  const VolunteerNavigation({
    super.key,
    required super.currentIndex,
    required super.onTap,
    required super.navigationShell,
  });

  @override
  List<NavItem> items(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return [
      NavItem(icon: const Icon(Icons.event_rounded), label: loc.eventFeed),
      NavItem(icon: const Icon(Icons.menu), label: loc.navSeeMore),
    ];
  }
}

class UnauthenticatedNavigation extends AnyStepNavigation {
  const UnauthenticatedNavigation({
    super.key,
    required super.currentIndex,
    required super.onTap,
    required super.navigationShell,
  });

  @override
  List<NavItem> items(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return [
      NavItem(icon: const Icon(Icons.event_rounded), label: loc.eventFeed),
      NavItem(icon: const Icon(Icons.menu), label: loc.navSeeMore),
    ];
  }
}
