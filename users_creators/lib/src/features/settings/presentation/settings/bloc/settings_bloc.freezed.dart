// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function(Settings settings) editSettings,
    required TResult Function() getSettings,
    required TResult Function() deleteAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EditSettings value) editSettings,
    required TResult Function(_GetSettings value) getSettings,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;
}

/// @nodoc
abstract class _$$_LogOutCopyWith<$Res> {
  factory _$$_LogOutCopyWith(_$_LogOut value, $Res Function(_$_LogOut) then) =
      __$$_LogOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogOutCopyWithImpl<$Res> extends _$SettingsEventCopyWithImpl<$Res>
    implements _$$_LogOutCopyWith<$Res> {
  __$$_LogOutCopyWithImpl(_$_LogOut _value, $Res Function(_$_LogOut) _then)
      : super(_value, (v) => _then(v as _$_LogOut));

  @override
  _$_LogOut get _value => super._value as _$_LogOut;
}

/// @nodoc

class _$_LogOut implements _LogOut {
  const _$_LogOut();

  @override
  String toString() {
    return 'SettingsEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function(Settings settings) editSettings,
    required TResult Function() getSettings,
    required TResult Function() deleteAccount,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EditSettings value) editSettings,
    required TResult Function(_GetSettings value) getSettings,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOut implements SettingsEvent {
  const factory _LogOut() = _$_LogOut;
}

/// @nodoc
abstract class _$$_EditSettingsCopyWith<$Res> {
  factory _$$_EditSettingsCopyWith(
          _$_EditSettings value, $Res Function(_$_EditSettings) then) =
      __$$_EditSettingsCopyWithImpl<$Res>;
  $Res call({Settings settings});
}

/// @nodoc
class __$$_EditSettingsCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$$_EditSettingsCopyWith<$Res> {
  __$$_EditSettingsCopyWithImpl(
      _$_EditSettings _value, $Res Function(_$_EditSettings) _then)
      : super(_value, (v) => _then(v as _$_EditSettings));

  @override
  _$_EditSettings get _value => super._value as _$_EditSettings;

  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_$_EditSettings(
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ));
  }
}

/// @nodoc

class _$_EditSettings implements _EditSettings {
  const _$_EditSettings({required this.settings});

  @override
  final Settings settings;

  @override
  String toString() {
    return 'SettingsEvent.editSettings(settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditSettings &&
            const DeepCollectionEquality().equals(other.settings, settings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(settings));

  @JsonKey(ignore: true)
  @override
  _$$_EditSettingsCopyWith<_$_EditSettings> get copyWith =>
      __$$_EditSettingsCopyWithImpl<_$_EditSettings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function(Settings settings) editSettings,
    required TResult Function() getSettings,
    required TResult Function() deleteAccount,
  }) {
    return editSettings(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
  }) {
    return editSettings?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
    required TResult orElse(),
  }) {
    if (editSettings != null) {
      return editSettings(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EditSettings value) editSettings,
    required TResult Function(_GetSettings value) getSettings,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) {
    return editSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
  }) {
    return editSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) {
    if (editSettings != null) {
      return editSettings(this);
    }
    return orElse();
  }
}

abstract class _EditSettings implements SettingsEvent {
  const factory _EditSettings({required final Settings settings}) =
      _$_EditSettings;

  Settings get settings;
  @JsonKey(ignore: true)
  _$$_EditSettingsCopyWith<_$_EditSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetSettingsCopyWith<$Res> {
  factory _$$_GetSettingsCopyWith(
          _$_GetSettings value, $Res Function(_$_GetSettings) then) =
      __$$_GetSettingsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetSettingsCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$$_GetSettingsCopyWith<$Res> {
  __$$_GetSettingsCopyWithImpl(
      _$_GetSettings _value, $Res Function(_$_GetSettings) _then)
      : super(_value, (v) => _then(v as _$_GetSettings));

  @override
  _$_GetSettings get _value => super._value as _$_GetSettings;
}

/// @nodoc

class _$_GetSettings implements _GetSettings {
  const _$_GetSettings();

  @override
  String toString() {
    return 'SettingsEvent.getSettings()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetSettings);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function(Settings settings) editSettings,
    required TResult Function() getSettings,
    required TResult Function() deleteAccount,
  }) {
    return getSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
  }) {
    return getSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
    required TResult orElse(),
  }) {
    if (getSettings != null) {
      return getSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EditSettings value) editSettings,
    required TResult Function(_GetSettings value) getSettings,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) {
    return getSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
  }) {
    return getSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) {
    if (getSettings != null) {
      return getSettings(this);
    }
    return orElse();
  }
}

abstract class _GetSettings implements SettingsEvent {
  const factory _GetSettings() = _$_GetSettings;
}

/// @nodoc
abstract class _$$_DeleteAccountCopyWith<$Res> {
  factory _$$_DeleteAccountCopyWith(
          _$_DeleteAccount value, $Res Function(_$_DeleteAccount) then) =
      __$$_DeleteAccountCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteAccountCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$$_DeleteAccountCopyWith<$Res> {
  __$$_DeleteAccountCopyWithImpl(
      _$_DeleteAccount _value, $Res Function(_$_DeleteAccount) _then)
      : super(_value, (v) => _then(v as _$_DeleteAccount));

  @override
  _$_DeleteAccount get _value => super._value as _$_DeleteAccount;
}

/// @nodoc

class _$_DeleteAccount implements _DeleteAccount {
  const _$_DeleteAccount();

  @override
  String toString() {
    return 'SettingsEvent.deleteAccount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeleteAccount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function(Settings settings) editSettings,
    required TResult Function() getSettings,
    required TResult Function() deleteAccount,
  }) {
    return deleteAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
  }) {
    return deleteAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function(Settings settings)? editSettings,
    TResult Function()? getSettings,
    TResult Function()? deleteAccount,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EditSettings value) editSettings,
    required TResult Function(_GetSettings value) getSettings,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) {
    return deleteAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
  }) {
    return deleteAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EditSettings value)? editSettings,
    TResult Function(_GetSettings value)? getSettings,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount(this);
    }
    return orElse();
  }
}

abstract class _DeleteAccount implements SettingsEvent {
  const factory _DeleteAccount() = _$_DeleteAccount;
}

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Settings settings) initial,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Settings settings)? initial,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Settings settings)? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  $Res call({Settings settings});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;

  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_$Initial(
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({required this.settings});

  @override
  final Settings settings;

  @override
  String toString() {
    return 'SettingsState.initial(settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            const DeepCollectionEquality().equals(other.settings, settings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(settings));

  @JsonKey(ignore: true)
  @override
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Settings settings) initial,
    required TResult Function() loading,
  }) {
    return initial(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Settings settings)? initial,
    TResult Function()? loading,
  }) {
    return initial?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Settings settings)? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SettingsState {
  const factory Initial({required final Settings settings}) = _$Initial;

  Settings get settings;
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, (v) => _then(v as _$Loading));

  @override
  _$Loading get _value => super._value as _$Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'SettingsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Settings settings) initial,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Settings settings)? initial,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Settings settings)? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SettingsState {
  const factory Loading() = _$Loading;
}
