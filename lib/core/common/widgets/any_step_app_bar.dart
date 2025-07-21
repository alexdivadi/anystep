import 'package:flutter/material.dart';

class AnyStepAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnyStepAppBar({super.key, this.title, this.actions});

  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
