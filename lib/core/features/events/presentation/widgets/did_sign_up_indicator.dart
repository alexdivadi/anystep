import 'package:anystep/core/common/widgets/any_step_fade.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/features/user_events/data/sign_up_status.dart';
import 'package:anystep/core/features/user_events/domain/sign_up_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';

class DidSignUpIndicator extends ConsumerWidget {
  const DidSignUpIndicator({super.key, required this.eventId});

  final int eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpStatusAsync = ref.watch(signUpStatusProvider(eventId));
    return signUpStatusAsync.maybeWhen(
      data:
          (status) => switch (status) {
            SignUpStatusData data =>
              data.didSignUp
                  ? AnyStepFade(child: Icon(Icons.check_circle, color: AnyStepColors.green))
                  : const SizedBox.shrink(),
            _ => SizedBox.shrink(),
          },
      orElse: SizedBox.shrink,
    );
  }
}
