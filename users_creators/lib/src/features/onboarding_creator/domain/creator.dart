import 'package:json_annotation/json_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';

part 'creator.g.dart';
@CopyWith()
@JsonSerializable()
class Creator {
  String? userName;
  String? firstName;
  String? email;
  String? lastName;
  String? dateOfBirth;
  int? gender;
  String? avatarUrl;
  int? weight;
  int? height;
  bool? isMetric;
  String? tikTok;
  String? webSite;
  String? title;
  String? description;
  String? coverUrl;
  int? contentType;
  int? monetize;
  int? grow;

  Creator(
      {this.userName,
      this.firstName,
      this.email,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.avatarUrl,
      this.weight,
      this.height,
      this.isMetric,
      this.tikTok,
      this.webSite,
      this.title,
      this.description,
      this.coverUrl,
      this.contentType,
      this.monetize,
      this.grow});

  factory Creator.fromJson(Map<String, dynamic> json) => _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}