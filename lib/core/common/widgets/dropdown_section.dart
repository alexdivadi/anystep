import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class DropdownText extends StatefulWidget {
  const DropdownText({
    super.key,
    required this.title,
    required this.content,
    this.maxLines = 2,
    this.padding = const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
    this.backgroundColor,
  });

  final Widget title;
  final String content;
  final int maxLines;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;

  @override
  State<DropdownText> createState() => _DropdownTextState();
}

class _DropdownTextState extends State<DropdownText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer;
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Row(
              children: [
                Expanded(child: widget.title),
                Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: Stack(
              children: [
                Text(
                  widget.content,
                  maxLines: widget.maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                // Fade effect using gradient mask
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: AnyStepSpacing.md20,
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [bgColor.withAlpha(0), bgColor],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            secondChild: Text(widget.content, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
