class GetSummaryModel {
  int? sessionCount;
  int? weight;
  int? reps;

  GetSummaryModel({this.sessionCount, this.reps, this.weight});

  factory GetSummaryModel.fromJson(Map<String, dynamic> json) {
    return GetSummaryModel(
        reps: json['reps'] as int?,
        weight: json['weight'] as int?,
        sessionCount: json['sessionCount'] as int?);
  }
}
