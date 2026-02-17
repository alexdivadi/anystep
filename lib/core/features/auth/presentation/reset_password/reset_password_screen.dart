import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/common/widgets/max_width_container.dart';
import 'package:anystep/core/common/widgets/widgets.dart';
import 'package:anystep/core/features/auth/data/auth_repository.dart';
import 'package:anystep/core/features/auth/presentation/login/login_screen.dart';
import 'package:anystep/core/features/auth/presentation/reset_password/reset_password_screen_controller.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  static const path = '/reset-password';
  static const name = 'reset-password';

  @override
  ConsumerState<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(resetPasswordScreenControllerProvider.notifier);
    final state = ref.watch(resetPasswordScreenControllerProvider);
    final loc = AppLocalizations.of(context);

    return AnyStepScaffold(
      appBar: const AnyStepAppBar(),
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
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        loc.resetPasswordTitle,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    const SizedBox(height: AnyStepSpacing.sm8),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        loc.resetPasswordInstructions,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: AnyStepSpacing.md16),
                    AnyStepTextField(
                      name: 'password',
                      labelText: loc.password,
                      obscureText: true,
                      validator: FormBuilderValidators.password(
                        minSpecialCharCount: 0,
                        errorText: '',
                      ),
                    ),
                    AnyStepTextField(
                      name: 'confirmPassword',
                      labelText: loc.confirmPassword,
                      obscureText: true,
                      validator: (value) {
                        final password = formKey.currentState?.fields['password']?.value;
                        if (value == null || value.isEmpty) {
                          return loc.resetPasswordConfirmRequired;
                        }
                        if (value != password) {
                          return loc.resetPasswordMismatch;
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
                    if (state.success) ...[
                      Text(
                        loc.passwordUpdatedSuccess,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AnyStepSpacing.sm8),
                    ],
                    ElevatedButton(
                      onPressed: state.isLoading
                          ? null
                          : () {
                              if (state.success) {
                                ref.read(authRepositoryProvider).logout();
                                context.go(LoginScreen.path);
                                return;
                              }
                              if (formKey.currentState?.saveAndValidate() ?? false) {
                                final values = formKey.currentState!.value;
                                controller.updatePassword(password: values['password'] ?? '');
                              }
                            },
                      child: Text(state.success ? loc.backToLogin : loc.updatePassword),
                    ),
                    if (!state.success) ...[
                      const SizedBox(height: AnyStepSpacing.md16),
                      TextButton(
                        onPressed: () => context.go(LoginScreen.path),
                        child: Text(loc.backToLogin),
                      ),
                    ],
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
