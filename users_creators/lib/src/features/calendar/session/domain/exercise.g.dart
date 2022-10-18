// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExerciseCWProxy {
  Exercise groupId(String? groupId);

  Exercise imageUrl(String? imageUrl);

  Exercise orderNumber(int? orderNumber);

  Exercise restIntervalSec(int? restIntervalSec);

  Exercise sets(List<Set>? sets);

  Exercise title(String? title);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Exercise(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Exercise(...).copyWith(id: 12, name: "My name")
  /// ````
  Exercise call({
    String? groupId,
    String? imageUrl,
    int? orderNumber,
    int? restIntervalSec,
    List<Set>? sets,
    String? title,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExercise.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExercise.copyWith.fieldName(...)`
class _$ExerciseCWProxyImpl implements _$ExerciseCWProxy {
  final Exercise _value;

  const _$ExerciseCWProxyImpl(this._value);

  @override
  Exercise groupId(String? groupId) => this(groupId: groupId);

  @override
  Exercise imageUrl(String? imageUrl) => this(imageUrl: imageUrl);

  @override
  Exercise orderNumber(int? orderNumber) => this(orderNumber: orderNumber);

  @override
  Exercise restIntervalSec(int? restIntervalSec) =>
      this(restIntervalSec: restIntervalSec);

  @override
  Exercise sets(List<Set>? sets) => this(sets: sets);

  @override
  Exercise title(String? title) => this(title: title);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Exercise(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Exercise(...).copyWith(id: 12, name: "My name")
  /// ````
  Exercise call({
    Object? groupId = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? orderNumber = const $CopyWithPlaceholder(),
    Object? restIntervalSec = const $CopyWithPlaceholder(),
    Object? sets = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
  }) {
    return Exercise(
      groupId: groupId == const $CopyWithPlaceholder()
          ? _value.groupId
          // ignore: cast_nullable_to_non_nullable
          : groupId as String?,
      imageUrl: imageUrl == const $CopyWithPlaceholder()
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String?,
      orderNumber: orderNumber == const $CopyWithPlaceholder()
          ? _value.orderNumber
          // ignore: cast_nullable_to_non_nullable
          : orderNumber as int?,
      restIntervalSec: restIntervalSec == const $CopyWithPlaceholder()
          ? _value.restIntervalSec
          // ignore: cast_nullable_to_non_nullable
          : restIntervalSec as int?,
      sets: sets == const $CopyWithPlaceholder()
          ? _value.sets
          // ignore: cast_nullable_to_non_nullable
          : sets as List<Set>?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
    );
  }
}

extension $ExerciseCopyWith on Exercise {
  /// Returns a callable class that can be used as follows: `instanceOfExercise.copyWith(...)` or like so:`instanceOfExercise.copyWith.fieldName(...)`.
  _$ExerciseCWProxy get copyWith => _$ExerciseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      title: json['title'] as String?,
      imageUrl: json['imageUrl'] as String?,
      orderNumber: json['orderNumber'] as int?,
      sets: (json['sets'] as List<dynamic>?)
          ?.map((e) => Set.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupId: json['groupId'] as String?,
      restIntervalSec: json['restIntervalSec'] as int?,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'orderNumber': instance.orderNumber,
      'restIntervalSec': instance.restIntervalSec,
      'groupId': instance.groupId,
      'sets': instance.sets,
    };
