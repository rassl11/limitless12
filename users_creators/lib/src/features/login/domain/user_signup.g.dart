// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUp _$UserSignUpFromJson(Map<String, dynamic> json) => UserSignUp(
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserSignUpToJson(UserSignUp instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
    };
