import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class AnyStepDateTimePicker extends StatelessWidget {
  const AnyStepDateTimePicker({
    super.key,
    required this.name,
    this.initialValue,
    this.focusNode,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.validator,
    this.format,
    this.useDefaultInitialValue = true,
    this.firstDate,
    this.lastDate,
  });

  final String name;
  final DateTime? initialValue;
  final FocusNode? focusNode;
  final Function(DateTime?)? onChanged;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<DateTime?>? validator;
  final DateFormat? format;
  final bool useDefaultInitialValue;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final labelColor = Theme.of(context).colorScheme.onSurface.withAlpha(153);
    final hintColor = Theme.of(context).colorScheme.onSurface.withAlpha(128);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
      child: FormBuilderDateTimePicker(
        name: name,
        focusNode: focusNode,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: labelColor),
          floatingLabelStyle: TextStyle(color: labelColor),
          hintStyle: TextStyle(color: hintColor),
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
        initialValue:
            initialValue ??
            (useDefaultInitialValue ? DateTime.now().add(const Duration(hours: 1)) : null),
        firstDate: firstDate,
        lastDate: lastDate,
        inputType: InputType.both,
        format: format ?? DateFormat('MM/dd/yy, hh:mm a'),
        locale: Localizations.localeOf(context),
        validator: validator,
      ),
    );
  }
}
