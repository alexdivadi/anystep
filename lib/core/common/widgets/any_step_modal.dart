import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

extension AnyStepModalContext on BuildContext {
  void showModal(Widget child) => showModalBottomSheet(
    context: this,
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    useRootNavigator: true,
    isDismissible: true,
    enableDrag: true,
    backgroundColor: Theme.of(this).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AnyStepSpacing.md16)),
    ),
    builder: (context) => child,
  );
}
