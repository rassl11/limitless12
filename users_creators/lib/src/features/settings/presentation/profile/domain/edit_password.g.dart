// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_password.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EditPasswordCWProxy {
  EditPassword confirmPassword(String? confirmPassword);

  EditPassword newPassword(String? newPassword);

  EditPassword password(String? password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditPassword(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditPassword(...).copyWith(id: 12, name: "My name")
  /// ````
  EditPassword call({
    String? confirmPassword,
    String? newPassword,
    String? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEditPassword.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEditPassword.copyWith.fieldName(...)`
class _$EditPasswordCWProxyImpl implements _$EditPasswordCWProxy {
  final EditPassword _value;

  const _$EditPasswordCWProxyImpl(this._value);

  @override
  EditPassword confirmPassword(String? confirmPassword) =>
      this(confirmPassword: confirmPassword);

  @override
  EditPassword newPassword(String? newPassword) =>
      this(newPassword: newPassword);

  @override
  EditPassword password(String? password) => this(password: password);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditPassword(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditPassword(...).copyWith(id: 12, name: "My name")
  /// ````
  EditPassword call({
    Object? confirmPassword = const $CopyWithPlaceholder(),
    Object? newPassword = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return EditPassword(
      confirmPassword: confirmPassword == const $CopyWithPlaceholder()
          ? _value.confirmPassword
          // ignore: cast_nullable_to_non_nullable
          : confirmPassword as String?,
      newPassword: newPassword == const $CopyWithPlaceholder()
          ? _value.newPassword
          // ignore: cast_nullable_to_non_nullable
          : newPassword as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
    );
  }
}

extension $EditPasswordCopyWith on EditPassword {
  /// Returns a callable class that can be used as follows: `instanceOfEditPassword.copyWith(...)` or like so:`instanceOfEditPassword.copyWith.fieldName(...)`.
  _$EditPasswordCWProxy get copyWith => _$EditPasswordCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPassword _$EditPasswordFromJson(Map<String, dynamic> json) => EditPassword(
      password: json['password'] as String?,
      newPassword: json['newPassword'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$EditPasswordToJson(EditPassword instance) =>
    <String, dynamic>{
      'password': instance.password,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
    };
