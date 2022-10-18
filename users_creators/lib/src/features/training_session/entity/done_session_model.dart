import 'package:json_annotation/json_annotation.dart';

part 'done_session_model.g.dart';

@JsonSerializable()
class DoneSessionModel {
  String? id;
  int? intensity;
  int? trainingDurationInMinutes;
  List<Exercises>? exercises;

  DoneSessionModel({this.id, this.intensity, this.trainingDurationInMinutes, this.exercises});

  factory DoneSessionModel.fromJson(Map<String, dynamic> json) => _$DoneSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoneSessionModelToJson(this);
}

@JsonSerializable()
class Exercises {
  String? id;
  int? round;
  String? groupId;
  List<ExecuteSet>? sets;

  Exercises({this.id, this.round, this.groupId, this.sets});

  factory Exercises.fromJson(Map<String, dynamic> json) => _$ExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$ExercisesToJson(this);
}

@JsonSerializable()
class ExecuteSet {
  String? id;
  int? orderNumber;
  String? repeats;
  int? weight;
  bool? isDone;

  ExecuteSet({this.id, this.orderNumber, this.repeats, this.weight, this.isDone});

  factory ExecuteSet.fromJson(Map<String, dynamic> json) => _$ExecuteSetFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderNumber'] = orderNumber;
    data['repeats'] = int.parse(repeats ?? '0');
    data['weight'] = weight;
    data['isDone'] = isDone;
    return data;
  }
}
