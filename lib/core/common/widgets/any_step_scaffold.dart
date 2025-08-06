import 'package:flutter/material.dart';

class AnyStepScaffold extends StatelessWidget {
  const AnyStepScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer,
        appBar: appBar,
        body: body ?? const SizedBox.shrink(),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
