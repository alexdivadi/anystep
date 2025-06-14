import 'package:flutter/material.dart';

class ScrollableCenteredContent extends StatelessWidget {
  const ScrollableCenteredContent({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final mediaQuery = MediaQuery.of(context);
      final appBarHeight = Scaffold.maybeOf(context)?.appBarMaxHeight ?? 0;
      final bottomPadding = mediaQuery.padding.bottom;
      final availableHeight = mediaQuery.size.height - appBarHeight - bottomPadding;
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: availableHeight),
          child: Center(child: child),
        ),
      );
    },
  );
}
