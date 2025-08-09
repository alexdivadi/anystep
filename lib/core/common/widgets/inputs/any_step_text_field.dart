import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AnyStepTextField extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
      child: FormBuilderTextField(
        name: name,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        maxLines: maxLines,
        enabled: enabled,
        validator: validator,
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: labelText,
          // floatingLabelStyle: TextStyle(color: AnyStepColors.blueBright),
          hintText: hintText,
          alignLabelWithHint: maxLines > 1,
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
    );
  }
}
