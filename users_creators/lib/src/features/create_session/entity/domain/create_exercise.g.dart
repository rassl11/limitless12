// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateExercise _$CreateExerciseFromJson(Map<String, dynamic> json) =>
    CreateExercise(
      equipmentUsed: json['equipmentUsed'] as String?,
      exerciseDescription: json['exerciseDescription'] as String?,
      id: json['id'] as String?,
      notes: json['notes'] as String?,
      otherMuscles: json['otherMuscles'] as String?,
      primaryMuscleGroup: json['primaryMuscleGroup'] as String?,
      tempo: json['tempo'] as int?,
      title: json['title'] as String?,
      typeOfExercise: json['typeOfExercise'] as String?,
      videoUrl: json['videoUrl'] as String?,
      youtubeLink: json['youtubeLink'] as String?,
    );

Map<String, dynamic> _$CreateExerciseToJson(CreateExercise instance) =>
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
    };
