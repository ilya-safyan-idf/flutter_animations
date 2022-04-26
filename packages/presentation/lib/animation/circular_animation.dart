import 'package:flutter/material.dart';
import 'package:presentation/animation/ianimation.dart';
import 'package:injectable/injectable.dart';

@injectable
class CircularAnimation implements IAnimation {
  CircularAnimation();

  Animation<double>? animation1;
  Animation<double>? animation2;
  AnimationController? controller1;
  AnimationController? controller2;
  bool reverse = true;

  @override
  void dispose() {
    controller1?.dispose();
    controller2?.dispose();
  }

  @override
  void init({required TickerProvider tickerProvider}) {
    controller1 = AnimationController(
      duration: Duration(seconds: 30),
      vsync: tickerProvider,
    );

    controller2 = AnimationController(
      duration: Duration(seconds: 30),
      vsync: tickerProvider,
    );

    animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller1!,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    final secondAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller2!,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    // reverse or same direction animation
    reverse
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
