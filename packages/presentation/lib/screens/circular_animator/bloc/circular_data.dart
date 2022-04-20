class CircularData {
  String? value;

  CircularData({
    this.value,
  });

  factory CircularData.init() => CircularData(value: '');

  CircularData copyWith() => CircularData(
        value: value,
      );
}
