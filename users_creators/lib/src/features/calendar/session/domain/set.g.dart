// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetCWProxy {
  Set minutes(String? minutes);

  Set orderNumber(int? orderNumber);

  Set repeats(String? repeats);

  Set seconds(String? seconds);

  Set weight(int? weight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Set(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Set(...).copyWith(id: 12, name: "My name")
  /// ````
  Set call({
    String? minutes,
    int? orderNumber,
    String? repeats,
    String? seconds,
    int? weight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSet.copyWith.fieldName(...)`
class _$SetCWProxyImpl implements _$SetCWProxy {
  final Set _value;

  const _$SetCWProxyImpl(this._value);

  @override
  Set minutes(String? minutes) => this(minutes: minutes);

  @override
  Set orderNumber(int? orderNumber) => this(orderNumber: orderNumber);

  @override
  Set repeats(String? repeats) => this(repeats: repeats);

  @override
  Set seconds(String? seconds) => this(seconds: seconds);

  @override
  Set weight(int? weight) => this(weight: weight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Set(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Set(...).copyWith(id: 12, name: "My name")
  /// ````
  Set call({
    Object? minutes = const $CopyWithPlaceholder(),
    Object? orderNumber = const $CopyWithPlaceholder(),
    Object? repeats = const $CopyWithPlaceholder(),
    Object? seconds = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
  }) {
    return Set(
      minutes: minutes == const $CopyWithPlaceholder()
          ? _value.minutes
          // ignore: cast_nullable_to_non_nullable
          : minutes as String?,
      orderNumber: orderNumber == const $CopyWithPlaceholder()
          ? _value.orderNumber
          // ignore: cast_nullable_to_non_nullable
          : orderNumber as int?,
      repeats: repeats == const $CopyWithPlaceholder()
          ? _value.repeats
          // ignore: cast_nullable_to_non_nullable
          : repeats as String?,
      seconds: seconds == const $CopyWithPlaceholder()
          ? _value.seconds
          // ignore: cast_nullable_to_non_nullable
          : seconds as String?,
      weight: weight == const $CopyWithPlaceholder()
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as int?,
    );
  }
}

extension $SetCopyWith on Set {
  /// Returns a callable class that can be used as follows: `instanceOfSet.copyWith(...)` or like so:`instanceOfSet.copyWith.fieldName(...)`.
  _$SetCWProxy get copyWith => _$SetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Set _$SetFromJson(Map<String, dynamic> json) => Set(
      orderNumber: json['orderNumber'] as int?,
      repeats: json['repeats'] as String?,
      minutes: json['minutes'] as String?,
      seconds: json['seconds'] as String?,
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$SetToJson(Set instance) => <String, dynamic>{
      'orderNumber': instance.orderNumber,
      'repeats': instance.repeats,
      'minutes': instance.minutes,
      'seconds': instance.seconds,
      'weight': instance.weight,
    };
