part of 'calendar_bloc.dart';

@freezed
 class CalendarEvent with _$CalendarEvent{
  const factory CalendarEvent.selectDay({required int day, required int year, required int month}) = _SelectDay;
}