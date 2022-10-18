import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TemplateModel {
  String id;
  String? name;
  String? instructions;
  String? userAvatarUrl;
  String? exerciseList;
  int exerciseCount;

  TemplateModel(
      {required this.id,
      this.name,
      this.instructions,
      this.userAvatarUrl,
      this.exerciseList,
      required this.exerciseCount});

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
        id: json['id'],
        name: json['name'],
        instructions: json['instructions'],
        userAvatarUrl: json['userAvatarUrl'],
        exerciseList: json['exerciseList'],
        exerciseCount: json['exerciseCount']);
  }
}
