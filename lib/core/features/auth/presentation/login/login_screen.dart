import 'package:anystep/core/widgets/any_step_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnyStepLoadingIndicator(),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
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
                        controller.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
