// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfileCWProxy {
  Profile avatarUrl(String? avatarUrl);

  Profile dateOfBirth(String? dateOfBirth);

  Profile email(String? email);

  Profile firstName(String? firstName);

  Profile gender(int? gender);

  Profile height(int? height);

  Profile isMetric(bool? isMetric);

  Profile lastName(String? lastName);

  Profile role(String? role);

  Profile userName(String? userName);

  Profile weight(int? weight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Profile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Profile(...).copyWith(id: 12, name: "My name")
  /// ````
  Profile call({
    String? avatarUrl,
    String? dateOfBirth,
    String? email,
    String? firstName,
    int? gender,
    int? height,
    bool? isMetric,
    String? lastName,
    String? role,
    String? userName,
    int? weight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProfile.copyWith.fieldName(...)`
class _$ProfileCWProxyImpl implements _$ProfileCWProxy {
  final Profile _value;

  const _$ProfileCWProxyImpl(this._value);

  @override
  Profile avatarUrl(String? avatarUrl) => this(avatarUrl: avatarUrl);

  @override
  Profile dateOfBirth(String? dateOfBirth) => this(dateOfBirth: dateOfBirth);

  @override
  Profile email(String? email) => this(email: email);

  @override
  Profile firstName(String? firstName) => this(firstName: firstName);

  @override
  Profile gender(int? gender) => this(gender: gender);

  @override
  Profile height(int? height) => this(height: height);

  @override
  Profile isMetric(bool? isMetric) => this(isMetric: isMetric);

  @override
  Profile lastName(String? lastName) => this(lastName: lastName);

  @override
  Profile role(String? role) => this(role: role);

  @override
  Profile userName(String? userName) => this(userName: userName);

  @override
  Profile weight(int? weight) => this(weight: weight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Profile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Profile(...).copyWith(id: 12, name: "My name")
  /// ````
  Profile call({
    Object? avatarUrl = const $CopyWithPlaceholder(),
    Object? dateOfBirth = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? isMetric = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
  }) {
    return Profile(
      avatarUrl: avatarUrl == const $CopyWithPlaceholder()
          ? _value.avatarUrl
          // ignore: cast_nullable_to_non_nullable
          : avatarUrl as String?,
      dateOfBirth: dateOfBirth == const $CopyWithPlaceholder()
          ? _value.dateOfBirth
          // ignore: cast_nullable_to_non_nullable
          : dateOfBirth as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      gender: gender == const $CopyWithPlaceholder()
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as int?,
      height: height == const $CopyWithPlaceholder()
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as int?,
      isMetric: isMetric == const $CopyWithPlaceholder()
          ? _value.isMetric
          // ignore: cast_nullable_to_non_nullable
          : isMetric as bool?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as String?,
      userName: userName == const $CopyWithPlaceholder()
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String?,
      weight: weight == const $CopyWithPlaceholder()
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as int?,
    );
  }
}

extension $ProfileCopyWith on Profile {
  /// Returns a callable class that can be used as follows: `instanceOfProfile.copyWith(...)` or like so:`instanceOfProfile.copyWith.fieldName(...)`.
  _$ProfileCWProxy get copyWith => _$ProfileCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      userName: json['userName'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      weight: json['weight'] as int?,
      height: json['height'] as int?,
      gender: json['gender'] as int?,
      avatarUrl: json['avatarUrl'] as String?,
      isMetric: json['isMetric'] as bool?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'role': instance.role,
      'dateOfBirth': instance.dateOfBirth,
      'weight': instance.weight,
      'height': instance.height,
      'gender': instance.gender,
      'avatarUrl': instance.avatarUrl,
      'isMetric': instance.isMetric,
    };
