// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'creator_onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreatorOnboardingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Creator creator, bool canGoNext) addCreatorInfo,
    required TResult Function(int pageNumber, Creator creator, bool canGoNext)
        changePage,
    required TResult Function(File photo) uploadUserPhoto,
    required TResult Function(File photo) uploadCoverImage,
    required TResult Function(Creator creator) becameCreator,
    required TResult Function() getAllTags,
    required TResult Function(List<String> tags) setTags,
    required TResult Function(List<String> tags) addTags,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCreatorInfo value) addCreatorInfo,
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_UploadUserPhoto value) uploadUserPhoto,
    required TResult Function(_UploadCoverImage value) uploadCoverImage,
    required TResult Function(_BecameCreator value) becameCreator,
    required TResult Function(_GetAllTags value) getAllTags,
    required TResult Function(_SetTags value) setTags,
    required TResult Function(_AddTags value) addTags,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatorOnboardingEventCopyWith<$Res> {
  factory $CreatorOnboardingEventCopyWith(CreatorOnboardingEvent value,
          $Res Function(CreatorOnboardingEvent) then) =
      _$CreatorOnboardingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreatorOnboardingEventCopyWithImpl<$Res>
    implements $CreatorOnboardingEventCopyWith<$Res> {
  _$CreatorOnboardingEventCopyWithImpl(this._value, this._then);

  final CreatorOnboardingEvent _value;
  // ignore: unused_field
  final $Res Function(CreatorOnboardingEvent) _then;
}

/// @nodoc
abstract class _$$_AddCreatorInfoCopyWith<$Res> {
  factory _$$_AddCreatorInfoCopyWith(
          _$_AddCreatorInfo value, $Res Function(_$_AddCreatorInfo) then) =
      __$$_AddCreatorInfoCopyWithImpl<$Res>;
  $Res call({Creator creator, bool canGoNext});
}

/// @nodoc
class __$$_AddCreatorInfoCopyWithImpl<$Res>
    extends _$CreatorOnboardingEventCopyWithImpl<$Res>
    implements _$$_AddCreatorInfoCopyWith<$Res> {
  __$$_AddCreatorInfoCopyWithImpl(
      _$_AddCreatorInfo _value, $Res Function(_$_AddCreatorInfo) _then)
      : super(_value, (v) => _then(v as _$_AddCreatorInfo));

  @override
  _$_AddCreatorInfo get _value => super._value as _$_AddCreatorInfo;

  @override
  $Res call({
    Object? creator = freezed,
    Object? canGoNext = freezed,
  }) {
    return _then(_$_AddCreatorInfo(
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Creator,
      canGoNext: canGoNext == freezed
          ? _value.canGoNext
          : canGoNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddCreatorInfo implements _AddCreatorInfo {
  const _$_AddCreatorInfo({required this.creator, required this.canGoNext});

  @override
  final Creator creator;
  @override
  final bool canGoNext;

  @override
  String toString() {
    return 'CreatorOnboardingEvent.addCreatorInfo(creator: $creator, canGoNext: $canGoNext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCreatorInfo &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.canGoNext, canGoNext));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(canGoNext));

  @JsonKey(ignore: true)
  @override
  _$$_AddCreatorInfoCopyWith<_$_AddCreatorInfo> get copyWith =>
      __$$_AddCreatorInfoCopyWithImpl<_$_AddCreatorInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Creator creator, bool canGoNext) addCreatorInfo,
    required TResult Function(int pageNumber, Creator creator, bool canGoNext)
        changePage,
    required TResult Function(File photo) uploadUserPhoto,
    required TResult Function(File photo) uploadCoverImage,
    required TResult Function(Creator creator) becameCreator,
    required TResult Function() getAllTags,
    required TResult Function(List<String> tags) setTags,
    required TResult Function(List<String> tags) addTags,
  }) {
    return addCreatorInfo(creator, canGoNext);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
  }) {
    return addCreatorInfo?.call(creator, canGoNext);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
    required TResult orElse(),
  }) {
    if (addCreatorInfo != null) {
      return addCreatorInfo(creator, canGoNext);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCreatorInfo value) addCreatorInfo,
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_UploadUserPhoto value) uploadUserPhoto,
    required TResult Function(_UploadCoverImage value) uploadCoverImage,
    required TResult Function(_BecameCreator value) becameCreator,
    required TResult Function(_GetAllTags value) getAllTags,
    required TResult Function(_SetTags value) setTags,
    required TResult Function(_AddTags value) addTags,
  }) {
    return addCreatorInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
  }) {
    return addCreatorInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
    required TResult orElse(),
  }) {
    if (addCreatorInfo != null) {
      return addCreatorInfo(this);
    }
    return orElse();
  }
}

abstract class _AddCreatorInfo implements CreatorOnboardingEvent {
  const factory _AddCreatorInfo(
      {required final Creator creator,
      required final bool canGoNext}) = _$_AddCreatorInfo;

  Creator get creator;
  bool get canGoNext;
  @JsonKey(ignore: true)
  _$$_AddCreatorInfoCopyWith<_$_AddCreatorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangePageCopyWith<$Res> {
  factory _$$_ChangePageCopyWith(
          _$_ChangePage value, $Res Function(_$_ChangePage) then) =
      __$$_ChangePageCopyWithImpl<$Res>;
  $Res call({int pageNumber, Creator creator, bool canGoNext});
}

/// @nodoc
class __$$_ChangePageCopyWithImpl<$Res>
    extends _$CreatorOnboardingEventCopyWithImpl<$Res>
    implements _$$_ChangePageCopyWith<$Res> {
  __$$_ChangePageCopyWithImpl(
      _$_ChangePage _value, $Res Function(_$_ChangePage) _then)
      : super(_value, (v) => _then(v as _$_ChangePage));

  @override
  _$_ChangePage get _value => super._value as _$_ChangePage;

  @override
  $Res call({
    Object? pageNumber = freezed,
    Object? creator = freezed,
    Object? canGoNext = freezed,
  }) {
    return _then(_$_ChangePage(
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Creator,
      canGoNext: canGoNext == freezed
          ? _value.canGoNext
          : canGoNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChangePage implements _ChangePage {
  const _$_ChangePage(
      {required this.pageNumber,
      required this.creator,
      required this.canGoNext});

  @override
  final int pageNumber;
  @override
  final Creator creator;
  @override
  final bool canGoNext;

  @override
  String toString() {
    return 'CreatorOnboardingEvent.changePage(pageNumber: $pageNumber, creator: $creator, canGoNext: $canGoNext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePage &&
            const DeepCollectionEquality()
                .equals(other.pageNumber, pageNumber) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.canGoNext, canGoNext));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageNumber),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(canGoNext));

  @JsonKey(ignore: true)
  @override
  _$$_ChangePageCopyWith<_$_ChangePage> get copyWith =>
      __$$_ChangePageCopyWithImpl<_$_ChangePage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Creator creator, bool canGoNext) addCreatorInfo,
    required TResult Function(int pageNumber, Creator creator, bool canGoNext)
        changePage,
    required TResult Function(File photo) uploadUserPhoto,
    required TResult Function(File photo) uploadCoverImage,
    required TResult Function(Creator creator) becameCreator,
    required TResult Function() getAllTags,
    required TResult Function(List<String> tags) setTags,
    required TResult Function(List<String> tags) addTags,
  }) {
    return changePage(pageNumber, creator, canGoNext);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
  }) {
    return changePage?.call(pageNumber, creator, canGoNext);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(pageNumber, creator, canGoNext);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCreatorInfo value) addCreatorInfo,
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_UploadUserPhoto value) uploadUserPhoto,
    required TResult Function(_UploadCoverImage value) uploadCoverImage,
    required TResult Function(_BecameCreator value) becameCreator,
    required TResult Function(_GetAllTags value) getAllTags,
    required TResult Function(_SetTags value) setTags,
    required TResult Function(_AddTags value) addTags,
  }) {
    return changePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
  }) {
    return changePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(this);
    }
    return orElse();
  }
}

abstract class _ChangePage implements CreatorOnboardingEvent {
  const factory _ChangePage(
      {required final int pageNumber,
      required final Creator creator,
      required final bool canGoNext}) = _$_ChangePage;

  int get pageNumber;
  Creator get creator;
  bool get canGoNext;
  @JsonKey(ignore: true)
  _$$_ChangePageCopyWith<_$_ChangePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadUserPhotoCopyWith<$Res> {
  factory _$$_UploadUserPhotoCopyWith(
          _$_UploadUserPhoto value, $Res Function(_$_UploadUserPhoto) then) =
      __$$_UploadUserPhotoCopyWithImpl<$Res>;
  $Res call({File photo});
}

/// @nodoc
class __$$_UploadUserPhotoCopyWithImpl<$Res>
    extends _$CreatorOnboardingEventCopyWithImpl<$Res>
    implements _$$_UploadUserPhotoCopyWith<$Res> {
  __$$_UploadUserPhotoCopyWithImpl(
      _$_UploadUserPhoto _value, $Res Function(_$_UploadUserPhoto) _then)
      : super(_value, (v) => _then(v as _$_UploadUserPhoto));

  @override
  _$_UploadUserPhoto get _value => super._value as _$_UploadUserPhoto;

  @override
  $Res call({
    Object? photo = freezed,
  }) {
    return _then(_$_UploadUserPhoto(
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_UploadUserPhoto implements _UploadUserPhoto {
  const _$_UploadUserPhoto({required this.photo});

  @override
  final File photo;

  @override
  String toString() {
    return 'CreatorOnboardingEvent.uploadUserPhoto(photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadUserPhoto &&
            const DeepCollectionEquality().equals(other.photo, photo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(photo));

  @JsonKey(ignore: true)
  @override
  _$$_UploadUserPhotoCopyWith<_$_UploadUserPhoto> get copyWith =>
      __$$_UploadUserPhotoCopyWithImpl<_$_UploadUserPhoto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Creator creator, bool canGoNext) addCreatorInfo,
    required TResult Function(int pageNumber, Creator creator, bool canGoNext)
        changePage,
    required TResult Function(File photo) uploadUserPhoto,
    required TResult Function(File photo) uploadCoverImage,
    required TResult Function(Creator creator) becameCreator,
    required TResult Function() getAllTags,
    required TResult Function(List<String> tags) setTags,
    required TResult Function(List<String> tags) addTags,
  }) {
    return uploadUserPhoto(photo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
  }) {
    return uploadUserPhoto?.call(photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
    required TResult orElse(),
  }) {
    if (uploadUserPhoto != null) {
      return uploadUserPhoto(photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCreatorInfo value) addCreatorInfo,
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_UploadUserPhoto value) uploadUserPhoto,
    required TResult Function(_UploadCoverImage value) uploadCoverImage,
    required TResult Function(_BecameCreator value) becameCreator,
    required TResult Function(_GetAllTags value) getAllTags,
    required TResult Function(_SetTags value) setTags,
    required TResult Function(_AddTags value) addTags,
  }) {
    return uploadUserPhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
  }) {
    return uploadUserPhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
    required TResult orElse(),
  }) {
    if (uploadUserPhoto != null) {
      return uploadUserPhoto(this);
    }
    return orElse();
  }
}

abstract class _UploadUserPhoto implements CreatorOnboardingEvent {
  const factory _UploadUserPhoto({required final File photo}) =
      _$_UploadUserPhoto;

  File get photo;
  @JsonKey(ignore: true)
  _$$_UploadUserPhotoCopyWith<_$_UploadUserPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UploadCoverImageCopyWith<$Res> {
  factory _$$_UploadCoverImageCopyWith(
          _$_UploadCoverImage value, $Res Function(_$_UploadCoverImage) then) =
      __$$_UploadCoverImageCopyWithImpl<$Res>;
  $Res call({File photo});
}

/// @nodoc
class __$$_UploadCoverImageCopyWithImpl<$Res>
    extends _$CreatorOnboardingEventCopyWithImpl<$Res>
    implements _$$_UploadCoverImageCopyWith<$Res> {
  __$$_UploadCoverImageCopyWithImpl(
      _$_UploadCoverImage _value, $Res Function(_$_UploadCoverImage) _then)
      : super(_value, (v) => _then(v as _$_UploadCoverImage));

  @override
  _$_UploadCoverImage get _value => super._value as _$_UploadCoverImage;

  @override
  $Res call({
    Object? photo = freezed,
  }) {
    return _then(_$_UploadCoverImage(
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_UploadCoverImage implements _UploadCoverImage {
  const _$_UploadCoverImage({required this.photo});

  @override
  final File photo;

  @override
  String toString() {
    return 'CreatorOnboardingEvent.uploadCoverImage(photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadCoverImage &&
            const DeepCollectionEquality().equals(other.photo, photo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(photo));

  @JsonKey(ignore: true)
  @override
  _$$_UploadCoverImageCopyWith<_$_UploadCoverImage> get copyWith =>
      __$$_UploadCoverImageCopyWithImpl<_$_UploadCoverImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Creator creator, bool canGoNext) addCreatorInfo,
    required TResult Function(int pageNumber, Creator creator, bool canGoNext)
        changePage,
    required TResult Function(File photo) uploadUserPhoto,
    required TResult Function(File photo) uploadCoverImage,
    required TResult Function(Creator creator) becameCreator,
    required TResult Function() getAllTags,
    required TResult Function(List<String> tags) setTags,
    required TResult Function(List<String> tags) addTags,
  }) {
    return uploadCoverImage(photo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
  }) {
    return uploadCoverImage?.call(photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
    required TResult orElse(),
  }) {
    if (uploadCoverImage != null) {
      return uploadCoverImage(photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCreatorInfo value) addCreatorInfo,
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_UploadUserPhoto value) uploadUserPhoto,
    required TResult Function(_UploadCoverImage value) uploadCoverImage,
    required TResult Function(_BecameCreator value) becameCreator,
    required TResult Function(_GetAllTags value) getAllTags,
    required TResult Function(_SetTags value) setTags,
    required TResult Function(_AddTags value) addTags,
  }) {
    return uploadCoverImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
  }) {
    return uploadCoverImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
    required TResult orElse(),
  }) {
    if (uploadCoverImage != null) {
      return uploadCoverImage(this);
    }
    return orElse();
  }
}

abstract class _UploadCoverImage implements CreatorOnboardingEvent {
  const factory _UploadCoverImage({required final File photo}) =
      _$_UploadCoverImage;

  File get photo;
  @JsonKey(ignore: true)
  _$$_UploadCoverImageCopyWith<_$_UploadCoverImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BecameCreatorCopyWith<$Res> {
  factory _$$_BecameCreatorCopyWith(
          _$_BecameCreator value, $Res Function(_$_BecameCreator) then) =
      __$$_BecameCreatorCopyWithImpl<$Res>;
  $Res call({Creator creator});
}

/// @nodoc
class __$$_BecameCreatorCopyWithImpl<$Res>
    extends _$CreatorOnboardingEventCopyWithImpl<$Res>
    implements _$$_BecameCreatorCopyWith<$Res> {
  __$$_BecameCreatorCopyWithImpl(
      _$_BecameCreator _value, $Res Function(_$_BecameCreator) _then)
      : super(_value, (v) => _then(v as _$_BecameCreator));

  @override
  _$_BecameCreator get _value => super._value as _$_BecameCreator;

  @override
  $Res call({
    Object? creator = freezed,
  }) {
    return _then(_$_BecameCreator(
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Creator,
    ));
  }
}

/// @nodoc

class _$_BecameCreator implements _BecameCreator {
  const _$_BecameCreator({required this.creator});

  @override
  final Creator creator;

  @override
  String toString() {
    return 'CreatorOnboardingEvent.becameCreator(creator: $creator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BecameCreator &&
            const DeepCollectionEquality().equals(other.creator, creator));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(creator));

  @JsonKey(ignore: true)
  @override
  _$$_BecameCreatorCopyWith<_$_BecameCreator> get copyWith =>
      __$$_BecameCreatorCopyWithImpl<_$_BecameCreator>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Creator creator, bool canGoNext) addCreatorInfo,
    required TResult Function(int pageNumber, Creator creator, bool canGoNext)
        changePage,
    required TResult Function(File photo) uploadUserPhoto,
    required TResult Function(File photo) uploadCoverImage,
    required TResult Function(Creator creator) becameCreator,
    required TResult Function() getAllTags,
    required TResult Function(List<String> tags) setTags,
    required TResult Function(List<String> tags) addTags,
  }) {
    return becameCreator(creator);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
  }) {
    return becameCreator?.call(creator);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
    required TResult orElse(),
  }) {
    if (becameCreator != null) {
      return becameCreator(creator);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCreatorInfo value) addCreatorInfo,
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_UploadUserPhoto value) uploadUserPhoto,
    required TResult Function(_UploadCoverImage value) uploadCoverImage,
    required TResult Function(_BecameCreator value) becameCreator,
    required TResult Function(_GetAllTags value) getAllTags,
    required TResult Function(_SetTags value) setTags,
    required TResult Function(_AddTags value) addTags,
  }) {
    return becameCreator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
  }) {
    return becameCreator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
    required TResult orElse(),
  }) {
    if (becameCreator != null) {
      return becameCreator(this);
    }
    return orElse();
  }
}

abstract class _BecameCreator implements CreatorOnboardingEvent {
  const factory _BecameCreator({required final Creator creator}) =
      _$_BecameCreator;

  Creator get creator;
  @JsonKey(ignore: true)
  _$$_BecameCreatorCopyWith<_$_BecameCreator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetAllTagsCopyWith<$Res> {
  factory _$$_GetAllTagsCopyWith(
          _$_GetAllTags value, $Res Function(_$_GetAllTags) then) =
      __$$_GetAllTagsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetAllTagsCopyWithImpl<$Res>
    extends _$CreatorOnboardingEventCopyWithImpl<$Res>
    implements _$$_GetAllTagsCopyWith<$Res> {
  __$$_GetAllTagsCopyWithImpl(
      _$_GetAllTags _value, $Res Function(_$_GetAllTags) _then)
      : super(_value, (v) => _then(v as _$_GetAllTags));

  @override
  _$_GetAllTags get _value => super._value as _$_GetAllTags;
}

/// @nodoc

class _$_GetAllTags implements _GetAllTags {
  const _$_GetAllTags();

  @override
  String toString() {
    return 'CreatorOnboardingEvent.getAllTags()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetAllTags);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Creator creator, bool canGoNext) addCreatorInfo,
    required TResult Function(int pageNumber, Creator creator, bool canGoNext)
        changePage,
    required TResult Function(File photo) uploadUserPhoto,
    required TResult Function(File photo) uploadCoverImage,
    required TResult Function(Creator creator) becameCreator,
    required TResult Function() getAllTags,
    required TResult Function(List<String> tags) setTags,
    required TResult Function(List<String> tags) addTags,
  }) {
    return getAllTags();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
  }) {
    return getAllTags?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
    required TResult orElse(),
  }) {
    if (getAllTags != null) {
      return getAllTags();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCreatorInfo value) addCreatorInfo,
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_UploadUserPhoto value) uploadUserPhoto,
    required TResult Function(_UploadCoverImage value) uploadCoverImage,
    required TResult Function(_BecameCreator value) becameCreator,
    required TResult Function(_GetAllTags value) getAllTags,
    required TResult Function(_SetTags value) setTags,
    required TResult Function(_AddTags value) addTags,
  }) {
    return getAllTags(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
  }) {
    return getAllTags?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
    required TResult orElse(),
  }) {
    if (getAllTags != null) {
      return getAllTags(this);
    }
    return orElse();
  }
}

abstract class _GetAllTags implements CreatorOnboardingEvent {
  const factory _GetAllTags() = _$_GetAllTags;
}

/// @nodoc
abstract class _$$_SetTagsCopyWith<$Res> {
  factory _$$_SetTagsCopyWith(
          _$_SetTags value, $Res Function(_$_SetTags) then) =
      __$$_SetTagsCopyWithImpl<$Res>;
  $Res call({List<String> tags});
}

/// @nodoc
class __$$_SetTagsCopyWithImpl<$Res>
    extends _$CreatorOnboardingEventCopyWithImpl<$Res>
    implements _$$_SetTagsCopyWith<$Res> {
  __$$_SetTagsCopyWithImpl(_$_SetTags _value, $Res Function(_$_SetTags) _then)
      : super(_value, (v) => _then(v as _$_SetTags));

  @override
  _$_SetTags get _value => super._value as _$_SetTags;

  @override
  $Res call({
    Object? tags = freezed,
  }) {
    return _then(_$_SetTags(
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SetTags implements _SetTags {
  const _$_SetTags({required final List<String> tags}) : _tags = tags;

  final List<String> _tags;
  @override
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'CreatorOnboardingEvent.setTags(tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetTags &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_SetTagsCopyWith<_$_SetTags> get copyWith =>
      __$$_SetTagsCopyWithImpl<_$_SetTags>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Creator creator, bool canGoNext) addCreatorInfo,
    required TResult Function(int pageNumber, Creator creator, bool canGoNext)
        changePage,
    required TResult Function(File photo) uploadUserPhoto,
    required TResult Function(File photo) uploadCoverImage,
    required TResult Function(Creator creator) becameCreator,
    required TResult Function() getAllTags,
    required TResult Function(List<String> tags) setTags,
    required TResult Function(List<String> tags) addTags,
  }) {
    return setTags(tags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
  }) {
    return setTags?.call(tags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
    required TResult orElse(),
  }) {
    if (setTags != null) {
      return setTags(tags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCreatorInfo value) addCreatorInfo,
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_UploadUserPhoto value) uploadUserPhoto,
    required TResult Function(_UploadCoverImage value) uploadCoverImage,
    required TResult Function(_BecameCreator value) becameCreator,
    required TResult Function(_GetAllTags value) getAllTags,
    required TResult Function(_SetTags value) setTags,
    required TResult Function(_AddTags value) addTags,
  }) {
    return setTags(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
  }) {
    return setTags?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
    required TResult orElse(),
  }) {
    if (setTags != null) {
      return setTags(this);
    }
    return orElse();
  }
}

abstract class _SetTags implements CreatorOnboardingEvent {
  const factory _SetTags({required final List<String> tags}) = _$_SetTags;

  List<String> get tags;
  @JsonKey(ignore: true)
  _$$_SetTagsCopyWith<_$_SetTags> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddTagsCopyWith<$Res> {
  factory _$$_AddTagsCopyWith(
          _$_AddTags value, $Res Function(_$_AddTags) then) =
      __$$_AddTagsCopyWithImpl<$Res>;
  $Res call({List<String> tags});
}

/// @nodoc
class __$$_AddTagsCopyWithImpl<$Res>
    extends _$CreatorOnboardingEventCopyWithImpl<$Res>
    implements _$$_AddTagsCopyWith<$Res> {
  __$$_AddTagsCopyWithImpl(_$_AddTags _value, $Res Function(_$_AddTags) _then)
      : super(_value, (v) => _then(v as _$_AddTags));

  @override
  _$_AddTags get _value => super._value as _$_AddTags;

  @override
  $Res call({
    Object? tags = freezed,
  }) {
    return _then(_$_AddTags(
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_AddTags implements _AddTags {
  const _$_AddTags({required final List<String> tags}) : _tags = tags;

  final List<String> _tags;
  @override
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'CreatorOnboardingEvent.addTags(tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTags &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_AddTagsCopyWith<_$_AddTags> get copyWith =>
      __$$_AddTagsCopyWithImpl<_$_AddTags>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Creator creator, bool canGoNext) addCreatorInfo,
    required TResult Function(int pageNumber, Creator creator, bool canGoNext)
        changePage,
    required TResult Function(File photo) uploadUserPhoto,
    required TResult Function(File photo) uploadCoverImage,
    required TResult Function(Creator creator) becameCreator,
    required TResult Function() getAllTags,
    required TResult Function(List<String> tags) setTags,
    required TResult Function(List<String> tags) addTags,
  }) {
    return addTags(tags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
  }) {
    return addTags?.call(tags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Creator creator, bool canGoNext)? addCreatorInfo,
    TResult Function(int pageNumber, Creator creator, bool canGoNext)?
        changePage,
    TResult Function(File photo)? uploadUserPhoto,
    TResult Function(File photo)? uploadCoverImage,
    TResult Function(Creator creator)? becameCreator,
    TResult Function()? getAllTags,
    TResult Function(List<String> tags)? setTags,
    TResult Function(List<String> tags)? addTags,
    required TResult orElse(),
  }) {
    if (addTags != null) {
      return addTags(tags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCreatorInfo value) addCreatorInfo,
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_UploadUserPhoto value) uploadUserPhoto,
    required TResult Function(_UploadCoverImage value) uploadCoverImage,
    required TResult Function(_BecameCreator value) becameCreator,
    required TResult Function(_GetAllTags value) getAllTags,
    required TResult Function(_SetTags value) setTags,
    required TResult Function(_AddTags value) addTags,
  }) {
    return addTags(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
  }) {
    return addTags?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCreatorInfo value)? addCreatorInfo,
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_UploadUserPhoto value)? uploadUserPhoto,
    TResult Function(_UploadCoverImage value)? uploadCoverImage,
    TResult Function(_BecameCreator value)? becameCreator,
    TResult Function(_GetAllTags value)? getAllTags,
    TResult Function(_SetTags value)? setTags,
    TResult Function(_AddTags value)? addTags,
    required TResult orElse(),
  }) {
    if (addTags != null) {
      return addTags(this);
    }
    return orElse();
  }
}

abstract class _AddTags implements CreatorOnboardingEvent {
  const factory _AddTags({required final List<String> tags}) = _$_AddTags;

  List<String> get tags;
  @JsonKey(ignore: true)
  _$$_AddTagsCopyWith<_$_AddTags> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreatorOnboardingState {
  bool get canGoNext => throw _privateConstructorUsedError;
  bool get isFirstPage => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  int get pagesLength => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get canBeSkipped => throw _privateConstructorUsedError;
  List<Tag> get allTags => throw _privateConstructorUsedError;
  List<String> get userTags => throw _privateConstructorUsedError;
  Creator get creator => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canGoNext,
            bool isFirstPage,
            bool isLastPage,
            int pagesLength,
            int currentPage,
            bool canBeSkipped,
            List<Tag> allTags,
            List<String> userTags,
            Creator creator,
            bool isLoading)
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool canGoNext,
            bool isFirstPage,
            bool isLastPage,
            int pagesLength,
            int currentPage,
            bool canBeSkipped,
            List<Tag> allTags,
            List<String> userTags,
            Creator creator,
            bool isLoading)?
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool canGoNext,
            bool isFirstPage,
            bool isLastPage,
            int pagesLength,
            int currentPage,
            bool canBeSkipped,
            List<Tag> allTags,
            List<String> userTags,
            Creator creator,
            bool isLoading)?
        idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatorOnboardingStateCopyWith<CreatorOnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatorOnboardingStateCopyWith<$Res> {
  factory $CreatorOnboardingStateCopyWith(CreatorOnboardingState value,
          $Res Function(CreatorOnboardingState) then) =
      _$CreatorOnboardingStateCopyWithImpl<$Res>;
  $Res call(
      {bool canGoNext,
      bool isFirstPage,
      bool isLastPage,
      int pagesLength,
      int currentPage,
      bool canBeSkipped,
      List<Tag> allTags,
      List<String> userTags,
      Creator creator,
      bool isLoading});
}

/// @nodoc
class _$CreatorOnboardingStateCopyWithImpl<$Res>
    implements $CreatorOnboardingStateCopyWith<$Res> {
  _$CreatorOnboardingStateCopyWithImpl(this._value, this._then);

  final CreatorOnboardingState _value;
  // ignore: unused_field
  final $Res Function(CreatorOnboardingState) _then;

  @override
  $Res call({
    Object? canGoNext = freezed,
    Object? isFirstPage = freezed,
    Object? isLastPage = freezed,
    Object? pagesLength = freezed,
    Object? currentPage = freezed,
    Object? canBeSkipped = freezed,
    Object? allTags = freezed,
    Object? userTags = freezed,
    Object? creator = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      canGoNext: canGoNext == freezed
          ? _value.canGoNext
          : canGoNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstPage: isFirstPage == freezed
          ? _value.isFirstPage
          : isFirstPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastPage: isLastPage == freezed
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      pagesLength: pagesLength == freezed
          ? _value.pagesLength
          : pagesLength // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      canBeSkipped: canBeSkipped == freezed
          ? _value.canBeSkipped
          : canBeSkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      allTags: allTags == freezed
          ? _value.allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      userTags: userTags == freezed
          ? _value.userTags
          : userTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Creator,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res>
    implements $CreatorOnboardingStateCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) =
      __$$_IdleCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool canGoNext,
      bool isFirstPage,
      bool isLastPage,
      int pagesLength,
      int currentPage,
      bool canBeSkipped,
      List<Tag> allTags,
      List<String> userTags,
      Creator creator,
      bool isLoading});
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res>
    extends _$CreatorOnboardingStateCopyWithImpl<$Res>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, (v) => _then(v as _$_Idle));

  @override
  _$_Idle get _value => super._value as _$_Idle;

  @override
  $Res call({
    Object? canGoNext = freezed,
    Object? isFirstPage = freezed,
    Object? isLastPage = freezed,
    Object? pagesLength = freezed,
    Object? currentPage = freezed,
    Object? canBeSkipped = freezed,
    Object? allTags = freezed,
    Object? userTags = freezed,
    Object? creator = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_Idle(
      canGoNext: canGoNext == freezed
          ? _value.canGoNext
          : canGoNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstPage: isFirstPage == freezed
          ? _value.isFirstPage
          : isFirstPage // ignore: cast_nullable_to_non_nullable
              as bool,
      isLastPage: isLastPage == freezed
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      pagesLength: pagesLength == freezed
          ? _value.pagesLength
          : pagesLength // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      canBeSkipped: canBeSkipped == freezed
          ? _value.canBeSkipped
          : canBeSkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      allTags: allTags == freezed
          ? _value._allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      userTags: userTags == freezed
          ? _value._userTags
          : userTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Creator,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle(
      {required this.canGoNext,
      required this.isFirstPage,
      required this.isLastPage,
      required this.pagesLength,
      required this.currentPage,
      required this.canBeSkipped,
      required final List<Tag> allTags,
      required final List<String> userTags,
      required this.creator,
      required this.isLoading})
      : _allTags = allTags,
        _userTags = userTags;

  @override
  final bool canGoNext;
  @override
  final bool isFirstPage;
  @override
  final bool isLastPage;
  @override
  final int pagesLength;
  @override
  final int currentPage;
  @override
  final bool canBeSkipped;
  final List<Tag> _allTags;
  @override
  List<Tag> get allTags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTags);
  }

  final List<String> _userTags;
  @override
  List<String> get userTags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userTags);
  }

  @override
  final Creator creator;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CreatorOnboardingState.idle(canGoNext: $canGoNext, isFirstPage: $isFirstPage, isLastPage: $isLastPage, pagesLength: $pagesLength, currentPage: $currentPage, canBeSkipped: $canBeSkipped, allTags: $allTags, userTags: $userTags, creator: $creator, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Idle &&
            const DeepCollectionEquality().equals(other.canGoNext, canGoNext) &&
            const DeepCollectionEquality()
                .equals(other.isFirstPage, isFirstPage) &&
            const DeepCollectionEquality()
                .equals(other.isLastPage, isLastPage) &&
            const DeepCollectionEquality()
                .equals(other.pagesLength, pagesLength) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.canBeSkipped, canBeSkipped) &&
            const DeepCollectionEquality().equals(other._allTags, _allTags) &&
            const DeepCollectionEquality().equals(other._userTags, _userTags) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(canGoNext),
      const DeepCollectionEquality().hash(isFirstPage),
      const DeepCollectionEquality().hash(isLastPage),
      const DeepCollectionEquality().hash(pagesLength),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(canBeSkipped),
      const DeepCollectionEquality().hash(_allTags),
      const DeepCollectionEquality().hash(_userTags),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_IdleCopyWith<_$_Idle> get copyWith =>
      __$$_IdleCopyWithImpl<_$_Idle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canGoNext,
            bool isFirstPage,
            bool isLastPage,
            int pagesLength,
            int currentPage,
            bool canBeSkipped,
            List<Tag> allTags,
            List<String> userTags,
            Creator creator,
            bool isLoading)
        idle,
  }) {
    return idle(canGoNext, isFirstPage, isLastPage, pagesLength, currentPage,
        canBeSkipped, allTags, userTags, creator, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool canGoNext,
            bool isFirstPage,
            bool isLastPage,
            int pagesLength,
            int currentPage,
            bool canBeSkipped,
            List<Tag> allTags,
            List<String> userTags,
            Creator creator,
            bool isLoading)?
        idle,
  }) {
    return idle?.call(canGoNext, isFirstPage, isLastPage, pagesLength,
        currentPage, canBeSkipped, allTags, userTags, creator, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool canGoNext,
            bool isFirstPage,
            bool isLastPage,
            int pagesLength,
            int currentPage,
            bool canBeSkipped,
            List<Tag> allTags,
            List<String> userTags,
            Creator creator,
            bool isLoading)?
        idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(canGoNext, isFirstPage, isLastPage, pagesLength, currentPage,
          canBeSkipped, allTags, userTags, creator, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements CreatorOnboardingState {
  const factory _Idle(
      {required final bool canGoNext,
      required final bool isFirstPage,
      required final bool isLastPage,
      required final int pagesLength,
      required final int currentPage,
      required final bool canBeSkipped,
      required final List<Tag> allTags,
      required final List<String> userTags,
      required final Creator creator,
      required final bool isLoading}) = _$_Idle;

  @override
  bool get canGoNext;
  @override
  bool get isFirstPage;
  @override
  bool get isLastPage;
  @override
  int get pagesLength;
  @override
  int get currentPage;
  @override
  bool get canBeSkipped;
  @override
  List<Tag> get allTags;
  @override
  List<String> get userTags;
  @override
  Creator get creator;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_IdleCopyWith<_$_Idle> get copyWith => throw _privateConstructorUsedError;
}
