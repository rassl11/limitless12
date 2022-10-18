part of 'calendar_bloc.dart';


@freezed
class CalendarState with _$CalendarState{
  const factory CalendarState.loaded({
    required int selectedYear,
    required int selectedDay,
    required int selectedMonth,
    required int monthDays,
    required List<DateSession> sessions,
    required ItemScrollController itemScrollController, 
}) = Initial;
const factory CalendarState.loading() = Loading;
}