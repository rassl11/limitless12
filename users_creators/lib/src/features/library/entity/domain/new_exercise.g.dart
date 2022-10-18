// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewExercise _$NewExerciseFromJson(Map<String, dynamic> json) => NewExercise(
      id: json['id'] as String?,
      title: json['title'] as String?,
      exerciseDescription: json['exerciseDescription'] as String?,
      youtubeLink: json['youtubeLink'] as String?,
      videoUrl: json['videoUrl'] as String?,
      tempo: json['tempo'] as String?,
      notes: json['notes'] as String?,
      equipmentUsed: json['equipmentUsed'] == null
          ? null
          : ExerciseItem.fromJson(
              json['equipmentUsed'] as Map<String, dynamic>),
      otherMuscles: (json['otherMuscles'] as List<dynamic>?)
          ?.map((e) => ExerciseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      primaryMuscleGroup: (json['primaryMuscleGroup'] as List<dynamic>?)
          ?.map((e) => ExerciseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeOfExercise: json['typeOfExercise'] == null
          ? null
          : TypeOfExercise.fromJson(
              json['typeOfExercise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewExerciseToJson(NewExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'exerciseDescription': instance.exerciseDescription,
      'youtubeLink': instance.youtubeLink,
      'videoUrl': instance.videoUrl,
      'tempo': instance.tempo,
      'notes': instance.notes,
      'equipmentUsed': instance.equipmentUsed,
      'primaryMuscleGroup': instance.primaryMuscleGroup,
      'otherMuscles': instance.otherMuscles,
      'typeOfExercise': instance.typeOfExercise,
    };
