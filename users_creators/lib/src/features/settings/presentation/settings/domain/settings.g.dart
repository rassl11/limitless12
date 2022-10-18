// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsCWProxy {
  Settings distance(int? distance);

  Settings isAudioMuted(bool? isAudioMuted);

  Settings isSubscribed(bool? isSubscribed);

  Settings location(String? location);

  Settings startOfWeek(int? startOfWeek);

  Settings subscriptionPrice(int? subscriptionPrice);

  Settings timeZone(String? timeZone);

  Settings weight(int? weight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Settings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Settings(...).copyWith(id: 12, name: "My name")
  /// ````
  Settings call({
    int? distance,
    bool? isAudioMuted,
    bool? isSubscribed,
    String? location,
    int? startOfWeek,
    int? subscriptionPrice,
    String? timeZone,
    int? weight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettings.copyWith.fieldName(...)`
class _$SettingsCWProxyImpl implements _$SettingsCWProxy {
  final Settings _value;

  const _$SettingsCWProxyImpl(this._value);

  @override
  Settings distance(int? distance) => this(distance: distance);

  @override
  Settings isAudioMuted(bool? isAudioMuted) => this(isAudioMuted: isAudioMuted);

  @override
  Settings isSubscribed(bool? isSubscribed) => this(isSubscribed: isSubscribed);

  @override
  Settings location(String? location) => this(location: location);

  @override
  Settings startOfWeek(int? startOfWeek) => this(startOfWeek: startOfWeek);

  @override
  Settings subscriptionPrice(int? subscriptionPrice) =>
      this(subscriptionPrice: subscriptionPrice);

  @override
  Settings timeZone(String? timeZone) => this(timeZone: timeZone);

  @override
  Settings weight(int? weight) => this(weight: weight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Settings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Settings(...).copyWith(id: 12, name: "My name")
  /// ````
  Settings call({
    Object? distance = const $CopyWithPlaceholder(),
    Object? isAudioMuted = const $CopyWithPlaceholder(),
    Object? isSubscribed = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? startOfWeek = const $CopyWithPlaceholder(),
    Object? subscriptionPrice = const $CopyWithPlaceholder(),
    Object? timeZone = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
  }) {
    return Settings(
      distance: distance == const $CopyWithPlaceholder()
          ? _value.distance
          // ignore: cast_nullable_to_non_nullable
          : distance as int?,
      isAudioMuted: isAudioMuted == const $CopyWithPlaceholder()
          ? _value.isAudioMuted
          // ignore: cast_nullable_to_non_nullable
          : isAudioMuted as bool?,
      isSubscribed: isSubscribed == const $CopyWithPlaceholder()
          ? _value.isSubscribed
          // ignore: cast_nullable_to_non_nullable
          : isSubscribed as bool?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
      startOfWeek: startOfWeek == const $CopyWithPlaceholder()
          ? _value.startOfWeek
          // ignore: cast_nullable_to_non_nullable
          : startOfWeek as int?,
      subscriptionPrice: subscriptionPrice == const $CopyWithPlaceholder()
          ? _value.subscriptionPrice
          // ignore: cast_nullable_to_non_nullable
          : subscriptionPrice as int?,
      timeZone: timeZone == const $CopyWithPlaceholder()
          ? _value.timeZone
          // ignore: cast_nullable_to_non_nullable
          : timeZone as String?,
      weight: weight == const $CopyWithPlaceholder()
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as int?,
    );
  }
}

extension $SettingsCopyWith on Settings {
  /// Returns a callable class that can be used as follows: `instanceOfSettings.copyWith(...)` or like so:`instanceOfSettings.copyWith.fieldName(...)`.
  _$SettingsCWProxy get copyWith => _$SettingsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      distance: json['distance'] as int?,
      weight: json['weight'] as int?,
      startOfWeek: json['startOfWeek'] as int?,
      isAudioMuted: json['isAudioMuted'] as bool?,
      subscriptionPrice: json['subscriptionPrice'] as int?,
      isSubscribed: json['isSubscribed'] as bool?,
      location: json['location'] as String?,
      timeZone: json['timeZone'] as String?,
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'distance': instance.distance,
      'weight': instance.weight,
      'startOfWeek': instance.startOfWeek,
      'isAudioMuted': instance.isAudioMuted,
      'subscriptionPrice': instance.subscriptionPrice,
      'isSubscribed': instance.isSubscribed,
      'location': instance.location,
      'timeZone': instance.timeZone,
    };
