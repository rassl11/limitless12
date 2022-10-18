// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'discover_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscoverEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) search,
    required TResult Function(String value) getByTag,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? search,
    TResult Function(String value)? getByTag,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? search,
    TResult Function(String value)? getByTag,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Search value) search,
    required TResult Function(_GetByTag value) getByTag,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Search value)? search,
    TResult Function(_GetByTag value)? getByTag,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Search value)? search,
    TResult Function(_GetByTag value)? getByTag,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverEventCopyWith<$Res> {
  factory $DiscoverEventCopyWith(
          DiscoverEvent value, $Res Function(DiscoverEvent) then) =
      _$DiscoverEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DiscoverEventCopyWithImpl<$Res>
    implements $DiscoverEventCopyWith<$Res> {
  _$DiscoverEventCopyWithImpl(this._value, this._then);

  final DiscoverEvent _value;
  // ignore: unused_field
  final $Res Function(DiscoverEvent) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$DiscoverEventCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'DiscoverEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) search,
    required TResult Function(String value) getByTag,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? search,
    TResult Function(String value)? getByTag,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? search,
    TResult Function(String value)? getByTag,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Search value) search,
    required TResult Function(_GetByTag value) getByTag,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Search value)? search,
    TResult Function(_GetByTag value)? getByTag,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Search value)? search,
    TResult Function(_GetByTag value)? getByTag,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DiscoverEvent {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_SearchCopyWith<$Res> {
  factory _$$_SearchCopyWith(_$_Search value, $Res Function(_$_Search) then) =
      __$$_SearchCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class __$$_SearchCopyWithImpl<$Res> extends _$DiscoverEventCopyWithImpl<$Res>
    implements _$$_SearchCopyWith<$Res> {
  __$$_SearchCopyWithImpl(_$_Search _value, $Res Function(_$_Search) _then)
      : super(_value, (v) => _then(v as _$_Search));

  @override
  _$_Search get _value => super._value as _$_Search;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_Search(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Search implements _Search {
  const _$_Search({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'DiscoverEvent.search(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Search &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      __$$_SearchCopyWithImpl<_$_Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) search,
    required TResult Function(String value) getByTag,
  }) {
    return search(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? search,
    TResult Function(String value)? getByTag,
  }) {
    return search?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? search,
    TResult Function(String value)? getByTag,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Search value) search,
    required TResult Function(_GetByTag value) getByTag,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Search value)? search,
    TResult Function(_GetByTag value)? getByTag,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Search value)? search,
    TResult Function(_GetByTag value)? getByTag,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements DiscoverEvent {
  const factory _Search({required final String value}) = _$_Search;

  String get value;
  @JsonKey(ignore: true)
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetByTagCopyWith<$Res> {
  factory _$$_GetByTagCopyWith(
          _$_GetByTag value, $Res Function(_$_GetByTag) then) =
      __$$_GetByTagCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class __$$_GetByTagCopyWithImpl<$Res> extends _$DiscoverEventCopyWithImpl<$Res>
    implements _$$_GetByTagCopyWith<$Res> {
  __$$_GetByTagCopyWithImpl(
      _$_GetByTag _value, $Res Function(_$_GetByTag) _then)
      : super(_value, (v) => _then(v as _$_GetByTag));

  @override
  _$_GetByTag get _value => super._value as _$_GetByTag;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_GetByTag(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetByTag implements _GetByTag {
  const _$_GetByTag({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'DiscoverEvent.getByTag(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetByTag &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_GetByTagCopyWith<_$_GetByTag> get copyWith =>
      __$$_GetByTagCopyWithImpl<_$_GetByTag>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) search,
    required TResult Function(String value) getByTag,
  }) {
    return getByTag(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? search,
    TResult Function(String value)? getByTag,
  }) {
    return getByTag?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? search,
    TResult Function(String value)? getByTag,
    required TResult orElse(),
  }) {
    if (getByTag != null) {
      return getByTag(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Search value) search,
    required TResult Function(_GetByTag value) getByTag,
  }) {
    return getByTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Search value)? search,
    TResult Function(_GetByTag value)? getByTag,
  }) {
    return getByTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Search value)? search,
    TResult Function(_GetByTag value)? getByTag,
    required TResult orElse(),
  }) {
    if (getByTag != null) {
      return getByTag(this);
    }
    return orElse();
  }
}

abstract class _GetByTag implements DiscoverEvent {
  const factory _GetByTag({required final String value}) = _$_GetByTag;

  String get value;
  @JsonKey(ignore: true)
  _$$_GetByTagCopyWith<_$_GetByTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiscoverState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<DiscoverCreator> creators,
            List<PopularTag> tags,
            List<Tag> tag,
            List<DiscoverCreator> newCreators)
        initial,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<DiscoverCreator> creators, List<PopularTag> tags,
            List<Tag> tag, List<DiscoverCreator> newCreators)?
        initial,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiscoverCreator> creators, List<PopularTag> tags,
            List<Tag> tag, List<DiscoverCreator> newCreators)?
        initial,
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
abstract class $DiscoverStateCopyWith<$Res> {
  factory $DiscoverStateCopyWith(
          DiscoverState value, $Res Function(DiscoverState) then) =
      _$DiscoverStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DiscoverStateCopyWithImpl<$Res>
    implements $DiscoverStateCopyWith<$Res> {
  _$DiscoverStateCopyWithImpl(this._value, this._then);

  final DiscoverState _value;
  // ignore: unused_field
  final $Res Function(DiscoverState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  $Res call(
      {List<DiscoverCreator> creators,
      List<PopularTag> tags,
      List<Tag> tag,
      List<DiscoverCreator> newCreators});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$DiscoverStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;

  @override
  $Res call({
    Object? creators = freezed,
    Object? tags = freezed,
    Object? tag = freezed,
    Object? newCreators = freezed,
  }) {
    return _then(_$Initial(
      creators: creators == freezed
          ? _value._creators
          : creators // ignore: cast_nullable_to_non_nullable
              as List<DiscoverCreator>,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<PopularTag>,
      tag: tag == freezed
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      newCreators: newCreators == freezed
          ? _value._newCreators
          : newCreators // ignore: cast_nullable_to_non_nullable
              as List<DiscoverCreator>,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {required final List<DiscoverCreator> creators,
      required final List<PopularTag> tags,
      required final List<Tag> tag,
      required final List<DiscoverCreator> newCreators})
      : _creators = creators,
        _tags = tags,
        _tag = tag,
        _newCreators = newCreators;

  final List<DiscoverCreator> _creators;
  @override
  List<DiscoverCreator> get creators {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creators);
  }

  final List<PopularTag> _tags;
  @override
  List<PopularTag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<Tag> _tag;
  @override
  List<Tag> get tag {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  final List<DiscoverCreator> _newCreators;
  @override
  List<DiscoverCreator> get newCreators {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newCreators);
  }

  @override
  String toString() {
    return 'DiscoverState.initial(creators: $creators, tags: $tags, tag: $tag, newCreators: $newCreators)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            const DeepCollectionEquality().equals(other._creators, _creators) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._tag, _tag) &&
            const DeepCollectionEquality()
                .equals(other._newCreators, _newCreators));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_creators),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_tag),
      const DeepCollectionEquality().hash(_newCreators));

  @JsonKey(ignore: true)
  @override
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<DiscoverCreator> creators,
            List<PopularTag> tags,
            List<Tag> tag,
            List<DiscoverCreator> newCreators)
        initial,
    required TResult Function() loading,
  }) {
    return initial(creators, tags, tag, newCreators);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<DiscoverCreator> creators, List<PopularTag> tags,
            List<Tag> tag, List<DiscoverCreator> newCreators)?
        initial,
    TResult Function()? loading,
  }) {
    return initial?.call(creators, tags, tag, newCreators);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiscoverCreator> creators, List<PopularTag> tags,
            List<Tag> tag, List<DiscoverCreator> newCreators)?
        initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(creators, tags, tag, newCreators);
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

abstract class Initial implements DiscoverState {
  const factory Initial(
      {required final List<DiscoverCreator> creators,
      required final List<PopularTag> tags,
      required final List<Tag> tag,
      required final List<DiscoverCreator> newCreators}) = _$Initial;

  List<DiscoverCreator> get creators;
  List<PopularTag> get tags;
  List<Tag> get tag;
  List<DiscoverCreator> get newCreators;
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
class __$$LoadingCopyWithImpl<$Res> extends _$DiscoverStateCopyWithImpl<$Res>
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
    return 'DiscoverState.loading()';
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
    required TResult Function(
            List<DiscoverCreator> creators,
            List<PopularTag> tags,
            List<Tag> tag,
            List<DiscoverCreator> newCreators)
        initial,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<DiscoverCreator> creators, List<PopularTag> tags,
            List<Tag> tag, List<DiscoverCreator> newCreators)?
        initial,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiscoverCreator> creators, List<PopularTag> tags,
            List<Tag> tag, List<DiscoverCreator> newCreators)?
        initial,
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

abstract class Loading implements DiscoverState {
  const factory Loading() = _$Loading;
}
