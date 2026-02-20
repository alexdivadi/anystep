import 'package:flutter/material.dart';

class AnyStepAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnyStepAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.showBackArrow = true,
    this.surfaceTint,
    this.bottom,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showBackArrow;
  final Color? surfaceTint;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: false,
      surfaceTintColor: surfaceTint,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
      leading: leading,
      // titleTextStyle: AnyStepTextStyles.title.copyWith(
      //   color: Theme.of(context).colorScheme.onSurface,
      // ),
      automaticallyImplyLeading: showBackArrow,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
