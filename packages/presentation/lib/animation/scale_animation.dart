import 'package:flutter/material.dart';
import 'package:presentation/animation/ianimation.dart';
import 'package:injectable/injectable.dart';

@injectable
class ScaleAnimation implements IAnimation {
  ScaleAnimation();

  Animation<double>? scaleAnimation;
  AnimationController? scaleController;

  @override
  void dispose() {
    scaleController?.dispose();
  }

  @override
  void init({required TickerProvider tickerProvider}) {
    scaleController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 300),
      vsync: tickerProvider,
    );

    scaleAnimation = CurvedAnimation(
      parent: scaleController!,
      curve: Curves.easeOut,
      reverseCurve: Curves.linear,
    );
  }

  get scaleAnim => scaleAnimation;
  get scaleControl => scaleController;
}
