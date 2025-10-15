import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:anystep/core/common/constants/spacing.dart';

class EventCardShimmer extends StatelessWidget {
  const EventCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AnyStepSpacing.md12,
        vertical: AnyStepSpacing.sm6,
      ),
      child: Shimmer.fromColors(
        baseColor: AnyStepColors.grayDark.withAlpha(40),
        highlightColor: AnyStepColors.grayDark.withAlpha(10),
        child: ListTile(
          leading: Container(
            width: AnyStepSpacing.xl56,
            height: AnyStepSpacing.xl56,
            decoration: BoxDecoration(
              color: AnyStepColors.grayDark.withAlpha(40),
              borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
            ),
          ),
          title: Container(
            width: double.infinity,
            height: AnyStepSpacing.md16,
            color: AnyStepColors.grayDark.withAlpha(40),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AnyStepSpacing.sm8),
              Container(
                width: 120,
                height: AnyStepSpacing.sm10,
                color: AnyStepColors.grayDark.withAlpha(40),
              ),
              SizedBox(height: AnyStepSpacing.sm4),
              Container(
                width: double.infinity,
                height: AnyStepSpacing.sm8,
                color: AnyStepColors.grayDark.withAlpha(40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
