import 'package:anystep/core/config/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AnyStepAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnyStepAppBar({
    super.key,
    this.title,
    this.actions,
    this.showBackArrow = true,
    this.surfaceTint,
  });

  final Widget? title;
  final List<Widget>? actions;
  final bool showBackArrow;
  final Color? surfaceTint;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: false,
      surfaceTintColor: surfaceTint,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
      leading: null,
      // titleTextStyle: AnyStepTextStyles.title.copyWith(
      //   color: Theme.of(context).colorScheme.onSurface,
      // ),
      automaticallyImplyLeading: showBackArrow,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
