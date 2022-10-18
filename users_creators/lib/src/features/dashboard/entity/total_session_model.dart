class TotalSessionModel {
  int sessions;
  String volume;
  int reps;

  TotalSessionModel(
      {required this.sessions, required this.volume, required this.reps});
}

List<TotalSessionModel> totalSessionModel = [
  TotalSessionModel(reps: 779, volume: '29,424', sessions: 18)
];
