// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorQuestionnaire _$CreatorQuestionnaireFromJson(
        Map<String, dynamic> json) =>
    CreatorQuestionnaire(
      id: json['id'] as String,
      creatorUserId: json['creatorUserId'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreatorQuestionnaireToJson(
        CreatorQuestionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorUserId': instance.creatorUserId,
      'tags': instance.tags,
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      title: json['title'] as String?,
      order: json['order'] as int,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'title': instance.title,
      'order': instance.order,
    };
