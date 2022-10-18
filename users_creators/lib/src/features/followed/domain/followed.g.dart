// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AllFollowedCWProxy {
  AllFollowed avatarUrl(String? avatarUrl);

  AllFollowed email(String? email);

  AllFollowed firstName(String? firstName);

  AllFollowed id(String? id);

  AllFollowed lastName(String? lastName);

  AllFollowed name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AllFollowed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AllFollowed(...).copyWith(id: 12, name: "My name")
  /// ````
  AllFollowed call({
    String? avatarUrl,
    String? email,
    String? firstName,
    String? id,
    String? lastName,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAllFollowed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAllFollowed.copyWith.fieldName(...)`
class _$AllFollowedCWProxyImpl implements _$AllFollowedCWProxy {
  final AllFollowed _value;

  const _$AllFollowedCWProxyImpl(this._value);

  @override
  AllFollowed avatarUrl(String? avatarUrl) => this(avatarUrl: avatarUrl);

  @override
  AllFollowed email(String? email) => this(email: email);

  @override
  AllFollowed firstName(String? firstName) => this(firstName: firstName);

  @override
  AllFollowed id(String? id) => this(id: id);

  @override
  AllFollowed lastName(String? lastName) => this(lastName: lastName);

  @override
  AllFollowed name(String? name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AllFollowed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AllFollowed(...).copyWith(id: 12, name: "My name")
  /// ````
  AllFollowed call({
    Object? avatarUrl = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return AllFollowed(
      avatarUrl: avatarUrl == const $CopyWithPlaceholder()
          ? _value.avatarUrl
          // ignore: cast_nullable_to_non_nullable
          : avatarUrl as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $AllFollowedCopyWith on AllFollowed {
  /// Returns a callable class that can be used as follows: `instanceOfAllFollowed.copyWith(...)` or like so:`instanceOfAllFollowed.copyWith.fieldName(...)`.
  _$AllFollowedCWProxy get copyWith => _$AllFollowedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFollowed _$AllFollowedFromJson(Map<String, dynamic> json) => AllFollowed(
      id: json['id'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$AllFollowedToJson(AllFollowed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
