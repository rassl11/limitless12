// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'followed.g.dart';

@CopyWith()
@JsonSerializable()
class AllFollowed {
  String? id;
  String? name;
  String? avatarUrl;
  String? firstName;
  String? lastName;
  String? email;

  AllFollowed({required this.id, required this.avatarUrl, required this.firstName, required this.lastName, required this.name, required this.email});

  factory AllFollowed.fromJson(Map<String, dynamic> json) => _$AllFollowedFromJson(json);

  Map<String, dynamic> toJson() => _$AllFollowedToJson(this);
}
