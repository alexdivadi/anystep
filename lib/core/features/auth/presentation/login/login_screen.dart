import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:anystep/core/common/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import 'login_screen_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const path = '/login';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(loginScreenControllerProvider.notifier);
    final state = ref.watch(loginScreenControllerProvider);

    return AnyStepScaffold(
      body: Padding(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        child: Center(
          child: FormBuilder(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome back! Please login to continue.',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: AnyStepSpacing.md16),
                AnyStepTextField(
                  name: 'email',
                  labelText: 'Email',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                AnyStepTextField(
                  name: 'password',
                  labelText: 'Password',
                  obscureText: true,
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: AnyStepSpacing.md16),
                if (state.isLoading) const CircularProgressIndicator(),
                if (state.error != null) ...[
                  Text(
                    state.error!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AnyStepSpacing.sm8),
                ],
                ElevatedButton(
                  onPressed:
                      state.isLoading
                          ? null
                          : () {
                            if (formKey.currentState?.saveAndValidate() ?? false) {
                              final values = formKey.currentState!.value;
                              controller.login(
                                email: values['email'] ?? '',
                                password: values['password'] ?? '',
                              );
                            }
                          },
                  child: const Text('Login'),
                ),
                const SizedBox(height: AnyStepSpacing.md16),
                TextButton(
                  onPressed: () {
                    context.push(SignUpScreen.path);
                  },
                  child: const Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
