import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final beginOpacity;
  final beginAxis;
  final endAxis;
  final endOpacity;

  const FadeAnimation(
      {Key key,
      this.delay,
      this.beginOpacity,
      this.beginAxis,
      this.endAxis,
      this.endOpacity,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500),
          Tween(begin: beginOpacity, end: endOpacity)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: beginAxis, end: endAxis),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
