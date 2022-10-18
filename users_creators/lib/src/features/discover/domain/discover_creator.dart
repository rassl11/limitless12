// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discover_creator.g.dart';

@CopyWith()
@JsonSerializable()
class DiscoverCreator {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? avatarUrl;
  String? title;
  String? name;

  DiscoverCreator(
      {required this.id,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatarUrl,
      required this.title});
  factory DiscoverCreator.fromJson(Map<String, dynamic> json) =>
      _$DiscoverCreatorFromJson(json);

  Map<String, dynamic> toJson() => _$DiscoverCreatorToJson(this);
}
