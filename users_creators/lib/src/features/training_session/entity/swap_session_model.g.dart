// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swap_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwapExercise _$SwapExerciseFromJson(Map<String, dynamic> json) => SwapExercise(
      sessionId: json['sessionId'] as String?,
      groupId: json['groupId'] as String?,
      round: json['round'] as int?,
      swappedExercises: (json['swappedExercises'] as List<dynamic>?)
          ?.map((e) => SwappedExercises.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SwapExerciseToJson(SwapExercise instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'groupId': instance.groupId,
      'round': instance.round,
      'swappedExercises': instance.swappedExercises,
    };

SwappedExercises _$SwappedExercisesFromJson(Map<String, dynamic> json) =>
    SwappedExercises(
      oldExerciseId: json['oldExerciseId'] as String?,
      newExerciseId: json['newExerciseId'] as String?,
      sets: (json['sets'] as List<dynamic>?)
          ?.map((e) => Sets.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderNumber: json['orderNumber'] as int?,
    );

Map<String, dynamic> _$SwappedExercisesToJson(SwappedExercises instance) =>
    <String, dynamic>{
      'oldExerciseId': instance.oldExerciseId,
      'newExerciseId': instance.newExerciseId,
      'sets': instance.sets,
      'orderNumber': instance.orderNumber,
    };

Sets _$SetsFromJson(Map<String, dynamic> json) => Sets(
      orderNumber: json['orderNumber'] as int?,
      repeats: json['repeats'] as int?,
      weight: json['weight'] as int?,
      percent: json['percent'] as int?,
    );

Map<String, dynamic> _$SetsToJson(Sets instance) => <String, dynamic>{
      'orderNumber': instance.orderNumber,
      'repeats': instance.repeats,
      'weight': instance.weight,
      'percent': instance.percent,
    };
