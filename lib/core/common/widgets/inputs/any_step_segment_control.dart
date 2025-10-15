import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AnyStepSegmentedButtonField<T> extends StatelessWidget {
  const AnyStepSegmentedButtonField({
    super.key,
    required this.name,
    required this.options,
    this.labelText,
    this.onChanged,
    this.initialValue,
    this.validator,
    this.enabled = true,
  });

  final String name;
  final List<FormBuilderFieldOption<T>> options;
  final String? labelText;
  final ValueChanged<T?>? onChanged;
  final T? initialValue;
  final String? Function(T?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: name,
      validator: validator,
      initialValue: initialValue,
      enabled: enabled,
      builder: (FormFieldState<T> field) {
        final theme = Theme.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (labelText != null) Text(labelText!),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<T>(
                emptySelectionAllowed: true,
                style: SegmentedButton.styleFrom(
                  side: BorderSide(color: theme.colorScheme.primary),
                  selectedBackgroundColor: theme.colorScheme.primary,
                  selectedForegroundColor: theme.colorScheme.onPrimary,
                ),
                segments:
                    options
                        .map(
                          (opt) => ButtonSegment<T>(
                            value: opt.value,
                            label: opt.child ?? Text(opt.value.toString()),
                          ),
                        )
                        .toList(),
                selected: field.value != null ? {field.value as T} : {},
                onSelectionChanged: (Set<T> newSelection) {
                  final value = newSelection.isNotEmpty ? newSelection.first : null;
                  field.didChange(value);
                  if (onChanged != null) onChanged!(value);
                },
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  field.errorText ?? '',
                  style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
