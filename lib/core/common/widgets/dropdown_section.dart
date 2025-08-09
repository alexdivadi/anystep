import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class DropdownSection extends StatefulWidget {
  const DropdownSection({
    super.key,
    required this.title,
    required this.content,
    this.maxLines = 2,
    this.padding = const EdgeInsets.symmetric(horizontal: AnyStepSpacing.md16),
  });

  final Widget title;
  final String content;
  final int maxLines;
  final EdgeInsetsGeometry padding;

  @override
  State<DropdownSection> createState() => _DropdownSectionState();
}

class _DropdownSectionState extends State<DropdownSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
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
                          colors: [
                            Theme.of(context).scaffoldBackgroundColor.withAlpha(0),
                            Theme.of(context).scaffoldBackgroundColor,
                          ],
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
