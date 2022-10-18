import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_creators/src/features/calendar/session/domain/date_session.dart';
import 'package:users_creators/src/features/calendar/widgets/mock_data.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../session/repo/session_repo.dart';
import '../widgets/mock_data.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';
part 'calendar_bloc.freezed.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  DateTime getDateTime() => DateTime.now();
  int getMonthDays() =>
      DateTime(getDateTime().year, getDateTime().month + 1, 0).day;
  final itemScrollController = ItemScrollController();
  CalendarBloc() : super(const Loading()) {
    on((event, emit) async {
      if (event is _SelectDay) {
        List<DateSession> sessions = await SessionRepo().getSessionByRange(
            DateTime(getDateTime().year, getDateTime().month, 1),
            DateTime(getDateTime().year, getDateTime().month, getMonthDays()));

        emit(CalendarState.loaded(
            selectedDay: event.day,
            monthDays: MockData().getMonthDays(),
            sessions: sessions,
            selectedYear: event.year,
            selectedMonth: DateTime.now().month,
            itemScrollController: itemScrollController));
        if (itemScrollController.isAttached) {
          itemScrollController.scrollTo(
              index: event.day - 4 > 0 ? event.day - 4 : 0,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOutCubic);
        }
      }
    });
  }
}
