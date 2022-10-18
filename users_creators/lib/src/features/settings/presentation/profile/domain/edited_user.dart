 import 'package:json_annotation/json_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';

part 'edited_user.g.dart';
@CopyWith()
@JsonSerializable()
class EditedUser {
  String? userName;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  int? gender;
  String? avatarUrl;
  int? weight;
  int? height;
  bool? isMetric;
  String? email;

  EditedUser(
      {this.userName,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.avatarUrl,
      this.weight,
      this.height,
      this.email,
      this.isMetric});

      factory EditedUser.fromJson(Map<String, dynamic> json) => _$EditedUserFromJson(json);

  Map<String, dynamic> toJson() => _$EditedUserToJson(this);
}