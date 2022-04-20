import 'package:flutter/material.dart';
import 'package:presentation/navigator/app_navigator.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/screens/circular_animator/circular_animator.dart';


class AnimationType {
  final String description;
  final String title;

  AnimationType(this.title, this.description);

  @protected
  final appNavigator = GetIt.I.get<AppNavigator>();

  void moveToScreen() {

    switch (title) {
      case 'circular_animator':
        appNavigator.push(
          CircularAnimator.page(),
        );
        return;
      default:
        return;
    }
  }
}
