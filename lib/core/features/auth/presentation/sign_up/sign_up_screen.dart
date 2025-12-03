import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'sign_up_screen_controller.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  static const path = '/sign-up';
  static const name = 'sign-up';

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(signUpScreenControllerProvider.notifier);
    final state = ref.watch(signUpScreenControllerProvider);
    final loc = AppLocalizations.of(context);

    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.backToLogin)),
      body: Padding(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        child: Center(
          child: SingleChildScrollView(
            child: FormBuilder(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(loc.signUp, style: Theme.of(context).textTheme.displayLarge),
                  ),
                  const SizedBox(height: AnyStepSpacing.md16),
                  Row(
                    children: [
                      Flexible(
                        child: AnyStepTextField(
                          name: 'firstName',
                          labelText: 'First Name',
                          validator: FormBuilderValidators.firstName(),
                        ),
                      ),
                      const SizedBox(width: AnyStepSpacing.sm8),
                      Flexible(
                        child: AnyStepTextField(
                          name: 'lastName',
                          labelText: 'Last Name',
                          validator: FormBuilderValidators.lastName(),
                        ),
                      ),
                    ],
                  ),
                  AnyStepTextField(
                    name: 'email',
                    labelText: loc.email,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  AnyStepTextField(
                    name: 'password',
                    labelText: 'Password',
                    obscureText: true,
                    validator: FormBuilderValidators.password(
                      minSpecialCharCount: 0,
                      errorText: '',
                    ),
                  ),
                  AnyStepTextField(
                    name: 'confirmPassword',
                    labelText: 'Confirm Password',
                    obscureText: true,
                    validator: (value) {
                      final password = formKey.currentState?.fields['password']?.value;
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AnyStepSpacing.md16),
                  if (state.isLoading) const AnyStepLoadingIndicator(),
                  if (state.error != null) ...[
                    Text(
                      state.error!,
                      style: TextStyle(color: Theme.of(context).colorScheme.error),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AnyStepSpacing.sm8),
                  ],
                  ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () {
                            if (formKey.currentState?.saveAndValidate() ?? false) {
                              final values = formKey.currentState!.value;
                              controller.signUp(
                                email: values['email'] ?? '',
                                password: values['password'] ?? '',
                                firstName: values['firstName'] ?? '',
                                lastName: values['lastName'] ?? '',
                              );
                            }
                          },
                    child: Text(loc.signUp),
                  ),
                  const SizedBox(height: kToolbarHeight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
