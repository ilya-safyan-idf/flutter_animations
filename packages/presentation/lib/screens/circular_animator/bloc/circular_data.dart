enum SliderState {
  init,
  slideChanging,
  restingState,
}

class CircularData {
  int? sliderIndex;
  int? progresIndex;
  double? opacityLevel;
  SliderState? sliderState;
  

  CircularData({
    this.sliderIndex,
    this.progresIndex,
    this.opacityLevel,
    this.sliderState,
  });

  factory CircularData.init() => CircularData(
        sliderIndex: 0,
        progresIndex: 10,
        opacityLevel: 0,
        sliderState: SliderState.init,
      );

  CircularData copyWith() => CircularData(
        sliderIndex: sliderIndex,
        progresIndex: progresIndex,
        opacityLevel: opacityLevel,
        sliderState: sliderState,
      );
}
