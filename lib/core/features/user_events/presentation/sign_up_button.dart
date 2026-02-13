import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/common/widgets/any_step_modal.dart';
import 'package:anystep/core/features/events/domain/event.dart';
import 'package:anystep/core/features/events/presentation/widgets/add_to_calendar_prompt.dart';
import 'package:anystep/core/features/user_events/data/sign_up_status.dart';
import 'package:anystep/core/features/user_events/domain/sign_up_status.dart';
import 'package:anystep/core/features/user_events/presentation/sign_up_button_controller.dart';
import 'package:anystep/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(event.id != null, 'Event id is required to sign up');
    final eventId = event.id!;
    final signUpStatusAsync = ref.watch(signUpStatusProvider(eventId));
    final state = ref.watch(signUpButtonControllerProvider);
    final loc = AppLocalizations.of(context);

    return signUpStatusAsync.maybeWhen(
      data: (status) => switch (status) {
        SignUpStatusData data => Column(
          children: [
            if (data.didSignUp) Text(loc.signedUp),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: data.didSignUp
                    ? AnyStepColors.error
                    : AnyStepColors.white, // Set your desired color here
                foregroundColor: data.didSignUp
                    ? AnyStepColors.white
                    : AnyStepColors.blueBright, // Text/icon color
              ),
              onPressed: state.isLoading || !data.canSignUp
                  ? null
                  : data.didSignUp
                  ? () => ref
                        .read(signUpButtonControllerProvider.notifier)
                        .cancelSignUp(userEvent: data.userEvent!)
                  : () async {
                      await ref.read(signUpButtonControllerProvider.notifier).signUp(
                            eventId: eventId,
                          );
                      final result = ref.read(signUpButtonControllerProvider);
                      if (result.hasError) return;
                      if (event.endTime.isBefore(DateTime.now().toUtc())) return;
                      if (!context.mounted) return;
                      context.showModal(AddToCalendarPrompt(event: event));
                    },
              child: state.isLoading
                  ? const CircularProgressIndicator.adaptive()
                  : Text(
                      data.canSignUp
                          ? data.didSignUp
                                ? loc.cancelSignUp
                                : loc.signUp
                          : loc.noLongerAvailable,
                    ),
            ),
          ],
        ),
        SignUpStatusError error => ElevatedButton(
          onPressed: null,
          child: Text(loc.errorWithMessage(error.message)),
        ),
      },
      loading: () =>
          ElevatedButton(onPressed: null, child: const CircularProgressIndicator.adaptive()),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
