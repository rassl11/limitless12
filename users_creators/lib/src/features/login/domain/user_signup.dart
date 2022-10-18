import 'package:json_annotation/json_annotation.dart';

part 'user_signup.g.dart';
@JsonSerializable()
class UserSignUp{
  final String username;
  final String password;
   final String email;
  UserSignUp({
    required this.username,
    required this.password,
     required this.email,
  });

  factory UserSignUp.fromJson(Map<String, dynamic> json) => _$UserSignUpFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpToJson(this);
}