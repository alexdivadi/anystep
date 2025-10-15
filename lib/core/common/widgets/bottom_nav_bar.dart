import 'package:flutter/material.dart';

abstract class AnyStepNavBar extends StatelessWidget {
  const AnyStepNavBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  List<BottomNavigationBarItem> get items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      useLegacyColorScheme: false,
      items: items,
    );
  }
}

class AdminNavBar extends AnyStepNavBar {
  const AdminNavBar({super.key, required super.currentIndex, required super.onTap});

  @override
  List<BottomNavigationBarItem> get items => const [
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
    BottomNavigationBarItem(icon: Icon(Icons.line_axis_rounded), label: 'Reports'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'See More'),
  ];
}

class VolunteerNavBar extends AnyStepNavBar {
  const VolunteerNavBar({super.key, required super.currentIndex, required super.onTap});

  @override
  List<BottomNavigationBarItem> get items => const [
    BottomNavigationBarItem(icon: Icon(Icons.event_rounded), label: 'Events'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'See More'),
  ];
}

class UnauthenticatedNavBar extends AnyStepNavBar {
  const UnauthenticatedNavBar({super.key, required super.currentIndex, required super.onTap});

  @override
  List<BottomNavigationBarItem> get items => const [
    BottomNavigationBarItem(icon: Icon(Icons.event_rounded), label: 'Events'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'See More'),
  ];
}
