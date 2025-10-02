import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/user_events/data/sign_up_status.dart';
import 'package:anystep/core/features/user_events/domain/sign_up_status.dart';
import 'package:anystep/core/features/user_events/presentation/sign_up_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key, required this.eventId});

  final int eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpStatusAsync = ref.watch(signUpStatusProvider(eventId));
    final state = ref.watch(signUpButtonControllerProvider);
    return signUpStatusAsync.maybeWhen(
      data:
          (status) => switch (status) {
            SignUpStatusData data => Column(
              children: [
                if (data.didSignUp) Text("Signed Up"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        data.didSignUp
                            ? AnyStepColors.error
                            : AnyStepColors.white, // Set your desired color here
                    foregroundColor:
                        data.didSignUp
                            ? AnyStepColors.white
                            : AnyStepColors.blueBright, // Text/icon color
                  ),
                  onPressed:
                      state.isLoading || !data.canSignUp
                          ? null
                          : data.didSignUp
                          ? () => ref
                              .read(signUpButtonControllerProvider.notifier)
                              .cancelSignUp(userEvent: data.userEvent!)
                          : () => ref
                              .read(signUpButtonControllerProvider.notifier)
                              .signUp(eventId: eventId),
                  child:
                      state.isLoading
                          ? const CircularProgressIndicator.adaptive()
                          : Text(
                            data.canSignUp
                                ? data.didSignUp
                                    ? 'Cancel Sign Up'
                                    : 'Sign Up'
                                : 'No longer available',
                          ),
                ),
              ],
            ),
            SignUpStatusError error => ElevatedButton(
              onPressed: null,
              child: Text('Error: ${error.message}'),
            ),
          },
      loading:
          () => ElevatedButton(onPressed: null, child: const CircularProgressIndicator.adaptive()),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
