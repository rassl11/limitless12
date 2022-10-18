
 import 'package:json_annotation/json_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';

part 'profile.g.dart';
@CopyWith()
@JsonSerializable()
class Profile {
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? dateOfBirth;
  int? weight;
  int? height;
  int? gender;
  String? avatarUrl;
  bool? isMetric;

  Profile(
      {this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.role,
      this.dateOfBirth,
      this.weight,
      this.height,
      this.gender,
      this.avatarUrl,
      this.isMetric});

      factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
      }