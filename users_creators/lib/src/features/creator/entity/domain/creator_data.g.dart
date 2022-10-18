// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorProfile _$CreatorProfileFromJson(Map<String, dynamic> json) =>
    CreatorProfile(
      userName: json['userName'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      title: json['title'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as int?,
      isArchived: json['isArchived'] as bool?,
      avatarUrl: json['avatarUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      followers: json['followers'] as int?,
      subscriptions: json['subscriptions'] as int?,
      sessions: json['sessions'] as int?,
      tikTok: json['tikTok'] as String?,
      instagram: json['instagram'] as String?,
      youtube: json['youtube'] as String?,
      webSite: json['webSite'] as String?,
      id: json['id'] as String?,
      giftUrl: json['giftUrl'] as String?,
      description: json['description'] as String?,
      specification: json['specification'] as String?,
      experience: json['experience'] as String?,
      requirements: json['requirements'] as String?,
      certification: json['certification'] as String?,
      isFollowed: json['isFollowed'] as bool?,
    );

Map<String, dynamic> _$CreatorProfileToJson(CreatorProfile instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'isArchived': instance.isArchived,
      'avatarUrl': instance.avatarUrl,
      'videoUrl': instance.videoUrl,
      'followers': instance.followers,
      'subscriptions': instance.subscriptions,
      'sessions': instance.sessions,
      'tikTok': instance.tikTok,
      'instagram': instance.instagram,
      'id': instance.id,
      'youtube': instance.youtube,
      'webSite': instance.webSite,
      'giftUrl': instance.giftUrl,
      'description': instance.description,
      'specification': instance.specification,
      'experience': instance.experience,
      'requirements': instance.requirements,
      'certification': instance.certification,
      'isFollowed': instance.isFollowed,
      'title': instance.title,
    };
