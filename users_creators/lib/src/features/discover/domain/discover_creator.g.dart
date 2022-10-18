// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_creator.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiscoverCreatorCWProxy {
  DiscoverCreator avatarUrl(String? avatarUrl);

  DiscoverCreator email(String? email);

  DiscoverCreator firstName(String? firstName);

  DiscoverCreator id(String? id);

  DiscoverCreator lastName(String? lastName);

  DiscoverCreator title(String? title);

  DiscoverCreator userName(String? userName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiscoverCreator(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiscoverCreator(...).copyWith(id: 12, name: "My name")
  /// ````
  DiscoverCreator call({
    String? avatarUrl,
    String? email,
    String? firstName,
    String? id,
    String? lastName,
    String? title,
    String? userName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiscoverCreator.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiscoverCreator.copyWith.fieldName(...)`
class _$DiscoverCreatorCWProxyImpl implements _$DiscoverCreatorCWProxy {
  final DiscoverCreator _value;

  const _$DiscoverCreatorCWProxyImpl(this._value);

  @override
  DiscoverCreator avatarUrl(String? avatarUrl) => this(avatarUrl: avatarUrl);

  @override
  DiscoverCreator email(String? email) => this(email: email);

  @override
  DiscoverCreator firstName(String? firstName) => this(firstName: firstName);

  @override
  DiscoverCreator id(String? id) => this(id: id);

  @override
  DiscoverCreator lastName(String? lastName) => this(lastName: lastName);

  @override
  DiscoverCreator title(String? title) => this(title: title);

  @override
  DiscoverCreator userName(String? userName) => this(userName: userName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiscoverCreator(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiscoverCreator(...).copyWith(id: 12, name: "My name")
  /// ````
  DiscoverCreator call({
    Object? avatarUrl = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
  }) {
    return DiscoverCreator(
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
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      userName: userName == const $CopyWithPlaceholder()
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String?,
    );
  }
}

extension $DiscoverCreatorCopyWith on DiscoverCreator {
  /// Returns a callable class that can be used as follows: `instanceOfDiscoverCreator.copyWith(...)` or like so:`instanceOfDiscoverCreator.copyWith.fieldName(...)`.
  _$DiscoverCreatorCWProxy get copyWith => _$DiscoverCreatorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverCreator _$DiscoverCreatorFromJson(Map<String, dynamic> json) =>
    DiscoverCreator(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      title: json['title'] as String?,
    )..name = json['name'] as String?;

Map<String, dynamic> _$DiscoverCreatorToJson(DiscoverCreator instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'title': instance.title,
      'name': instance.name,
    };
