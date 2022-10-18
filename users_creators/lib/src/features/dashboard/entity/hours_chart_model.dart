class HoursChartModel{
  double hours;
  bool trained;

  HoursChartModel({
  required this.hours,
  required this.trained
  });
}

  List<HoursChartModel> hoursChartModel = [
    HoursChartModel(
      trained: true,
      hours: 26.5,
    ),
      HoursChartModel(
      trained: false,
      hours: 2,
    ),
      HoursChartModel(
      trained: false,
      hours: 18,
    ),
      HoursChartModel(
      trained: true,
      hours: 14,
    ),
      HoursChartModel(
      trained: false,
      hours: 22,
    ),
      HoursChartModel(
      trained: false,
      hours: 15,
    ),
      HoursChartModel(
      trained: false,
      hours: 21,
    ),
      HoursChartModel(
      trained: false,
      hours: 24,
    ),

  ];

