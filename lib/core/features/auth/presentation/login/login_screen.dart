import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:anystep/core/common/widgets/any_step_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'login_screen_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const path = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(loginScreenControllerProvider.notifier);
    final state = ref.watch(loginScreenControllerProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return AnyStepScaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(AnyStepSpacing.md16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: AnyStepSpacing.md16),
            if (state.isLoading) const CircularProgressIndicator(),
            if (state.error != null) ...[
              Text(state.error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              const SizedBox(height: AnyStepSpacing.sm8),
            ],
            ElevatedButton(
              onPressed:
                  state.isLoading
                      ? null
                      : () {
                        controller.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
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
    );
  }
}
