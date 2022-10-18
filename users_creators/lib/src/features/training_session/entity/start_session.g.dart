// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartSessionModel _$StartSessionModelFromJson(Map<String, dynamic> json) =>
    StartSessionModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      instructions: json['instructions'] as String?,
      restIntervalSec: json['restIntervalSec'] as int?,
      userId: json['userId'] as String?,
      userAvatarUrl: json['userAvatarUrl'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      isMine: json['isMine'] as bool?,
      isArchived: json['isArchived'] as bool?,
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) => Exercises.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StartSessionModelToJson(StartSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'instructions': instance.instructions,
      'restIntervalSec': instance.restIntervalSec,
      'userId': instance.userId,
      'userAvatarUrl': instance.userAvatarUrl,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isMine': instance.isMine,
      'isArchived': instance.isArchived,
      'exercises': instance.exercises,
    };

Exercises _$ExercisesFromJson(Map<String, dynamic> json) => Exercises(
      title: json['title'] as String?,
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      orderNumber: json['orderNumber'] as int?,
      restIntervalSec: json['restIntervalSec'] as int?,
      round: json['round'] as int?,
      groupId: json['groupId'] as String?,
      repMax: json['repMax'] as int?,
      sets: (json['sets'] as List<dynamic>?)
          ?.map((e) => Sets.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..doneRound = json['doneRound'] as List<dynamic>;

Map<String, dynamic> _$ExercisesToJson(Exercises instance) => <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'orderNumber': instance.orderNumber,
      'id': instance.id,
      'restIntervalSec': instance.restIntervalSec,
      'round': instance.round,
      'groupId': instance.groupId,
      'repMax': instance.repMax,
      'sets': instance.sets,
      'doneRound': instance.doneRound,
    };

Sets _$SetsFromJson(Map<String, dynamic> json) => Sets(
      id: json['id'] as String?,
      orderNumber: json['orderNumber'] as int?,
      repeats: json['repeats'] as String?,
      weight: json['weight'] as int?,
      isDone: json['isDone'] as bool?,
    );

Map<String, dynamic> _$SetsToJson(Sets instance) => <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'repeats': instance.repeats,
      'weight': instance.weight,
      'isDone': instance.isDone,
    };
