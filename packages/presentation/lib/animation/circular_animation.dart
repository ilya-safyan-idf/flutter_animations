import 'package:flutter/material.dart';
import 'package:presentation/animation/ianimation.dart';
import 'package:injectable/injectable.dart';

@injectable
class CircularAnimation implements IAnimation {
  final Color? innerColor;
  final Color? outerColor;
  final Curve? innerAnimation;
  final Curve? outerAnimation;
  final int? innerAnimationSeconds;
  final int? outerAnimationSeconds;
  final bool? reverse;

  CircularAnimation({
    this.innerColor,
    this.outerColor,
    this.innerAnimation,
    this.outerAnimation,
    this.innerAnimationSeconds,
    this.outerAnimationSeconds,
    this.reverse,
  });
  @factoryMethod
  factory CircularAnimation.init() => CircularAnimation(
        innerColor: Colors.deepOrange,
        outerColor: Colors.deepOrange,
        innerAnimation: Curves.linear,
        outerAnimation: Curves.linear,
        innerAnimationSeconds: 30,
        outerAnimationSeconds: 30,
        reverse: true,
      );

  Animation<double>? animation1;
  Animation<double>? animation2;
  AnimationController? controller1;
  AnimationController? controller2;

  @override
  void dispose() {
    controller1!.dispose();
    controller2!.dispose();
  }

  @override
  void init({required TickerProvider tickerProvider}) {
    controller1 = AnimationController(
      duration: Duration(seconds: innerAnimationSeconds!),
      vsync: tickerProvider,
    );

    controller2 = AnimationController(
      duration: Duration(seconds: outerAnimationSeconds!),
      vsync: tickerProvider,
    );

    animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller1!,
        curve: Interval(0.0, 1.0, curve: innerAnimation!),
      ),
    );

    final secondAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller2!,
        curve: Interval(0.0, 1.0, curve: outerAnimation!),
      ),
    );

    // reverse or same direction animation
    reverse!
        ? animation2 = ReverseAnimation(secondAnimation)
        : animation2 = secondAnimation;

    controller2!.repeat();
    controller1!.repeat();
  }

  get anim1 => animation1;
  get anim2 => animation2;
  get control1 => controller1;
  get control2 => controller2;
}
