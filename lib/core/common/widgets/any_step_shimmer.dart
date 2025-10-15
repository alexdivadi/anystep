import 'package:anystep/core/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AnyStepShimmer extends StatelessWidget {
  const AnyStepShimmer({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AnyStepColors.grayDark.withAlpha(40),
      highlightColor: AnyStepColors.grayDark.withAlpha(10),
      child: Container(
        height: height ?? 16,
        width: width ?? double.infinity,
        color: AnyStepColors.grayDark.withAlpha(40),
      ),
    );
  }
}
