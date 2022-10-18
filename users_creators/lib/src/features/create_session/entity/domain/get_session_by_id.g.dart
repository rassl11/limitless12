// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_session_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSessionById _$GetSessionByIdFromJson(Map<String, dynamic> json) =>
    GetSessionById(
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
      isExecuted: json['isExecuted'] as bool?,
      intensity: json['intensity'] as int?,
      trainingDurationSec: json['trainingDurationSec'] as int?,
      duration: json['duration'] as int?,
      trainingLevel: json['trainingLevel'] as int?,
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSessionByIdToJson(GetSessionById instance) =>
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
      'isExecuted': instance.isExecuted,
      'intensity': instance.intensity,
      'trainingDurationSec': instance.trainingDurationSec,
      'duration': instance.duration,
      'trainingLevel': instance.trainingLevel,
      'exercises': instance.exercises,
    };
