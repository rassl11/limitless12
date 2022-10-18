// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) getSessions,
    required TResult Function(String sessionId) deleteSession,
    required TResult Function(String sessionId, DateTime dateTime) copySession,
    required TResult Function(String sessionId, DateTime dateTime) move,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSessions value) getSessions,
    required TResult Function(_Delete value) deleteSession,
    required TResult Function(_Copy value) copySession,
    required TResult Function(_Move value) move,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEventCopyWith<$Res> {
  factory $SessionEventCopyWith(
          SessionEvent value, $Res Function(SessionEvent) then) =
      _$SessionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SessionEventCopyWithImpl<$Res> implements $SessionEventCopyWith<$Res> {
  _$SessionEventCopyWithImpl(this._value, this._then);

  final SessionEvent _value;
  // ignore: unused_field
  final $Res Function(SessionEvent) _then;
}

/// @nodoc
abstract class _$$_GetSessionsCopyWith<$Res> {
  factory _$$_GetSessionsCopyWith(
          _$_GetSessions value, $Res Function(_$_GetSessions) then) =
      __$$_GetSessionsCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$$_GetSessionsCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_GetSessionsCopyWith<$Res> {
  __$$_GetSessionsCopyWithImpl(
      _$_GetSessions _value, $Res Function(_$_GetSessions) _then)
      : super(_value, (v) => _then(v as _$_GetSessions));

  @override
  _$_GetSessions get _value => super._value as _$_GetSessions;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$_GetSessions(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_GetSessions implements _GetSessions {
  const _$_GetSessions({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'SessionEvent.getSessions(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSessions &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_GetSessionsCopyWith<_$_GetSessions> get copyWith =>
      __$$_GetSessionsCopyWithImpl<_$_GetSessions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) getSessions,
    required TResult Function(String sessionId) deleteSession,
    required TResult Function(String sessionId, DateTime dateTime) copySession,
    required TResult Function(String sessionId, DateTime dateTime) move,
  }) {
    return getSessions(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
  }) {
    return getSessions?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
    required TResult orElse(),
  }) {
    if (getSessions != null) {
      return getSessions(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSessions value) getSessions,
    required TResult Function(_Delete value) deleteSession,
    required TResult Function(_Copy value) copySession,
    required TResult Function(_Move value) move,
  }) {
    return getSessions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
  }) {
    return getSessions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
    required TResult orElse(),
  }) {
    if (getSessions != null) {
      return getSessions(this);
    }
    return orElse();
  }
}

abstract class _GetSessions implements SessionEvent {
  const factory _GetSessions({required final DateTime date}) = _$_GetSessions;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$_GetSessionsCopyWith<_$_GetSessions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteCopyWith<$Res> {
  factory _$$_DeleteCopyWith(_$_Delete value, $Res Function(_$_Delete) then) =
      __$$_DeleteCopyWithImpl<$Res>;
  $Res call({String sessionId});
}

/// @nodoc
class __$$_DeleteCopyWithImpl<$Res> extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_DeleteCopyWith<$Res> {
  __$$_DeleteCopyWithImpl(_$_Delete _value, $Res Function(_$_Delete) _then)
      : super(_value, (v) => _then(v as _$_Delete));

  @override
  _$_Delete get _value => super._value as _$_Delete;

  @override
  $Res call({
    Object? sessionId = freezed,
  }) {
    return _then(_$_Delete(
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete({required this.sessionId});

  @override
  final String sessionId;

  @override
  String toString() {
    return 'SessionEvent.deleteSession(sessionId: $sessionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delete &&
            const DeepCollectionEquality().equals(other.sessionId, sessionId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sessionId));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      __$$_DeleteCopyWithImpl<_$_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) getSessions,
    required TResult Function(String sessionId) deleteSession,
    required TResult Function(String sessionId, DateTime dateTime) copySession,
    required TResult Function(String sessionId, DateTime dateTime) move,
  }) {
    return deleteSession(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
  }) {
    return deleteSession?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
    required TResult orElse(),
  }) {
    if (deleteSession != null) {
      return deleteSession(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSessions value) getSessions,
    required TResult Function(_Delete value) deleteSession,
    required TResult Function(_Copy value) copySession,
    required TResult Function(_Move value) move,
  }) {
    return deleteSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
  }) {
    return deleteSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
    required TResult orElse(),
  }) {
    if (deleteSession != null) {
      return deleteSession(this);
    }
    return orElse();
  }
}

abstract class _Delete implements SessionEvent {
  const factory _Delete({required final String sessionId}) = _$_Delete;

  String get sessionId;
  @JsonKey(ignore: true)
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CopyCopyWith<$Res> {
  factory _$$_CopyCopyWith(_$_Copy value, $Res Function(_$_Copy) then) =
      __$$_CopyCopyWithImpl<$Res>;
  $Res call({String sessionId, DateTime dateTime});
}

/// @nodoc
class __$$_CopyCopyWithImpl<$Res> extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_CopyCopyWith<$Res> {
  __$$_CopyCopyWithImpl(_$_Copy _value, $Res Function(_$_Copy) _then)
      : super(_value, (v) => _then(v as _$_Copy));

  @override
  _$_Copy get _value => super._value as _$_Copy;

  @override
  $Res call({
    Object? sessionId = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$_Copy(
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Copy implements _Copy {
  const _$_Copy({required this.sessionId, required this.dateTime});

  @override
  final String sessionId;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'SessionEvent.copySession(sessionId: $sessionId, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Copy &&
            const DeepCollectionEquality().equals(other.sessionId, sessionId) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sessionId),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$$_CopyCopyWith<_$_Copy> get copyWith =>
      __$$_CopyCopyWithImpl<_$_Copy>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) getSessions,
    required TResult Function(String sessionId) deleteSession,
    required TResult Function(String sessionId, DateTime dateTime) copySession,
    required TResult Function(String sessionId, DateTime dateTime) move,
  }) {
    return copySession(sessionId, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
  }) {
    return copySession?.call(sessionId, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
    required TResult orElse(),
  }) {
    if (copySession != null) {
      return copySession(sessionId, dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSessions value) getSessions,
    required TResult Function(_Delete value) deleteSession,
    required TResult Function(_Copy value) copySession,
    required TResult Function(_Move value) move,
  }) {
    return copySession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
  }) {
    return copySession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
    required TResult orElse(),
  }) {
    if (copySession != null) {
      return copySession(this);
    }
    return orElse();
  }
}

abstract class _Copy implements SessionEvent {
  const factory _Copy(
      {required final String sessionId,
      required final DateTime dateTime}) = _$_Copy;

  String get sessionId;
  DateTime get dateTime;
  @JsonKey(ignore: true)
  _$$_CopyCopyWith<_$_Copy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MoveCopyWith<$Res> {
  factory _$$_MoveCopyWith(_$_Move value, $Res Function(_$_Move) then) =
      __$$_MoveCopyWithImpl<$Res>;
  $Res call({String sessionId, DateTime dateTime});
}

/// @nodoc
class __$$_MoveCopyWithImpl<$Res> extends _$SessionEventCopyWithImpl<$Res>
    implements _$$_MoveCopyWith<$Res> {
  __$$_MoveCopyWithImpl(_$_Move _value, $Res Function(_$_Move) _then)
      : super(_value, (v) => _then(v as _$_Move));

  @override
  _$_Move get _value => super._value as _$_Move;

  @override
  $Res call({
    Object? sessionId = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$_Move(
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Move implements _Move {
  const _$_Move({required this.sessionId, required this.dateTime});

  @override
  final String sessionId;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'SessionEvent.move(sessionId: $sessionId, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Move &&
            const DeepCollectionEquality().equals(other.sessionId, sessionId) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sessionId),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$$_MoveCopyWith<_$_Move> get copyWith =>
      __$$_MoveCopyWithImpl<_$_Move>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) getSessions,
    required TResult Function(String sessionId) deleteSession,
    required TResult Function(String sessionId, DateTime dateTime) copySession,
    required TResult Function(String sessionId, DateTime dateTime) move,
  }) {
    return move(sessionId, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
  }) {
    return move?.call(sessionId, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? getSessions,
    TResult Function(String sessionId)? deleteSession,
    TResult Function(String sessionId, DateTime dateTime)? copySession,
    TResult Function(String sessionId, DateTime dateTime)? move,
    required TResult orElse(),
  }) {
    if (move != null) {
      return move(sessionId, dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSessions value) getSessions,
    required TResult Function(_Delete value) deleteSession,
    required TResult Function(_Copy value) copySession,
    required TResult Function(_Move value) move,
  }) {
    return move(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
  }) {
    return move?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSessions value)? getSessions,
    TResult Function(_Delete value)? deleteSession,
    TResult Function(_Copy value)? copySession,
    TResult Function(_Move value)? move,
    required TResult orElse(),
  }) {
    if (move != null) {
      return move(this);
    }
    return orElse();
  }
}

abstract class _Move implements SessionEvent {
  const factory _Move(
      {required final String sessionId,
      required final DateTime dateTime}) = _$_Move;

  String get sessionId;
  DateTime get dateTime;
  @JsonKey(ignore: true)
  _$$_MoveCopyWith<_$_Move> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSubscribed,
    required TResult Function() haveNoSession,
    required TResult Function(List<Session> sessions) haveSession,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSubscibed value) notSubscribed,
    required TResult Function(HaveNoSession value) haveNoSession,
    required TResult Function(HaveSessions value) haveSession,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res> implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  final SessionState _value;
  // ignore: unused_field
  final $Res Function(SessionState) _then;
}

/// @nodoc
abstract class _$$NotSubscibedCopyWith<$Res> {
  factory _$$NotSubscibedCopyWith(
          _$NotSubscibed value, $Res Function(_$NotSubscibed) then) =
      __$$NotSubscibedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotSubscibedCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res>
    implements _$$NotSubscibedCopyWith<$Res> {
  __$$NotSubscibedCopyWithImpl(
      _$NotSubscibed _value, $Res Function(_$NotSubscibed) _then)
      : super(_value, (v) => _then(v as _$NotSubscibed));

  @override
  _$NotSubscibed get _value => super._value as _$NotSubscibed;
}

/// @nodoc

class _$NotSubscibed implements NotSubscibed {
  const _$NotSubscibed();

  @override
  String toString() {
    return 'SessionState.notSubscribed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotSubscibed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSubscribed,
    required TResult Function() haveNoSession,
    required TResult Function(List<Session> sessions) haveSession,
    required TResult Function() loading,
  }) {
    return notSubscribed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
    TResult Function()? loading,
  }) {
    return notSubscribed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (notSubscribed != null) {
      return notSubscribed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSubscibed value) notSubscribed,
    required TResult Function(HaveNoSession value) haveNoSession,
    required TResult Function(HaveSessions value) haveSession,
    required TResult Function(Loading value) loading,
  }) {
    return notSubscribed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
  }) {
    return notSubscribed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (notSubscribed != null) {
      return notSubscribed(this);
    }
    return orElse();
  }
}

abstract class NotSubscibed implements SessionState {
  const factory NotSubscibed() = _$NotSubscibed;
}

/// @nodoc
abstract class _$$HaveNoSessionCopyWith<$Res> {
  factory _$$HaveNoSessionCopyWith(
          _$HaveNoSession value, $Res Function(_$HaveNoSession) then) =
      __$$HaveNoSessionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HaveNoSessionCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res>
    implements _$$HaveNoSessionCopyWith<$Res> {
  __$$HaveNoSessionCopyWithImpl(
      _$HaveNoSession _value, $Res Function(_$HaveNoSession) _then)
      : super(_value, (v) => _then(v as _$HaveNoSession));

  @override
  _$HaveNoSession get _value => super._value as _$HaveNoSession;
}

/// @nodoc

class _$HaveNoSession implements HaveNoSession {
  const _$HaveNoSession();

  @override
  String toString() {
    return 'SessionState.haveNoSession()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HaveNoSession);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSubscribed,
    required TResult Function() haveNoSession,
    required TResult Function(List<Session> sessions) haveSession,
    required TResult Function() loading,
  }) {
    return haveNoSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
    TResult Function()? loading,
  }) {
    return haveNoSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (haveNoSession != null) {
      return haveNoSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSubscibed value) notSubscribed,
    required TResult Function(HaveNoSession value) haveNoSession,
    required TResult Function(HaveSessions value) haveSession,
    required TResult Function(Loading value) loading,
  }) {
    return haveNoSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
  }) {
    return haveNoSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (haveNoSession != null) {
      return haveNoSession(this);
    }
    return orElse();
  }
}

abstract class HaveNoSession implements SessionState {
  const factory HaveNoSession() = _$HaveNoSession;
}

/// @nodoc
abstract class _$$HaveSessionsCopyWith<$Res> {
  factory _$$HaveSessionsCopyWith(
          _$HaveSessions value, $Res Function(_$HaveSessions) then) =
      __$$HaveSessionsCopyWithImpl<$Res>;
  $Res call({List<Session> sessions});
}

/// @nodoc
class __$$HaveSessionsCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res>
    implements _$$HaveSessionsCopyWith<$Res> {
  __$$HaveSessionsCopyWithImpl(
      _$HaveSessions _value, $Res Function(_$HaveSessions) _then)
      : super(_value, (v) => _then(v as _$HaveSessions));

  @override
  _$HaveSessions get _value => super._value as _$HaveSessions;

  @override
  $Res call({
    Object? sessions = freezed,
  }) {
    return _then(_$HaveSessions(
      sessions: sessions == freezed
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc

class _$HaveSessions implements HaveSessions {
  const _$HaveSessions({required final List<Session> sessions})
      : _sessions = sessions;

  final List<Session> _sessions;
  @override
  List<Session> get sessions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  String toString() {
    return 'SessionState.haveSession(sessions: $sessions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HaveSessions &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sessions));

  @JsonKey(ignore: true)
  @override
  _$$HaveSessionsCopyWith<_$HaveSessions> get copyWith =>
      __$$HaveSessionsCopyWithImpl<_$HaveSessions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notSubscribed,
    required TResult Function() haveNoSession,
    required TResult Function(List<Session> sessions) haveSession,
    required TResult Function() loading,
  }) {
    return haveSession(sessions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
    TResult Function()? loading,
  }) {
    return haveSession?.call(sessions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (haveSession != null) {
      return haveSession(sessions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotSubscibed value) notSubscribed,
    required TResult Function(HaveNoSession value) haveNoSession,
    required TResult Function(HaveSessions value) haveSession,
    required TResult Function(Loading value) loading,
  }) {
    return haveSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
  }) {
    return haveSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (haveSession != null) {
      return haveSession(this);
    }
    return orElse();
  }
}

abstract class HaveSessions implements SessionState {
  const factory HaveSessions({required final List<Session> sessions}) =
      _$HaveSessions;

  List<Session> get sessions;
  @JsonKey(ignore: true)
  _$$HaveSessionsCopyWith<_$HaveSessions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res> extends _$SessionStateCopyWithImpl<$Res>
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
    return 'SessionState.loading()';
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
    required TResult Function() notSubscribed,
    required TResult Function() haveNoSession,
    required TResult Function(List<Session> sessions) haveSession,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notSubscribed,
    TResult Function()? haveNoSession,
    TResult Function(List<Session> sessions)? haveSession,
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
    required TResult Function(NotSubscibed value) notSubscribed,
    required TResult Function(HaveNoSession value) haveNoSession,
    required TResult Function(HaveSessions value) haveSession,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotSubscibed value)? notSubscribed,
    TResult Function(HaveNoSession value)? haveNoSession,
    TResult Function(HaveSessions value)? haveSession,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SessionState {
  const factory Loading() = _$Loading;
}
