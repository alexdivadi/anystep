import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

extension AnyStepModalContext on BuildContext {
  /// Shows a modal bottom sheet or dialog depending on screen size.
  void showModal(Widget child, {bool isScrollControlled = true}) {
    if (MediaQuery.of(this).size.width >= 600) {
      // For larger screens, use a dialog
      showDialog(
        context: this,
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AnyStepSpacing.md16)),
          child: GestureDetector(onTap: () => FocusScope.of(context).unfocus(), child: child),
        ),
      );
      return;
    }
    showModalBottomSheet(
      context: this,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      showDragHandle: true,
      isScrollControlled: isScrollControlled,
      useSafeArea: true,
      useRootNavigator: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Theme.of(this).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AnyStepSpacing.md16)),
      ),
      builder: (context) =>
          GestureDetector(onTap: () => FocusScope.of(context).unfocus(), child: child),
    );
  }
}
