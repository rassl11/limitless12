import 'package:json_annotation/json_annotation.dart';
part 'creator_questionnaire.g.dart';

@JsonSerializable()
class CreatorQuestionnaire {
  String id;
  String creatorUserId;
  List<String>? tags;
  List<Question>? questions;

  CreatorQuestionnaire({
    required this.id,
    required this.creatorUserId,
    required this.tags,
    required this.questions,
  });

  factory CreatorQuestionnaire.fromJson(Map<String, dynamic> json) =>
      _$CreatorQuestionnaireFromJson(json);
}

@JsonSerializable()
class Question {
  String id;
  String itemId;
  String? title;
  int order;

  Question({
    required this.id,
    required this.itemId,
    required this.title,
    required this.order,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
