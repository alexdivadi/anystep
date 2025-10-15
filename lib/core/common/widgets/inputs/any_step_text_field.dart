import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// A wrapper around [FormBuilderTextField] that applies unified styling and
/// optionally expands (increases maxLines) when focused for easier multi-line input.
class AnyStepTextField extends StatefulWidget {
  const AnyStepTextField({
    super.key,
    required this.name,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.enabled = true,
    this.validator,
    this.initialValue,
    // Expansion options
    this.expandOnFocus = false,
    this.expandedLines = 8,
    this.animationDuration = const Duration(milliseconds: 220),
    this.animationCurve = Curves.easeOut,
  });

  final String name;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onSubmitted;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;
  final bool enabled;
  final String? Function(String?)? validator;
  final String? initialValue;

  /// When true, the field animates to [expandedLines] while focused (only if maxLines > 1 or expandedLines > 1).
  final bool expandOnFocus;

  /// Number of lines to expand to when focused (ignored if [expandOnFocus] is false).
  final int expandedLines;

  final Duration animationDuration;
  final Curve animationCurve;

  @override
  State<AnyStepTextField> createState() => _AnyStepTextFieldState();
}

class _AnyStepTextFieldState extends State<AnyStepTextField> with SingleTickerProviderStateMixin {
  late final FocusNode _internalFocusNode;
  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    final hasFocus = _focusNode.hasFocus;
    if (hasFocus != _focused) {
      setState(() => _focused = hasFocus);
    }
  }

  int get _currentMaxLines {
    if (!widget.expandOnFocus) return widget.maxLines;
    if (!_focused) return widget.maxLines;
    return widget.expandedLines.clamp(widget.maxLines, 1000);
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final showMultiLine = (widget.maxLines > 1 || widget.expandedLines > 1);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
      child: AnimatedSize(
        duration: widget.animationDuration,
        curve: widget.animationCurve,
        alignment: Alignment.topCenter,
        child: FormBuilderTextField(
          name: widget.name,
          controller: widget.controller,
          focusNode: _focusNode,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: _currentMaxLines,
          enabled: widget.enabled,
          validator: widget.validator,
          initialValue: widget.initialValue,
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            alignLabelWithHint: showMultiLine,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(AnyStepSpacing.md16)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(AnyStepSpacing.md16)),
              borderSide: BorderSide(color: primary, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(AnyStepSpacing.md16)),
              borderSide: BorderSide(color: primary, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
