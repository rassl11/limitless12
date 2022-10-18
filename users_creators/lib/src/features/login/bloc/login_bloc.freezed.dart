// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserLogin userLogin) login,
    required TResult Function(UserSignUp userSignUp) signup,
    required TResult Function(String email) resetPassword,
    required TResult Function(String email, String code) verify,
    required TResult Function(
            String email, String password, String confirmPassword)
        setNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signup,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetNewPassword value) setNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res> implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  final LoginEvent _value;
  // ignore: unused_field
  final $Res Function(LoginEvent) _then;
}

/// @nodoc
abstract class _$$_LoginCopyWith<$Res> {
  factory _$$_LoginCopyWith(_$_Login value, $Res Function(_$_Login) then) =
      __$$_LoginCopyWithImpl<$Res>;
  $Res call({UserLogin userLogin});
}

/// @nodoc
class __$$_LoginCopyWithImpl<$Res> extends _$LoginEventCopyWithImpl<$Res>
    implements _$$_LoginCopyWith<$Res> {
  __$$_LoginCopyWithImpl(_$_Login _value, $Res Function(_$_Login) _then)
      : super(_value, (v) => _then(v as _$_Login));

  @override
  _$_Login get _value => super._value as _$_Login;

  @override
  $Res call({
    Object? userLogin = freezed,
  }) {
    return _then(_$_Login(
      userLogin: userLogin == freezed
          ? _value.userLogin
          : userLogin // ignore: cast_nullable_to_non_nullable
              as UserLogin,
    ));
  }
}

/// @nodoc

class _$_Login implements _Login {
  const _$_Login({required this.userLogin});

  @override
  final UserLogin userLogin;

  @override
  String toString() {
    return 'LoginEvent.login(userLogin: $userLogin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Login &&
            const DeepCollectionEquality().equals(other.userLogin, userLogin));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userLogin));

  @JsonKey(ignore: true)
  @override
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      __$$_LoginCopyWithImpl<_$_Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserLogin userLogin) login,
    required TResult Function(UserSignUp userSignUp) signup,
    required TResult Function(String email) resetPassword,
    required TResult Function(String email, String code) verify,
    required TResult Function(
            String email, String password, String confirmPassword)
        setNewPassword,
  }) {
    return login(userLogin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
  }) {
    return login?.call(userLogin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(userLogin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signup,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetNewPassword value) setNewPassword,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements LoginEvent {
  const factory _Login({required final UserLogin userLogin}) = _$_Login;

  UserLogin get userLogin;
  @JsonKey(ignore: true)
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignUpCopyWith<$Res> {
  factory _$$_SignUpCopyWith(_$_SignUp value, $Res Function(_$_SignUp) then) =
      __$$_SignUpCopyWithImpl<$Res>;
  $Res call({UserSignUp userSignUp});
}

/// @nodoc
class __$$_SignUpCopyWithImpl<$Res> extends _$LoginEventCopyWithImpl<$Res>
    implements _$$_SignUpCopyWith<$Res> {
  __$$_SignUpCopyWithImpl(_$_SignUp _value, $Res Function(_$_SignUp) _then)
      : super(_value, (v) => _then(v as _$_SignUp));

  @override
  _$_SignUp get _value => super._value as _$_SignUp;

  @override
  $Res call({
    Object? userSignUp = freezed,
  }) {
    return _then(_$_SignUp(
      userSignUp: userSignUp == freezed
          ? _value.userSignUp
          : userSignUp // ignore: cast_nullable_to_non_nullable
              as UserSignUp,
    ));
  }
}

/// @nodoc

class _$_SignUp implements _SignUp {
  const _$_SignUp({required this.userSignUp});

  @override
  final UserSignUp userSignUp;

  @override
  String toString() {
    return 'LoginEvent.signup(userSignUp: $userSignUp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUp &&
            const DeepCollectionEquality()
                .equals(other.userSignUp, userSignUp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userSignUp));

  @JsonKey(ignore: true)
  @override
  _$$_SignUpCopyWith<_$_SignUp> get copyWith =>
      __$$_SignUpCopyWithImpl<_$_SignUp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserLogin userLogin) login,
    required TResult Function(UserSignUp userSignUp) signup,
    required TResult Function(String email) resetPassword,
    required TResult Function(String email, String code) verify,
    required TResult Function(
            String email, String password, String confirmPassword)
        setNewPassword,
  }) {
    return signup(userSignUp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
  }) {
    return signup?.call(userSignUp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(userSignUp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signup,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetNewPassword value) setNewPassword,
  }) {
    return signup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
  }) {
    return signup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements LoginEvent {
  const factory _SignUp({required final UserSignUp userSignUp}) = _$_SignUp;

  UserSignUp get userSignUp;
  @JsonKey(ignore: true)
  _$$_SignUpCopyWith<_$_SignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetPasswordCopyWith<$Res> {
  factory _$$_ResetPasswordCopyWith(
          _$_ResetPassword value, $Res Function(_$_ResetPassword) then) =
      __$$_ResetPasswordCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$$_ResetPasswordCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements _$$_ResetPasswordCopyWith<$Res> {
  __$$_ResetPasswordCopyWithImpl(
      _$_ResetPassword _value, $Res Function(_$_ResetPassword) _then)
      : super(_value, (v) => _then(v as _$_ResetPassword));

  @override
  _$_ResetPassword get _value => super._value as _$_ResetPassword;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$_ResetPassword(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResetPassword implements _ResetPassword {
  const _$_ResetPassword({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.resetPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPassword &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      __$$_ResetPasswordCopyWithImpl<_$_ResetPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserLogin userLogin) login,
    required TResult Function(UserSignUp userSignUp) signup,
    required TResult Function(String email) resetPassword,
    required TResult Function(String email, String code) verify,
    required TResult Function(
            String email, String password, String confirmPassword)
        setNewPassword,
  }) {
    return resetPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
  }) {
    return resetPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signup,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetNewPassword value) setNewPassword,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements LoginEvent {
  const factory _ResetPassword({required final String email}) =
      _$_ResetPassword;

  String get email;
  @JsonKey(ignore: true)
  _$$_ResetPasswordCopyWith<_$_ResetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyCopyWith<$Res> {
  factory _$$_VerifyCopyWith(_$_Verify value, $Res Function(_$_Verify) then) =
      __$$_VerifyCopyWithImpl<$Res>;
  $Res call({String email, String code});
}

/// @nodoc
class __$$_VerifyCopyWithImpl<$Res> extends _$LoginEventCopyWithImpl<$Res>
    implements _$$_VerifyCopyWith<$Res> {
  __$$_VerifyCopyWithImpl(_$_Verify _value, $Res Function(_$_Verify) _then)
      : super(_value, (v) => _then(v as _$_Verify));

  @override
  _$_Verify get _value => super._value as _$_Verify;

  @override
  $Res call({
    Object? email = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Verify(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Verify implements _Verify {
  const _$_Verify({required this.email, required this.code});

  @override
  final String email;
  @override
  final String code;

  @override
  String toString() {
    return 'LoginEvent.verify(email: $email, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Verify &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$$_VerifyCopyWith<_$_Verify> get copyWith =>
      __$$_VerifyCopyWithImpl<_$_Verify>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserLogin userLogin) login,
    required TResult Function(UserSignUp userSignUp) signup,
    required TResult Function(String email) resetPassword,
    required TResult Function(String email, String code) verify,
    required TResult Function(
            String email, String password, String confirmPassword)
        setNewPassword,
  }) {
    return verify(email, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
  }) {
    return verify?.call(email, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(email, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signup,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetNewPassword value) setNewPassword,
  }) {
    return verify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
  }) {
    return verify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(this);
    }
    return orElse();
  }
}

abstract class _Verify implements LoginEvent {
  const factory _Verify(
      {required final String email, required final String code}) = _$_Verify;

  String get email;
  String get code;
  @JsonKey(ignore: true)
  _$$_VerifyCopyWith<_$_Verify> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetNewPasswordCopyWith<$Res> {
  factory _$$_SetNewPasswordCopyWith(
          _$_SetNewPassword value, $Res Function(_$_SetNewPassword) then) =
      __$$_SetNewPasswordCopyWithImpl<$Res>;
  $Res call({String email, String password, String confirmPassword});
}

/// @nodoc
class __$$_SetNewPasswordCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements _$$_SetNewPasswordCopyWith<$Res> {
  __$$_SetNewPasswordCopyWithImpl(
      _$_SetNewPassword _value, $Res Function(_$_SetNewPassword) _then)
      : super(_value, (v) => _then(v as _$_SetNewPassword));

  @override
  _$_SetNewPassword get _value => super._value as _$_SetNewPassword;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
  }) {
    return _then(_$_SetNewPassword(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetNewPassword implements _SetNewPassword {
  const _$_SetNewPassword(
      {required this.email,
      required this.password,
      required this.confirmPassword});

  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'LoginEvent.setNewPassword(email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetNewPassword &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(confirmPassword));

  @JsonKey(ignore: true)
  @override
  _$$_SetNewPasswordCopyWith<_$_SetNewPassword> get copyWith =>
      __$$_SetNewPasswordCopyWithImpl<_$_SetNewPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserLogin userLogin) login,
    required TResult Function(UserSignUp userSignUp) signup,
    required TResult Function(String email) resetPassword,
    required TResult Function(String email, String code) verify,
    required TResult Function(
            String email, String password, String confirmPassword)
        setNewPassword,
  }) {
    return setNewPassword(email, password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
  }) {
    return setNewPassword?.call(email, password, confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserLogin userLogin)? login,
    TResult Function(UserSignUp userSignUp)? signup,
    TResult Function(String email)? resetPassword,
    TResult Function(String email, String code)? verify,
    TResult Function(String email, String password, String confirmPassword)?
        setNewPassword,
    required TResult orElse(),
  }) {
    if (setNewPassword != null) {
      return setNewPassword(email, password, confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_SignUp value) signup,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_Verify value) verify,
    required TResult Function(_SetNewPassword value) setNewPassword,
  }) {
    return setNewPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
  }) {
    return setNewPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_SignUp value)? signup,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_Verify value)? verify,
    TResult Function(_SetNewPassword value)? setNewPassword,
    required TResult orElse(),
  }) {
    if (setNewPassword != null) {
      return setNewPassword(this);
    }
    return orElse();
  }
}

abstract class _SetNewPassword implements LoginEvent {
  const factory _SetNewPassword(
      {required final String email,
      required final String password,
      required final String confirmPassword}) = _$_SetNewPassword;

  String get email;
  String get password;
  String get confirmPassword;
  @JsonKey(ignore: true)
  _$$_SetNewPasswordCopyWith<_$_SetNewPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, bool hasErrors) initial,
    required TResult Function() signedIn,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, bool hasErrors)? initial,
    TResult Function()? signedIn,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, bool hasErrors)? initial,
    TResult Function()? signedIn,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignedIn value)? signedIn,
    TResult Function(Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignedIn value)? signedIn,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  $Res call({String email, bool hasErrors});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;

  @override
  $Res call({
    Object? email = freezed,
    Object? hasErrors = freezed,
  }) {
    return _then(_$Initial(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      hasErrors: hasErrors == freezed
          ? _value.hasErrors
          : hasErrors // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({required this.email, required this.hasErrors});

  @override
  final String email;
  @override
  final bool hasErrors;

  @override
  String toString() {
    return 'LoginState.initial(email: $email, hasErrors: $hasErrors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.hasErrors, hasErrors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(hasErrors));

  @JsonKey(ignore: true)
  @override
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, bool hasErrors) initial,
    required TResult Function() signedIn,
    required TResult Function() loading,
  }) {
    return initial(email, hasErrors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, bool hasErrors)? initial,
    TResult Function()? signedIn,
    TResult Function()? loading,
  }) {
    return initial?.call(email, hasErrors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, bool hasErrors)? initial,
    TResult Function()? signedIn,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(email, hasErrors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignedIn value)? signedIn,
    TResult Function(Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignedIn value)? signedIn,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements LoginState {
  const factory Initial(
      {required final String email, required final bool hasErrors}) = _$Initial;

  String get email;
  bool get hasErrors;
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignedInCopyWith<$Res> {
  factory _$$SignedInCopyWith(
          _$SignedIn value, $Res Function(_$SignedIn) then) =
      __$$SignedInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignedInCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$SignedInCopyWith<$Res> {
  __$$SignedInCopyWithImpl(_$SignedIn _value, $Res Function(_$SignedIn) _then)
      : super(_value, (v) => _then(v as _$SignedIn));

  @override
  _$SignedIn get _value => super._value as _$SignedIn;
}

/// @nodoc

class _$SignedIn implements SignedIn {
  const _$SignedIn();

  @override
  String toString() {
    return 'LoginState.signedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, bool hasErrors) initial,
    required TResult Function() signedIn,
    required TResult Function() loading,
  }) {
    return signedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, bool hasErrors)? initial,
    TResult Function()? signedIn,
    TResult Function()? loading,
  }) {
    return signedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, bool hasErrors)? initial,
    TResult Function()? signedIn,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(Loading value) loading,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignedIn value)? signedIn,
    TResult Function(Loading value)? loading,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignedIn value)? signedIn,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }
}

abstract class SignedIn implements LoginState {
  const factory SignedIn() = _$SignedIn;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
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
    return 'LoginState.loading()';
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
    required TResult Function(String email, bool hasErrors) initial,
    required TResult Function() signedIn,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, bool hasErrors)? initial,
    TResult Function()? signedIn,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, bool hasErrors)? initial,
    TResult Function()? signedIn,
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
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignedIn value)? signedIn,
    TResult Function(Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SignedIn value)? signedIn,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements LoginState {
  const factory Loading() = _$Loading;
}
