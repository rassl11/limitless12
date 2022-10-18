// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultSearch _$ResultSearchFromJson(Map<String, dynamic> json) => ResultSearch(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      title: json['title'] as String?,
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$ResultSearchToJson(ResultSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'title': instance.title,
      'avatarUrl': instance.avatarUrl,
    };
