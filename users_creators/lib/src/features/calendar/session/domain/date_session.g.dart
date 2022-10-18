// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DateSessionCWProxy {
  DateSession creatorSessionsCount(int? creatorSessionsCount);

  DateSession date(String? date);

  DateSession mySessionsCount(int? mySessionsCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DateSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DateSession(...).copyWith(id: 12, name: "My name")
  /// ````
  DateSession call({
    int? creatorSessionsCount,
    String? date,
    int? mySessionsCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDateSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDateSession.copyWith.fieldName(...)`
class _$DateSessionCWProxyImpl implements _$DateSessionCWProxy {
  final DateSession _value;

  const _$DateSessionCWProxyImpl(this._value);

  @override
  DateSession creatorSessionsCount(int? creatorSessionsCount) =>
      this(creatorSessionsCount: creatorSessionsCount);

  @override
  DateSession date(String? date) => this(date: date);

  @override
  DateSession mySessionsCount(int? mySessionsCount) =>
      this(mySessionsCount: mySessionsCount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DateSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DateSession(...).copyWith(id: 12, name: "My name")
  /// ````
  DateSession call({
    Object? creatorSessionsCount = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? mySessionsCount = const $CopyWithPlaceholder(),
  }) {
    return DateSession(
      creatorSessionsCount: creatorSessionsCount == const $CopyWithPlaceholder()
          ? _value.creatorSessionsCount
          // ignore: cast_nullable_to_non_nullable
          : creatorSessionsCount as int?,
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String?,
      mySessionsCount: mySessionsCount == const $CopyWithPlaceholder()
          ? _value.mySessionsCount
          // ignore: cast_nullable_to_non_nullable
          : mySessionsCount as int?,
    );
  }
}

extension $DateSessionCopyWith on DateSession {
  /// Returns a callable class that can be used as follows: `instanceOfDateSession.copyWith(...)` or like so:`instanceOfDateSession.copyWith.fieldName(...)`.
  _$DateSessionCWProxy get copyWith => _$DateSessionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateSession _$DateSessionFromJson(Map<String, dynamic> json) => DateSession(
      date: json['date'] as String?,
      mySessionsCount: json['mySessionsCount'] as int?,
      creatorSessionsCount: json['creatorSessionsCount'] as int?,
    );

Map<String, dynamic> _$DateSessionToJson(DateSession instance) =>
    <String, dynamic>{
      'date': instance.date,
      'mySessionsCount': instance.mySessionsCount,
      'creatorSessionsCount': instance.creatorSessionsCount,
    };
