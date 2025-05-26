import 'dart:math';

import 'package:anystep/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AnyStepLoadingIndicator extends StatefulWidget {
  const AnyStepLoadingIndicator({
    super.key,
    this.size = 36.0,
    this.color = AnyStepColors.brightBlue,
    this.duration = const Duration(seconds: 3),
    this.fadeInDurationPercentage = 0.15,
    this.count = 3,
    this.stepLength = 30.0,
    this.strideWidth = 20.0,
  }) : assert(
         fadeInDurationPercentage > 0 && fadeInDurationPercentage <= 0.33,
         'fadeInDurationPercentage must be between 0 and 0.33',
       );

  final double size;
  final Color color;
  final Duration duration;
  final double fadeInDurationPercentage;
  final int count;
  final double stepLength;
  final double strideWidth;

  @override
  State<AnyStepLoadingIndicator> createState() => _AnyStepLoadingIndicatorState();
}

class _AnyStepLoadingIndicatorState extends State<AnyStepLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _opacities;
  late List<Offset> _positions;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this)..repeat();

    _generateFootprints();
    _setupAnimations();
  }

  void _setupAnimations() {
    _opacities = List.generate(3, (index) {
      final start = index * 0.33;
      final end = start + widget.fadeInDurationPercentage;
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(start, end, curve: Curves.easeIn)),
      );
    });
  }

  @override
  void didUpdateWidget(covariant AnyStepLoadingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      _controller.reset();
      _controller.repeat();
      _setupAnimations();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _generateFootprints() {
    double sqrt2over2 = sqrt(2) / 2;

    final direction = Offset(sqrt2over2, -sqrt2over2);

    final perp = Offset(sqrt2over2, sqrt2over2);

    _positions = List.generate(widget.count, (i) {
      double lateralOffset = pow(-1, i) * (widget.strideWidth / 2);

      Offset forwardStep = direction * (i * widget.stepLength);
      Offset lateralShift = perp * lateralOffset;

      return forwardStep + lateralShift + Offset(0, widget.size);
    });
  }

  Widget _buildFootprint(Animation<double> animation, Offset offset, {bool flip = false}) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          child: Opacity(
            opacity: animation.value,
            child: Transform(
              alignment: Alignment.center,
              transform:
                  Matrix4.identity()
                    // Rotate 45 degrees clockwise
                    ..rotateZ(45 * 3.1415927 / 180)
                    // Flip horizontally if flip==true
                    ..scale(flip ? -1.0 : 1.0, 1.0),
              child: Image.asset(
                'assets/images/shoe_print.png',
                width: widget.size,
                height: widget.size,
                color: widget.color,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * 2.5,
      height: widget.size * 2.5,
      child: Stack(
        children: [
          _buildFootprint(_opacities[0], _positions[0]),
          _buildFootprint(_opacities[1], _positions[1], flip: true),
          _buildFootprint(_opacities[2], _positions[2]),
        ],
      ),
    );
  }
}
