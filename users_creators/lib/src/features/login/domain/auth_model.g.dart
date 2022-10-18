// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthModelCWProxy {
  AuthModel accessToken(String? accessToken);

  AuthModel expires(String? expires);

  AuthModel expiresIn(int? expiresIn);

  AuthModel id(String id);

  AuthModel issued(String? issued);

  AuthModel language(String? language);

  AuthModel refreshToken(String? refreshToken);

  AuthModel role(String? role);

  AuthModel tokenType(String? tokenType);

  AuthModel userName(String? userName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthModel call({
    String? accessToken,
    String? expires,
    int? expiresIn,
    String? id,
    String? issued,
    String? language,
    String? refreshToken,
    String? role,
    String? tokenType,
    String? userName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthModel.copyWith.fieldName(...)`
class _$AuthModelCWProxyImpl implements _$AuthModelCWProxy {
  final AuthModel _value;

  const _$AuthModelCWProxyImpl(this._value);

  @override
  AuthModel accessToken(String? accessToken) => this(accessToken: accessToken);

  @override
  AuthModel expires(String? expires) => this(expires: expires);

  @override
  AuthModel expiresIn(int? expiresIn) => this(expiresIn: expiresIn);

  @override
  AuthModel id(String id) => this(id: id);

  @override
  AuthModel issued(String? issued) => this(issued: issued);

  @override
  AuthModel language(String? language) => this(language: language);

  @override
  AuthModel refreshToken(String? refreshToken) =>
      this(refreshToken: refreshToken);

  @override
  AuthModel role(String? role) => this(role: role);

  @override
  AuthModel tokenType(String? tokenType) => this(tokenType: tokenType);

  @override
  AuthModel userName(String? userName) => this(userName: userName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthModel call({
    Object? accessToken = const $CopyWithPlaceholder(),
    Object? expires = const $CopyWithPlaceholder(),
    Object? expiresIn = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? issued = const $CopyWithPlaceholder(),
    Object? language = const $CopyWithPlaceholder(),
    Object? refreshToken = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? tokenType = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
  }) {
    return AuthModel(
      accessToken: accessToken == const $CopyWithPlaceholder()
          ? _value.accessToken
          // ignore: cast_nullable_to_non_nullable
          : accessToken as String?,
      expires: expires == const $CopyWithPlaceholder()
          ? _value.expires
          // ignore: cast_nullable_to_non_nullable
          : expires as String?,
      expiresIn: expiresIn == const $CopyWithPlaceholder()
          ? _value.expiresIn
          // ignore: cast_nullable_to_non_nullable
          : expiresIn as int?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      issued: issued == const $CopyWithPlaceholder()
          ? _value.issued
          // ignore: cast_nullable_to_non_nullable
          : issued as String?,
      language: language == const $CopyWithPlaceholder()
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as String?,
      refreshToken: refreshToken == const $CopyWithPlaceholder()
          ? _value.refreshToken
          // ignore: cast_nullable_to_non_nullable
          : refreshToken as String?,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as String?,
      tokenType: tokenType == const $CopyWithPlaceholder()
          ? _value.tokenType
          // ignore: cast_nullable_to_non_nullable
          : tokenType as String?,
      userName: userName == const $CopyWithPlaceholder()
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String?,
    );
  }
}

extension $AuthModelCopyWith on AuthModel {
  /// Returns a callable class that can be used as follows: `instanceOfAuthModel.copyWith(...)` or like so:`instanceOfAuthModel.copyWith.fieldName(...)`.
  _$AuthModelCWProxy get copyWith => _$AuthModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      refreshToken: json['refreshToken'] as String?,
      language: json['language'] as String?,
      id: json['id'] as String,
      accessToken: json['accessToken'] as String?,
      tokenType: json['tokenType'] as String?,
      expiresIn: json['expiresIn'] as int?,
      userName: json['userName'] as String?,
      role: json['role'] as String?,
      issued: json['issued'] as String?,
      expires: json['expires'] as String?,
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'language': instance.language,
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'userName': instance.userName,
      'id': instance.id,
      'role': instance.role,
      'issued': instance.issued,
      'expires': instance.expires,
    };
