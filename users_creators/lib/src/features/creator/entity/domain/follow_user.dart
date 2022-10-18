import 'package:json_annotation/json_annotation.dart';

part 'follow_user.g.dart';

@JsonSerializable()
class FollowUser {
  FollowUser();

  factory FollowUser.fromJson(Map<String, dynamic> json) =>
      _$FollowUserFromJson(json);
}
