import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
  String id;
  String? title;
  TypeOfExerciseModel? typeOfExercise;
  EquipmentUsedModel? equipmentUsed;
  List<MuscleModel>? primaryMuscleGroup;
  List<MuscleModel>? otherMuscles;
  String? exerciseDescription;
  String? youtubeLink;
  String? videoUrl;
  int? tempo;
  String? notes;
  bool? isMine;

  ExerciseModel(
      {required this.id,
      this.title,
      this.typeOfExercise,
      this.equipmentUsed,
      this.primaryMuscleGroup,
      this.otherMuscles,
      this.exerciseDescription,
      this.youtubeLink,
      this.videoUrl,
      this.tempo,
      this.isMine,
      this.notes});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);
}

@JsonSerializable()
class EquipmentUsedModel {
  String? id;
  String? name;

  EquipmentUsedModel({this.id, this.name});

  factory EquipmentUsedModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentUsedModelFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentUsedModelToJson(this);
}

@JsonSerializable()
class MuscleModel {
  String? id;
  String? name;

  MuscleModel({this.id, this.name});

  factory MuscleModel.fromJson(Map<String, dynamic> json) => _$MuscleModelFromJson(json);

  Map<String, dynamic> toJson() => _$MuscleModelToJson(this);
}

@JsonSerializable()
class TypeOfExerciseModel {
  String? id;
  String? name;
  String? notice;

  TypeOfExerciseModel({this.id, this.name, this.notice});

  factory TypeOfExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$TypeOfExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeOfExerciseModelToJson(this);
}
