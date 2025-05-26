import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sign_up_screen_controller.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  static const path = '/sign-up';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(signUpScreenControllerProvider.notifier);
    final state = ref.watch(signUpScreenControllerProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final zipController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final birthdateController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              TextField(
                controller: zipController,
                decoration: const InputDecoration(labelText: 'Zip Code'),
              ),
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextField(
                controller: birthdateController,
                decoration: const InputDecoration(labelText: 'Birthdate (YYYY-MM-DD)'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number (optional)'),
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
                          controller.signUp(
                            email: emailController.text,
                            password: passwordController.text,
                            zipCode: zipController.text,
                            firstName: firstNameController.text,
                            lastName: firstNameController.text,
                            birthdate:
                                DateTime.tryParse(birthdateController.text) ?? DateTime.now(),
                            phoneNumber: phoneController.text.isEmpty ? null : phoneController.text,
                          );
                        },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
