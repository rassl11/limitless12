import 'package:json_annotation/json_annotation.dart';
part 'swap_session_model.g.dart';

@JsonSerializable()
class SwapExercise {
  String? sessionId;
  String? groupId;
  int? round;
  List<SwappedExercises>? swappedExercises;

  SwapExercise(
      {this.sessionId, this.groupId, this.round, this.swappedExercises});

  factory SwapExercise.fromJson(Map<String, dynamic> json) =>
      _$SwapExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$SwapExerciseToJson(this);
}

@JsonSerializable()
class SwappedExercises {
  String? oldExerciseId;
  String? newExerciseId;
  List<Sets>? sets;
  int? orderNumber;

  SwappedExercises(
      {this.oldExerciseId, this.newExerciseId, this.sets, this.orderNumber});

  factory SwappedExercises.fromJson(Map<String, dynamic> json) =>
      _$SwappedExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$SwappedExercisesToJson(this);
}

@JsonSerializable()
class Sets {
  int? orderNumber;
  int? repeats;
  int? weight;
  int? percent;

  Sets({this.orderNumber, this.repeats, this.weight, this.percent});

  factory Sets.fromJson(Map<String, dynamic> json) => _$SetsFromJson(json);

  Map<String, dynamic> toJson() => _$SetsToJson(this);
}
