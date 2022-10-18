import 'package:json_annotation/json_annotation.dart';

part 'create_exercise.g.dart';

@JsonSerializable()
class CreateExercise {
  String? id;
  String? title;
  String? typeOfExercise;
  String? equipmentUsed;
  String? primaryMuscleGroup;
  String? otherMuscles;
  String? exerciseDescription;
  String? youtubeLink;
  String? videoUrl;
  int? tempo;
  String? notes;

  CreateExercise(
      {required this.equipmentUsed,
      required this.exerciseDescription,
      required this.id,
      required this.notes,
      required this.otherMuscles,
      required this.primaryMuscleGroup,
      required this.tempo,
      required this.title,
      required this.typeOfExercise,
      required this.videoUrl,
      required this.youtubeLink});

  factory CreateExercise.fromJson(Map<String, dynamic> json) => _$CreateExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExerciseToJson(this);
}
