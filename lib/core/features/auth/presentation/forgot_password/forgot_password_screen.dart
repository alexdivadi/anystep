import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/max_width_container.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/auth/presentation/forgot_password/forgot_password_screen_controller.dart';
import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const path = '/forgot-password';
  static const name = 'forgot-password';

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(forgotPasswordScreenControllerProvider.notifier);
    final state = ref.watch(forgotPasswordScreenControllerProvider);
    final loc = AppLocalizations.of(context);

    return AnyStepScaffold(
      appBar: AnyStepAppBar(title: Text(loc.forgotPasswordTitle)),
      body: MaxWidthContainer(
        child: Padding(
          padding: const EdgeInsets.all(AnyStepSpacing.md16),
          child: Center(
            child: SingleChildScrollView(
              child: FormBuilder(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(loc.forgotPasswordTitle, style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: AnyStepSpacing.sm8),
                    Text(
                      loc.forgotPasswordInstructions,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AnyStepSpacing.md16),
                    AnyStepTextField(
                      name: 'email',
                      labelText: loc.email,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
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
                    if (state.success) ...[
                      Text(
                        loc.passwordResetEmailSent,
                        style: Theme.of(context).textTheme.bodyMedium,
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
                                controller.sendResetEmail(email: values['email'] ?? '');
                              }
                            },
                      child: Text(loc.sendResetEmail),
                    ),
                    const SizedBox(height: AnyStepSpacing.md16),
                    TextButton(
                      onPressed: () => context.go(LoginScreen.path),
                      child: Text(loc.backToLogin),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
