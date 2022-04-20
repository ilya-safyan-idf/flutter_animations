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
    CircularAnimation animator,
  ) =>
      _CircularBloc(animator);

  void updateLoadingStatus({required bool loading});
  void updateState();
  void initAnimator(TickerProvider provider);

  get anim1;
  get anim2;
  get control1;
  get control2;
}

class _CircularBloc extends BlocImpl implements CircularBloc {
  final CircularAnimation _animator;
  final CircularData _state = CircularData.init();

  _CircularBloc(this._animator);

  @override
  void initState() {
    super.initState();
    updateState();
  }

  @override
  void dispose() {
    _animator.dispose();
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
  void moveToTestScreen() {}

  @override
  void initAnimator(TickerProvider provider) {
    _animator.init(tickerProvider: provider);
  }

  get anim1 => _animator.animation1;
  get anim2 => _animator.animation2;
  get control1 => _animator.controller1;
  get control2 => _animator.controller2;
}
