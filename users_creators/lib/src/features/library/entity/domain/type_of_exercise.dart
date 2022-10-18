import 'package:json_annotation/json_annotation.dart';
part 'type_of_exercise.g.dart';

@JsonSerializable()
class TypeOfExercise {
  String? id;
  String? name;
  String? notice;

  TypeOfExercise({this.id, this.name, this.notice});

  factory TypeOfExercise.fromJson(Map<String, dynamic> json) =>
      _$TypeOfExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$TypeOfExerciseToJson(this);
}