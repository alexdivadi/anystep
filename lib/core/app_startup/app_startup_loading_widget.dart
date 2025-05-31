import 'package:anystep/core/theme/colors.dart';
import 'package:anystep/core/widgets/any_step_loading_indicator.dart';
import 'package:flutter/material.dart';

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  static const String path = '/app-startup-loading';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AnyStepColors.brightBlue,
      width: double.infinity,
      height: double.infinity,
      child: const Center(child: AnyStepLoadingIndicator(color: AnyStepColors.white)),
    );
  }
}
