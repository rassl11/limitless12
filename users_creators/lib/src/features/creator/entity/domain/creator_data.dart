import 'package:json_annotation/json_annotation.dart';

part 'creator_data.g.dart';

@JsonSerializable()
class CreatorProfile {
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  int? gender;
  bool? isArchived;
  String? avatarUrl;
  String? videoUrl;
  int? followers;
  int? subscriptions;
  int? sessions;
  String? tikTok;
  String? instagram;
  String? id;
  String? youtube;
  String? webSite;
  String? giftUrl;
  String? description;
  String? specification;
  String? experience;
  String? requirements;
  String? certification;
  bool? isFollowed;
  String? title;

  CreatorProfile(
      {required this.userName,
      required this.firstName,
      required this.lastName,
      required this.title,
      required this.email,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.gender,
      required this.isArchived,
      required this.avatarUrl,
      required this.videoUrl,
      required this.followers,
      required this.subscriptions,
      required this.sessions,
      required this.tikTok,
      required this.instagram,
      required this.youtube,
      required this.webSite,
      required this.id,
      required this.giftUrl,
      required this.description,
      required this.specification,
      required this.experience,
      required this.requirements,
      required this.certification,
      required this.isFollowed
      });

  factory CreatorProfile.fromJson(Map<String, dynamic> json) =>
      _$CreatorProfileFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorProfileToJson(this);
}
