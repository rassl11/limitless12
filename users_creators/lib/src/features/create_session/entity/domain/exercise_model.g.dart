// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    ExerciseModel(
      id: json['id'] as String,
      title: json['title'] as String?,
      typeOfExercise: json['typeOfExercise'] == null
          ? null
          : TypeOfExerciseModel.fromJson(
              json['typeOfExercise'] as Map<String, dynamic>),
      equipmentUsed: json['equipmentUsed'] == null
          ? null
          : EquipmentUsedModel.fromJson(
              json['equipmentUsed'] as Map<String, dynamic>),
      primaryMuscleGroup: (json['primaryMuscleGroup'] as List<dynamic>?)
          ?.map((e) => MuscleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      otherMuscles: (json['otherMuscles'] as List<dynamic>?)
          ?.map((e) => MuscleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      exerciseDescription: json['exerciseDescription'] as String?,
      youtubeLink: json['youtubeLink'] as String?,
      videoUrl: json['videoUrl'] as String?,
      tempo: json['tempo'] as int?,
      isMine: json['isMine'] as bool?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'typeOfExercise': instance.typeOfExercise,
      'equipmentUsed': instance.equipmentUsed,
      'primaryMuscleGroup': instance.primaryMuscleGroup,
      'otherMuscles': instance.otherMuscles,
      'exerciseDescription': instance.exerciseDescription,
      'youtubeLink': instance.youtubeLink,
      'videoUrl': instance.videoUrl,
      'tempo': instance.tempo,
      'notes': instance.notes,
      'isMine': instance.isMine,
    };

EquipmentUsedModel _$EquipmentUsedModelFromJson(Map<String, dynamic> json) =>
    EquipmentUsedModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EquipmentUsedModelToJson(EquipmentUsedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MuscleModel _$MuscleModelFromJson(Map<String, dynamic> json) => MuscleModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MuscleModelToJson(MuscleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TypeOfExerciseModel _$TypeOfExerciseModelFromJson(Map<String, dynamic> json) =>
    TypeOfExerciseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      notice: json['notice'] as String?,
    );

Map<String, dynamic> _$TypeOfExerciseModelToJson(
        TypeOfExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'notice': instance.notice,
    };
