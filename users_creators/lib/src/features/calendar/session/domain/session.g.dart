// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SessionCWProxy {
  Session exercises(List<Exercise>? exercises);

  Session firstName(String? firstName);

  Session id(String? id);

  Session instructions(String? instructions);

  Session intensity(int? intensity);

  Session isArchived(bool? isArchived);

  Session isExecuted(bool? isExecuted);

  Session isMine(bool? isMine);

  Session lastName(String? lastName);

  Session name(String? name);

  Session restIntervalSec(int? restIntervalSec);

  Session userAvatarUrl(String? userAvatarUrl);

  Session userId(String? userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Session(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Session(...).copyWith(id: 12, name: "My name")
  /// ````
  Session call({
    List<Exercise>? exercises,
    String? firstName,
    String? id,
    String? instructions,
    int? intensity,
    bool? isArchived,
    bool? isExecuted,
    bool? isMine,
    String? lastName,
    String? name,
    int? restIntervalSec,
    String? userAvatarUrl,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSession.copyWith.fieldName(...)`
class _$SessionCWProxyImpl implements _$SessionCWProxy {
  final Session _value;

  const _$SessionCWProxyImpl(this._value);

  @override
  Session exercises(List<Exercise>? exercises) => this(exercises: exercises);

  @override
  Session firstName(String? firstName) => this(firstName: firstName);

  @override
  Session id(String? id) => this(id: id);

  @override
  Session instructions(String? instructions) =>
      this(instructions: instructions);

  @override
  Session intensity(int? intensity) => this(intensity: intensity);

  @override
  Session isArchived(bool? isArchived) => this(isArchived: isArchived);

  @override
  Session isExecuted(bool? isExecuted) => this(isExecuted: isExecuted);

  @override
  Session isMine(bool? isMine) => this(isMine: isMine);

  @override
  Session lastName(String? lastName) => this(lastName: lastName);

  @override
  Session name(String? name) => this(name: name);

  @override
  Session restIntervalSec(int? restIntervalSec) =>
      this(restIntervalSec: restIntervalSec);

  @override
  Session userAvatarUrl(String? userAvatarUrl) =>
      this(userAvatarUrl: userAvatarUrl);

  @override
  Session userId(String? userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Session(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Session(...).copyWith(id: 12, name: "My name")
  /// ````
  Session call({
    Object? exercises = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? instructions = const $CopyWithPlaceholder(),
    Object? intensity = const $CopyWithPlaceholder(),
    Object? isArchived = const $CopyWithPlaceholder(),
    Object? isExecuted = const $CopyWithPlaceholder(),
    Object? isMine = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? restIntervalSec = const $CopyWithPlaceholder(),
    Object? userAvatarUrl = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return Session(
      exercises: exercises == const $CopyWithPlaceholder()
          ? _value.exercises
          // ignore: cast_nullable_to_non_nullable
          : exercises as List<Exercise>?,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      instructions: instructions == const $CopyWithPlaceholder()
          ? _value.instructions
          // ignore: cast_nullable_to_non_nullable
          : instructions as String?,
      intensity: intensity == const $CopyWithPlaceholder()
          ? _value.intensity
          // ignore: cast_nullable_to_non_nullable
          : intensity as int?,
      isArchived: isArchived == const $CopyWithPlaceholder()
          ? _value.isArchived
          // ignore: cast_nullable_to_non_nullable
          : isArchived as bool?,
      isExecuted: isExecuted == const $CopyWithPlaceholder()
          ? _value.isExecuted
          // ignore: cast_nullable_to_non_nullable
          : isExecuted as bool?,
      isMine: isMine == const $CopyWithPlaceholder()
          ? _value.isMine
          // ignore: cast_nullable_to_non_nullable
          : isMine as bool?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      restIntervalSec: restIntervalSec == const $CopyWithPlaceholder()
          ? _value.restIntervalSec
          // ignore: cast_nullable_to_non_nullable
          : restIntervalSec as int?,
      userAvatarUrl: userAvatarUrl == const $CopyWithPlaceholder()
          ? _value.userAvatarUrl
          // ignore: cast_nullable_to_non_nullable
          : userAvatarUrl as String?,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
    );
  }
}

extension $SessionCopyWith on Session {
  /// Returns a callable class that can be used as follows: `instanceOfSession.copyWith(...)` or like so:`instanceOfSession.copyWith.fieldName(...)`.
  _$SessionCWProxy get copyWith => _$SessionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      name: json['name'] as String?,
      id: json['id'] as String?,
      instructions: json['instructions'] as String?,
      restIntervalSec: json['restIntervalSec'] as int?,
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      isMine: json['isMine'] as bool?,
      userAvatarUrl: json['userAvatarUrl'] as String?,
      isArchived: json['isArchived'] as bool?,
      intensity: json['intensity'] as int?,
      isExecuted: json['isExecuted'] as bool?,
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..trainingDurationSec = json['trainingDurationSec'] as int?;

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'instructions': instance.instructions,
      'restIntervalSec': instance.restIntervalSec,
      'userId': instance.userId,
      'userAvatarUrl': instance.userAvatarUrl,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isMine': instance.isMine,
      'isExecuted': instance.isExecuted,
      'intensity': instance.intensity,
      'trainingDurationSec': instance.trainingDurationSec,
      'isArchived': instance.isArchived,
      'exercises': instance.exercises,
    };
