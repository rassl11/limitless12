// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      id: json['id'] as String,
      name: json['name'] as String?,
      instructions: json['instructions'] as String?,
      userId: json['userId'] as String?,
      userAvatarUrl: json['userAvatarUrl'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      isMine: json['isMine'] as bool?,
      isArchived: json['isArchived'] as bool?,
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) => SessionExerciseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'instructions': instance.instructions,
      'userId': instance.userId,
      'userAvatarUrl': instance.userAvatarUrl,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isMine': instance.isMine,
      'isArchived': instance.isArchived,
      'exercises': instance.exercises,
    };

SessionExerciseModel _$SessionExerciseModelFromJson(
        Map<String, dynamic> json) =>
    SessionExerciseModel(
      title: json['title'] as String?,
      imageUrl: json['imageUrl'] as String?,
      youtubeLink: json['youtubeLink'] as String?,
      orderNumber: json['orderNumber'] as int?,
      restIntervalSec: json['restIntervalSec'] as int?,
      repMax: json['repMax'] as int?,
      round: json['round'] as int?,
      groupId: json['groupId'] as String?,
      sets: (json['sets'] as List<dynamic>?)
          ?.map((e) =>
              SessionExerciseSetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SessionExerciseModelToJson(
        SessionExerciseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'youtubeLink': instance.youtubeLink,
      'orderNumber': instance.orderNumber,
      'restIntervalSec': instance.restIntervalSec,
      'round': instance.round,
      'groupId': instance.groupId,
      'repMax': instance.repMax,
      'sets': instance.sets,
    };

SessionExerciseSetModel _$SessionExerciseSetModelFromJson(
        Map<String, dynamic> json) =>
    SessionExerciseSetModel(
      orderNumber: json['orderNumber'] as int?,
      repeats: json['repeats'] as int?,
      weight: json['weight'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SessionExerciseSetModelToJson(
        SessionExerciseSetModel instance) =>
    <String, dynamic>{
      'orderNumber': instance.orderNumber,
      'repeats': instance.repeats,
      'weight': instance.weight,
      'id': instance.id,
    };
