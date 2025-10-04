import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class EventSearchBar extends StatefulWidget {
  const EventSearchBar({
    super.key,
    required this.onChanged,
    required this.onFocusChanged,
    this.hintText = 'Search events',
    this.initialValue,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<bool> onFocusChanged;
  final String hintText;
  final String? initialValue;

  @override
  State<EventSearchBar> createState() => _EventSearchBarState();
}

class _EventSearchBarState extends State<EventSearchBar> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocus);
  }

  void _handleFocus() => widget.onFocusChanged(_focusNode.hasFocus);

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocus);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _clear() {
    if (_controller.text.isNotEmpty) {
      _controller.clear();
      widget.onChanged('');
    }
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AnyStepSpacing.md16,
        AnyStepSpacing.sm8,
        AnyStepSpacing.md16,
        AnyStepSpacing.sm8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AnyStepSpacing.lg32),
          border: Border.all(color: theme.colorScheme.primary.withAlpha(25)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AnyStepSpacing.sm4,
          vertical: AnyStepSpacing.sm8,
        ),
        child: Row(
          children: [
            const SizedBox(width: AnyStepSpacing.md16),
            const Icon(Icons.search),
            const SizedBox(width: AnyStepSpacing.sm8),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                textInputAction: TextInputAction.search,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(150),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            if (_controller.text.isNotEmpty)
              IconButton(
                tooltip: 'Clear',
                onPressed: _clear,
                icon: const Icon(Icons.close, size: 20),
              ),
          ],
        ),
      ),
    );
  }
}
