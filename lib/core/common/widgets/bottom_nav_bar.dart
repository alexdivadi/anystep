import 'package:flutter/material.dart';

class AnyStepNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AnyStepNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      useLegacyColorScheme: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.event_rounded), label: 'Events'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
