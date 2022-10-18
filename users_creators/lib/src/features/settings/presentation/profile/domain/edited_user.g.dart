// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edited_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EditedUserCWProxy {
  EditedUser avatarUrl(String? avatarUrl);

  EditedUser dateOfBirth(String? dateOfBirth);

  EditedUser email(String? email);

  EditedUser firstName(String? firstName);

  EditedUser gender(int? gender);

  EditedUser height(int? height);

  EditedUser isMetric(bool? isMetric);

  EditedUser lastName(String? lastName);

  EditedUser phoneNumber(String? phoneNumber);

  EditedUser userName(String? userName);

  EditedUser weight(int? weight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditedUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditedUser(...).copyWith(id: 12, name: "My name")
  /// ````
  EditedUser call({
    String? avatarUrl,
    String? dateOfBirth,
    String? email,
    String? firstName,
    int? gender,
    int? height,
    bool? isMetric,
    String? lastName,
    String? phoneNumber,
    String? userName,
    int? weight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEditedUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEditedUser.copyWith.fieldName(...)`
class _$EditedUserCWProxyImpl implements _$EditedUserCWProxy {
  final EditedUser _value;

  const _$EditedUserCWProxyImpl(this._value);

  @override
  EditedUser avatarUrl(String? avatarUrl) => this(avatarUrl: avatarUrl);

  @override
  EditedUser dateOfBirth(String? dateOfBirth) => this(dateOfBirth: dateOfBirth);

  @override
  EditedUser email(String? email) => this(email: email);

  @override
  EditedUser firstName(String? firstName) => this(firstName: firstName);

  @override
  EditedUser gender(int? gender) => this(gender: gender);

  @override
  EditedUser height(int? height) => this(height: height);

  @override
  EditedUser isMetric(bool? isMetric) => this(isMetric: isMetric);

  @override
  EditedUser lastName(String? lastName) => this(lastName: lastName);

  @override
  EditedUser phoneNumber(String? phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  EditedUser userName(String? userName) => this(userName: userName);

  @override
  EditedUser weight(int? weight) => this(weight: weight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditedUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditedUser(...).copyWith(id: 12, name: "My name")
  /// ````
  EditedUser call({
    Object? avatarUrl = const $CopyWithPlaceholder(),
    Object? dateOfBirth = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? isMetric = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
  }) {
    return EditedUser(
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
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
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

extension $EditedUserCopyWith on EditedUser {
  /// Returns a callable class that can be used as follows: `instanceOfEditedUser.copyWith(...)` or like so:`instanceOfEditedUser.copyWith.fieldName(...)`.
  _$EditedUserCWProxy get copyWith => _$EditedUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditedUser _$EditedUserFromJson(Map<String, dynamic> json) => EditedUser(
      userName: json['userName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as int?,
      avatarUrl: json['avatarUrl'] as String?,
      weight: json['weight'] as int?,
      height: json['height'] as int?,
      email: json['email'] as String?,
      isMetric: json['isMetric'] as bool?,
    );

Map<String, dynamic> _$EditedUserToJson(EditedUser instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'avatarUrl': instance.avatarUrl,
      'weight': instance.weight,
      'height': instance.height,
      'isMetric': instance.isMetric,
      'email': instance.email,
    };
