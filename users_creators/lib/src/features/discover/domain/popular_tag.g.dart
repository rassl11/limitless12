// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_tag.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PopularTagCWProxy {
  PopularTag creators(List<DiscoverCreator>? creators);

  PopularTag tagName(String? tagName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PopularTag(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PopularTag(...).copyWith(id: 12, name: "My name")
  /// ````
  PopularTag call({
    List<DiscoverCreator>? creators,
    String? tagName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPopularTag.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPopularTag.copyWith.fieldName(...)`
class _$PopularTagCWProxyImpl implements _$PopularTagCWProxy {
  final PopularTag _value;

  const _$PopularTagCWProxyImpl(this._value);

  @override
  PopularTag creators(List<DiscoverCreator>? creators) =>
      this(creators: creators);

  @override
  PopularTag tagName(String? tagName) => this(tagName: tagName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PopularTag(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PopularTag(...).copyWith(id: 12, name: "My name")
  /// ````
  PopularTag call({
    Object? creators = const $CopyWithPlaceholder(),
    Object? tagName = const $CopyWithPlaceholder(),
  }) {
    return PopularTag(
      creators: creators == const $CopyWithPlaceholder()
          ? _value.creators
          // ignore: cast_nullable_to_non_nullable
          : creators as List<DiscoverCreator>?,
      tagName: tagName == const $CopyWithPlaceholder()
          ? _value.tagName
          // ignore: cast_nullable_to_non_nullable
          : tagName as String?,
    );
  }
}

extension $PopularTagCopyWith on PopularTag {
  /// Returns a callable class that can be used as follows: `instanceOfPopularTag.copyWith(...)` or like so:`instanceOfPopularTag.copyWith.fieldName(...)`.
  _$PopularTagCWProxy get copyWith => _$PopularTagCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularTag _$PopularTagFromJson(Map<String, dynamic> json) => PopularTag(
      tagName: json['tagName'] as String?,
      creators: (json['creators'] as List<dynamic>?)
          ?.map((e) => DiscoverCreator.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularTagToJson(PopularTag instance) =>
    <String, dynamic>{
      'tagName': instance.tagName,
      'creators': instance.creators,
    };
