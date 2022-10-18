// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarEvent {
  int get day => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int day, int year, int month) selectDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int day, int year, int month)? selectDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int day, int year, int month)? selectDay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectDay value) selectDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SelectDay value)? selectDay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectDay value)? selectDay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarEventCopyWith<CalendarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res>;
  $Res call({int day, int year, int month});
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  final CalendarEvent _value;
  // ignore: unused_field
  final $Res Function(CalendarEvent) _then;

  @override
  $Res call({
    Object? day = freezed,
    Object? year = freezed,
    Object? month = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SelectDayCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$$_SelectDayCopyWith(
          _$_SelectDay value, $Res Function(_$_SelectDay) then) =
      __$$_SelectDayCopyWithImpl<$Res>;
  @override
  $Res call({int day, int year, int month});
}

/// @nodoc
class __$$_SelectDayCopyWithImpl<$Res> extends _$CalendarEventCopyWithImpl<$Res>
    implements _$$_SelectDayCopyWith<$Res> {
  __$$_SelectDayCopyWithImpl(
      _$_SelectDay _value, $Res Function(_$_SelectDay) _then)
      : super(_value, (v) => _then(v as _$_SelectDay));

  @override
  _$_SelectDay get _value => super._value as _$_SelectDay;

  @override
  $Res call({
    Object? day = freezed,
    Object? year = freezed,
    Object? month = freezed,
  }) {
    return _then(_$_SelectDay(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SelectDay implements _SelectDay {
  const _$_SelectDay(
      {required this.day, required this.year, required this.month});

  @override
  final int day;
  @override
  final int year;
  @override
  final int month;

  @override
  String toString() {
    return 'CalendarEvent.selectDay(day: $day, year: $year, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectDay &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.month, month));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(month));

  @JsonKey(ignore: true)
  @override
  _$$_SelectDayCopyWith<_$_SelectDay> get copyWith =>
      __$$_SelectDayCopyWithImpl<_$_SelectDay>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int day, int year, int month) selectDay,
  }) {
    return selectDay(day, year, month);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int day, int year, int month)? selectDay,
  }) {
    return selectDay?.call(day, year, month);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int day, int year, int month)? selectDay,
    required TResult orElse(),
  }) {
    if (selectDay != null) {
      return selectDay(day, year, month);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectDay value) selectDay,
  }) {
    return selectDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SelectDay value)? selectDay,
  }) {
    return selectDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectDay value)? selectDay,
    required TResult orElse(),
  }) {
    if (selectDay != null) {
      return selectDay(this);
    }
    return orElse();
  }
}

abstract class _SelectDay implements CalendarEvent {
  const factory _SelectDay(
      {required final int day,
      required final int year,
      required final int month}) = _$_SelectDay;

  @override
  int get day;
  @override
  int get year;
  @override
  int get month;
  @override
  @JsonKey(ignore: true)
  _$$_SelectDayCopyWith<_$_SelectDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int selectedYear,
            int selectedDay,
            int selectedMonth,
            int monthDays,
            List<DateSession> sessions,
            ItemScrollController itemScrollController)
        loaded,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            int selectedYear,
            int selectedDay,
            int selectedMonth,
            int monthDays,
            List<DateSession> sessions,
            ItemScrollController itemScrollController)?
        loaded,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int selectedYear,
            int selectedDay,
            int selectedMonth,
            int monthDays,
            List<DateSession> sessions,
            ItemScrollController itemScrollController)?
        loaded,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) loaded,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? loaded,
    TResult Function(Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? loaded,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  final CalendarState _value;
  // ignore: unused_field
  final $Res Function(CalendarState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  $Res call(
      {int selectedYear,
      int selectedDay,
      int selectedMonth,
      int monthDays,
      List<DateSession> sessions,
      ItemScrollController itemScrollController});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$CalendarStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;

  @override
  $Res call({
    Object? selectedYear = freezed,
    Object? selectedDay = freezed,
    Object? selectedMonth = freezed,
    Object? monthDays = freezed,
    Object? sessions = freezed,
    Object? itemScrollController = freezed,
  }) {
    return _then(_$Initial(
      selectedYear: selectedYear == freezed
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDay: selectedDay == freezed
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMonth: selectedMonth == freezed
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as int,
      monthDays: monthDays == freezed
          ? _value.monthDays
          : monthDays // ignore: cast_nullable_to_non_nullable
              as int,
      sessions: sessions == freezed
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<DateSession>,
      itemScrollController: itemScrollController == freezed
          ? _value.itemScrollController
          : itemScrollController // ignore: cast_nullable_to_non_nullable
              as ItemScrollController,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {required this.selectedYear,
      required this.selectedDay,
      required this.selectedMonth,
      required this.monthDays,
      required final List<DateSession> sessions,
      required this.itemScrollController})
      : _sessions = sessions;

  @override
  final int selectedYear;
  @override
  final int selectedDay;
  @override
  final int selectedMonth;
  @override
  final int monthDays;
  final List<DateSession> _sessions;
  @override
  List<DateSession> get sessions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  final ItemScrollController itemScrollController;

  @override
  String toString() {
    return 'CalendarState.loaded(selectedYear: $selectedYear, selectedDay: $selectedDay, selectedMonth: $selectedMonth, monthDays: $monthDays, sessions: $sessions, itemScrollController: $itemScrollController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            const DeepCollectionEquality()
                .equals(other.selectedYear, selectedYear) &&
            const DeepCollectionEquality()
                .equals(other.selectedDay, selectedDay) &&
            const DeepCollectionEquality()
                .equals(other.selectedMonth, selectedMonth) &&
            const DeepCollectionEquality().equals(other.monthDays, monthDays) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            const DeepCollectionEquality()
                .equals(other.itemScrollController, itemScrollController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedYear),
      const DeepCollectionEquality().hash(selectedDay),
      const DeepCollectionEquality().hash(selectedMonth),
      const DeepCollectionEquality().hash(monthDays),
      const DeepCollectionEquality().hash(_sessions),
      const DeepCollectionEquality().hash(itemScrollController));

  @JsonKey(ignore: true)
  @override
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int selectedYear,
            int selectedDay,
            int selectedMonth,
            int monthDays,
            List<DateSession> sessions,
            ItemScrollController itemScrollController)
        loaded,
    required TResult Function() loading,
  }) {
    return loaded(selectedYear, selectedDay, selectedMonth, monthDays, sessions,
        itemScrollController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            int selectedYear,
            int selectedDay,
            int selectedMonth,
            int monthDays,
            List<DateSession> sessions,
            ItemScrollController itemScrollController)?
        loaded,
    TResult Function()? loading,
  }) {
    return loaded?.call(selectedYear, selectedDay, selectedMonth, monthDays,
        sessions, itemScrollController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int selectedYear,
            int selectedDay,
            int selectedMonth,
            int monthDays,
            List<DateSession> sessions,
            ItemScrollController itemScrollController)?
        loaded,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(selectedYear, selectedDay, selectedMonth, monthDays,
          sessions, itemScrollController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) loaded,
    required TResult Function(Loading value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? loaded,
    TResult Function(Loading value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? loaded,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Initial implements CalendarState {
  const factory Initial(
      {required final int selectedYear,
      required final int selectedDay,
      required final int selectedMonth,
      required final int monthDays,
      required final List<DateSession> sessions,
      required final ItemScrollController itemScrollController}) = _$Initial;

  int get selectedYear;
  int get selectedDay;
  int get selectedMonth;
  int get monthDays;
  List<DateSession> get sessions;
  ItemScrollController get itemScrollController;
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
class __$$LoadingCopyWithImpl<$Res> extends _$CalendarStateCopyWithImpl<$Res>
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
    return 'CalendarState.loading()';
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
            int selectedYear,
            int selectedDay,
            int selectedMonth,
            int monthDays,
            List<DateSession> sessions,
            ItemScrollController itemScrollController)
        loaded,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            int selectedYear,
            int selectedDay,
            int selectedMonth,
            int monthDays,
            List<DateSession> sessions,
            ItemScrollController itemScrollController)?
        loaded,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int selectedYear,
            int selectedDay,
            int selectedMonth,
            int monthDays,
            List<DateSession> sessions,
            ItemScrollController itemScrollController)?
        loaded,
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
    required TResult Function(Initial value) loaded,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? loaded,
    TResult Function(Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? loaded,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CalendarState {
  const factory Loading() = _$Loading;
}
