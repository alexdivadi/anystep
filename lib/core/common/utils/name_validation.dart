import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

final RegExp _latinNamePattern = RegExp(r"^[A-Za-zÀ-ÖØ-öø-ÿ][A-Za-zÀ-ÖØ-öø-ÿ .'\-]*$");

FormFieldValidator<String> nameValidator({required String errorText, bool required = false}) {
  final validators = <FormFieldValidator<String>>[];
  if (required) {
    validators.add(FormBuilderValidators.required());
  }
  validators.add(
    FormBuilderValidators.match(_latinNamePattern, errorText: errorText, checkNullOrEmpty: false),
  );
  return FormBuilderValidators.compose(validators);
}
