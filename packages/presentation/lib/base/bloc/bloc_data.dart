class BlocData<D> {
  bool? isLoading;
  D? data;

  BlocData({
    this.isLoading,
    this.data,
  });

  void updateParams({
    bool? isLoading,
    D? data,
  }) {
    if (isLoading != null) this.isLoading = isLoading;
    if (data != null) this.data = data;
  }

  BlocData<D?> copy<D>() => BlocData(isLoading: isLoading, data: data as D?);

  factory BlocData.init() => BlocData<D>(isLoading: false, data: null);
}
