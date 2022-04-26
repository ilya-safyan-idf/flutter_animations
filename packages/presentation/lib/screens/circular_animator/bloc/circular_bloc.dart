import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:presentation/animation/circular_animation.dart';
import 'package:presentation/base/bloc/bloc.dart';
import 'package:presentation/base/bloc/bloc_impl.dart';

import 'package:injectable/injectable.dart';
import 'package:presentation/screens/circular_animator/bloc/circular_data.dart';

@injectable
abstract class CircularBloc extends Bloc {
  @factoryMethod
  factory CircularBloc(
    CircularAnimation circlerAnimator,
  ) =>
      _CircularBloc(
        circlerAnimator,
      );

  void updateLoadingStatus({required bool loading});
  void updateState();

  void initCircleAnimation(TickerProvider provider);
  void disposeCircleAnimation();
  void setProgressIndex(int index);
  int getSliderIndex();

  onPageChanged(int number, CarouselPageChangedReason _);

  Future<void> changeOpacityLevel();

  get circleAnimator;
}

class _CircularBloc extends BlocImpl implements CircularBloc {
  final CircularAnimation _circlerAnimator;
  final CircularData _state = CircularData.init();

  _CircularBloc(
    this._circlerAnimator,
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

  // @override
  // void moveToTestScreen() {}

  @override
  void initCircleAnimation(TickerProvider provider) {
    _circlerAnimator.init(tickerProvider: provider);
  }

  @override
  void disposeCircleAnimation() {
    _circlerAnimator.dispose();
  }

  get circleAnimator => _circlerAnimator;

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
