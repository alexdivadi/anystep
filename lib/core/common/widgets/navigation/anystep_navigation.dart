import 'package:anystep/core/common/widgets/navigation/nav_bar_scaffold.dart';
import 'package:anystep/core/common/widgets/navigation/nav_item.dart';
import 'package:anystep/core/common/widgets/navigation/nav_rail_scaffold.dart';
import 'package:flutter/material.dart';

abstract class AnyStepNavigation extends StatelessWidget {
  const AnyStepNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.navigationShell,
  });

  final int currentIndex;
  final Widget navigationShell;
  final ValueChanged<int> onTap;

  /// Subclasses provide localized items using the current BuildContext.
  List<NavItem> items(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // layout breakpoint: tweak as needed
        if (constraints.maxWidth < 550) {
          return NavBarScaffold(
            body: navigationShell,
            selectedIndex: currentIndex,
            onDestinationSelected: onTap,
            destinations: items(
              context,
            ).map((item) => NavigationDestination(icon: item.icon, label: item.label)).toList(),
          );
        } else {
          return NavRailScaffold(
            body: navigationShell,
            selectedIndex: currentIndex,
            onDestinationSelected: onTap,
            destinations: items(context)
                .map((item) => NavigationRailDestination(icon: item.icon, label: Text(item.label)))
                .toList(),
          );
        }
      },
    );
  }
}
