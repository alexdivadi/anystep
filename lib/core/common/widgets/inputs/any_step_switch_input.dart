import 'package:anystep/core/common/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AnyStepSwitchInput extends StatelessWidget {
  const AnyStepSwitchInput({
    super.key,
    required this.name,
    required this.label,
    this.helpText,
    this.initialValue = true,
    this.onChanged,
  });

  final String name;
  final String label;
  final String? helpText;
  final bool initialValue;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormBuilderField<bool>(
      name: name,
      initialValue: initialValue,
      onChanged: onChanged,
      builder: (field) {
        final value = field.value ?? initialValue;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AnyStepSpacing.sm4),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AnyStepSpacing.md16),
              border: Border.all(color: theme.colorScheme.primary, width: 1.5),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(AnyStepSpacing.md16),
                onTap: () => field.didChange(!value),
                child: Padding(
                  padding: const EdgeInsets.all(AnyStepSpacing.md16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(label, style: theme.textTheme.bodyLarge),
                            if (helpText?.isNotEmpty ?? false) ...[
                              const SizedBox(height: AnyStepSpacing.sm2),
                              Text(
                                helpText!,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface.withAlpha(153),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Switch.adaptive(
                        activeTrackColor: theme.colorScheme.primary,
                        value: value,
                        onChanged: field.didChange,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
