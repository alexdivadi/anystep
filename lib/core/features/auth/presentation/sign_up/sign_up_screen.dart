import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'sign_up_screen_controller.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  static const path = '/sign-up';

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(signUpScreenControllerProvider.notifier);
    final state = ref.watch(signUpScreenControllerProvider);

    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text('Back to Login')),
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
                    child: Text('Sign Up', style: Theme.of(context).textTheme.displayLarge),
                  ),
                  const SizedBox(height: AnyStepSpacing.md16),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    name: 'firstName',
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    name: 'lastName',
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 16),
                  if (state.isLoading) const CircularProgressIndicator(),
                  if (state.error != null) ...[
                    Text(state.error!, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 8),
                  ],
                  ElevatedButton(
                    onPressed:
                        state.isLoading
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
                    child: const Text('Sign Up'),
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
