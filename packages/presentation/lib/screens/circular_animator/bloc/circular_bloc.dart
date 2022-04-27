import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:presentation/animation/circular_animation.dart';
import 'package:presentation/animation/scale_animation.dart';
import 'package:presentation/base/bloc/bloc.dart';
import 'package:presentation/base/bloc/bloc_impl.dart';

import 'package:injectable/injectable.dart';
import 'package:presentation/screens/circular_animator/bloc/circular_data.dart';
import 'package:presentation/screens/main/main_screen.dart';

@injectable
abstract class CircularBloc extends Bloc {
  @factoryMethod
  factory CircularBloc(
    CircularAnimation circlerAnimator,
    ScaleAnimation scaleAnimation,
  ) =>
      _CircularBloc(
        circlerAnimator,
        scaleAnimation,
      );

  void updateLoadingStatus({required bool loading});
  void updateState();
  void moveToMainScreen();

  void initCircleAnimation(TickerProvider provider);
  void initScaleAnimation(TickerProvider provider);
  void disposeCircleAnimation();
  void disposeScaleAnimation();

  void setProgressIndex(int index);
  int getSliderIndex();
  void startCounter();

  onPageChanged(int number, CarouselPageChangedReason _);

  Future<void> changeOpacityLevel();

  get circleAnimator;
  get scaleAnimatorController;
}

class _CircularBloc extends BlocImpl implements CircularBloc {
  late Timer _timer;
  final CircularAnimation _circlerAnimator;
  final ScaleAnimation _scaleAnimation;
  final CircularData _state = CircularData.init();

  _CircularBloc(
    this._circlerAnimator,
    this._scaleAnimation,
  );

  @override
  void initState() {
    super.initState();
    updateState();
    changeOpacityLevel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void updateState() {
    super.handleData(
      isLoading: super.loadingStatus,
      data: _state,
    );
  }

  @override
  void moveToMainScreen() async {
    _scaleAnimation.scaleControl.reverse();
    await Future.delayed(Duration(milliseconds: 100), () {
      _state.isWidgetsScaled = true;
      updateState();
    });
    startCounter();
    await Future.delayed(Duration(milliseconds: 5667), () {
      appNavigator.popAndPush(
        MainScreen.page(),
      );
    });
  }

  @override
  void startCounter() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_state.counter! > 0) {
        _state.counter = _state.counter! - 1;
        updateState();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initCircleAnimation(TickerProvider provider) {
    _circlerAnimator.init(tickerProvider: provider);
  }

  @override
  void initScaleAnimation(TickerProvider provider) {
    _scaleAnimation.init(tickerProvider: provider);
    _scaleAnimation.scaleControl.forward();
  }

  @override
  void disposeCircleAnimation() {
    _circlerAnimator.dispose();
  }

  @override
  void disposeScaleAnimation() {
    _scaleAnimation.dispose();
  }

  get circleAnimator => _circlerAnimator;
  get scaleAnimatorController => _scaleAnimation.scaleControl;

  @override
  onPageChanged(index, _) async {
    _state.sliderState = SliderState.slideChanging;
    _state.opacityLevel = 0;
    _state.sliderIndex = index;
    setProgressIndex(index);

    updateState();

    await Future.delayed(Duration(milliseconds: 100), () {
      _state.sliderState = SliderState.restingState;
      updateState();
    });

    await Future.delayed(Duration(milliseconds: 200), () {
      _state.opacityLevel = 1;
    });

    updateState();
  }

  @override
  void setProgressIndex(int index) {
    switch (index) {
      case 0:
        _state.progresIndex = 15;
        break;
      case 1:
        _state.progresIndex = 45;
        break;
      case 2:
        _state.progresIndex = 100;
        break;
      default:
        _state.progresIndex = 33;
    }
  }

  @override
  int getSliderIndex() => _state.sliderIndex!;

  @override
  Future<void> changeOpacityLevel() async {
    await Future.delayed(Duration(milliseconds: 300), () {
      _state.opacityLevel = 1.0;
      updateState();
    });
  }
}
