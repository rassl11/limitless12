// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoneSessionModel _$DoneSessionModelFromJson(Map<String, dynamic> json) =>
    DoneSessionModel(
      id: json['id'] as String?,
      intensity: json['intensity'] as int?,
      trainingDurationInMinutes: json['trainingDurationInMinutes'] as int?,
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) => Exercises.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoneSessionModelToJson(DoneSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'intensity': instance.intensity,
      'trainingDurationInMinutes': instance.trainingDurationInMinutes,
      'exercises': instance.exercises,
    };

Exercises _$ExercisesFromJson(Map<String, dynamic> json) => Exercises(
      id: json['id'] as String?,
      round: json['round'] as int?,
      groupId: json['groupId'] as String?,
      sets: (json['sets'] as List<dynamic>?)
          ?.map((e) => ExecuteSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExercisesToJson(Exercises instance) => <String, dynamic>{
      'id': instance.id,
      'round': instance.round,
      'groupId': instance.groupId,
      'sets': instance.sets,
    };

ExecuteSet _$ExecuteSetFromJson(Map<String, dynamic> json) => ExecuteSet(
      id: json['id'] as String?,
      orderNumber: json['orderNumber'] as int?,
      repeats: json['repeats'] as String?,
      weight: json['weight'] as int?,
      isDone: json['isDone'] as bool?,
    );

Map<String, dynamic> _$ExecuteSetToJson(ExecuteSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'repeats': instance.repeats,
      'weight': instance.weight,
      'isDone': instance.isDone,
    };
