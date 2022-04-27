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
  bool? isWidgetsScaled;
  int? counter;

  CircularData({
    this.sliderIndex,
    this.progresIndex,
    this.opacityLevel,
    this.sliderState,
    this.isWidgetsScaled,
    this.counter,
  });

  factory CircularData.init() => CircularData(
        sliderIndex: 0,
        progresIndex: 10,
        opacityLevel: 0,
        sliderState: SliderState.init,
        isWidgetsScaled: false,
        counter: 6,
      );

  CircularData copyWith() => CircularData(
        sliderIndex: sliderIndex,
        progresIndex: progresIndex,
        opacityLevel: opacityLevel,
        sliderState: sliderState,
        isWidgetsScaled: isWidgetsScaled,
        counter: counter,
      );
}
