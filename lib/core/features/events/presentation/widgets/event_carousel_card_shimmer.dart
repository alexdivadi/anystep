import 'package:anystep/core/common/constants/spacing.dart';
import 'package:anystep/core/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventCarouselCardShimmer extends StatelessWidget {
  const EventCarouselCardShimmer({super.key, this.width = 220});
  final double width;

  @override
  Widget build(BuildContext context) {
    final base = AnyStepColors.grayDark.withAlpha(40);
    final highlight = AnyStepColors.grayDark.withAlpha(10);

    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(
        horizontal: AnyStepSpacing.sm8,
        vertical: AnyStepSpacing.sm4,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AnyStepSpacing.sm8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image shimmer
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AnyStepSpacing.sm8),
              topRight: Radius.circular(AnyStepSpacing.sm8),
            ),
            child: _ShimmerBox(
              height: width * 9 / 16,
              width: width,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AnyStepSpacing.sm8),
                topRight: Radius.circular(AnyStepSpacing.sm8),
              ),
              base: base,
              highlight: highlight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AnyStepSpacing.sm8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title shimmer
                _ShimmerBox(
                  height: AnyStepSpacing.md12,
                  width: width * 0.75,
                  base: base,
                  highlight: highlight,
                ),
                const SizedBox(height: AnyStepSpacing.sm6),
                // Subtitle shimmer
                _ShimmerBox(
                  height: AnyStepSpacing.sm10,
                  width: width * 0.55,
                  base: base,
                  highlight: highlight,
                ),
                const SizedBox(height: AnyStepSpacing.sm6),
                // Description shimmer
                _ShimmerBox(
                  height: AnyStepSpacing.sm10,
                  width: width * 0.9,
                  base: base,
                  highlight: highlight,
                ),
                const SizedBox(height: AnyStepSpacing.sm8),
                // Add a row of shimmer chips for more realistic loading
                Row(
                  children: List.generate(
                    2,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: AnyStepSpacing.sm6),
                      child: _ShimmerBox(
                        height: AnyStepSpacing.sm8,
                        width: width * 0.25,
                        borderRadius: BorderRadius.circular(16),
                        base: base,
                        highlight: highlight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({
    required this.height,
    required this.width,
    this.borderRadius,
    required this.base,
    required this.highlight,
  });

  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final Color base;
  final Color highlight;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: base,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }
}
