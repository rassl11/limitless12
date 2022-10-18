import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_search.g.dart';

@JsonSerializable()
class ResultSearch {
  String? id;
  String? userName;
  String? email;
  String? firstName;
  String? lastName;
  String? title;
  String? avatarUrl;

  ResultSearch({
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.id,
    required this.userName,
    required this.email,
    required this.avatarUrl,
  });

  factory ResultSearch.fromJson(Map<String,dynamic> json) => _$ResultSearchFromJson(json);

  Map<String,dynamic> toJson() => _$ResultSearchToJson(this);
}
