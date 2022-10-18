class VolumeChartModel{
  double weight;
  bool trained;

  VolumeChartModel({
  required this.weight,
  required this.trained
  });
}

  List<VolumeChartModel> volumeChartModel = [
    VolumeChartModel(
      trained: true,
      weight: 2,
    ),
      VolumeChartModel(
      trained: true,
      weight: 20,
    ),
      VolumeChartModel(
      trained: true,
      weight: 18,
    ),
      VolumeChartModel(
      trained: false,
      weight: 10,
    ),
      VolumeChartModel(
      trained: true,
      weight: 22,
    ),
      VolumeChartModel(
      trained: true,
      weight: 15,
    ),
      VolumeChartModel(
      trained: true,
      weight: 24,
    ),
      VolumeChartModel(
      trained: true,
      weight: 25,
    ),

  ];

