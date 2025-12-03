import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:anystep/core/common/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import 'login_screen_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const path = '/login';
  static const name = 'login';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(loginScreenControllerProvider.notifier);
    final state = ref.watch(loginScreenControllerProvider);
    final loc = AppLocalizations.of(context);

    return AnyStepScaffold(
      body: Padding(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        child: Center(
          child: FormBuilder(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(loc.welcomeBackMessage, style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: AnyStepSpacing.md16),
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
                  labelText: loc.password,
                  obscureText: true,
                  validator: FormBuilderValidators.required(),
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
                            controller.login(
                              email: values['email'] ?? '',
                              password: values['password'] ?? '',
                            );
                          }
                        },
                  child: Text(loc.login),
                ),
                const SizedBox(height: AnyStepSpacing.md16),
                TextButton(
                  onPressed: () {
                    context.push(SignUpScreen.path);
                  },
                  child: Text(loc.dontHaveAccount),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
