import 'package:flutter/material.dart';
import './circular_reveal_clipper.dart';

class CircularRevealAnimation extends StatelessWidget {
  final Alignment centerAlignment;
  final Offset centerOffset;
  final double minRadius;
  final double maxRadius;
  final Widget child;
  final Animation<double> animation;

  CircularRevealAnimation(
      {this.centerAlignment,
      this.centerOffset,
      this.minRadius,
      this.maxRadius,
      @required this.animation,
      @required this.child})
      : assert(child != null),
        assert(animation != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget _) {
        return ClipPath(
          clipper: CircularRevealClipper(
            fraction: animation.value,
            centerAlignment: centerAlignment,
            centerOffset: centerOffset,
            minRadius: minRadius,
            maxRadius: maxRadius,
          ),
          child: this.child,
        );
      },
    );
  }
}
