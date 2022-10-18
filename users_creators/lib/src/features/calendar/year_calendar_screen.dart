import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/header/top_panel.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:users_creators/src/features/calendar/session/bloc/session_bloc.dart';
import 'package:users_creators/src/features/calendar/widgets/today_widget.dart';
import 'package:users_creators/src/features/calendar/widgets/year_calendar/year_calendar.dart';

import 'bloc/calendar_bloc.dart';

class YearCalendarScreen extends StatelessWidget {
  const YearCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
      return state.map(
          loading: (value) => const AppLoadingWidget(),
          loaded: (state) {
            final calendarController = CleanCalendarController(
              minDate: DateTime(2020),
              rangeMode: false,
              maxDate: DateTime.now().add(const Duration(days: 365)),
              onDayTapped: (date) {
                BlocProvider.of<CalendarBloc>(context).add(
                    (CalendarEvent.selectDay(
                        day: date.day, month: date.month, year: date.year)));
                BlocProvider.of<SessionBloc>(context)
                    .add(SessionEvent.getSessions(date: DateTime(date.year, date.month, date.day)));
                context.router.navigateNamed('/bottom-bar-page');
              },
              weekdayStart: DateTime.monday,
              initialFocusDate: DateTime.now(),
              initialDateSelected: DateTime(
                  state.selectedYear, state.selectedMonth, state.selectedDay),
            );

            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  shape: Border(
                    bottom: BorderSide(
                        color: ColorsLimitless.greyLight.withOpacity(0.2),
                        width: 1),
                  ),
                  elevation: 0,
                  title: Text(
                    'Calendar',
                    style: TextStyle(
                        color: ColorsLimitless.greyDark,
                        fontFamily: 'SF Pro',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                      onPressed: () {
                        context.router.navigateBack();
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/top_panel/left_arrow.svg',
                        height: 12.r,
                        color: Colors.black,
                        width: 2,
                      )),
                  actions: [
                    TodayWidget(onTap: () {
                      BlocProvider.of<CalendarBloc>(context).add(
                          (CalendarEvent.selectDay(
                              day: DateTime.now().day,
                              month: DateTime.now().month,
                              year: DateTime.now().year)));
                      BlocProvider.of<SessionBloc>(context)
                          .add(SessionEvent.getSessions(date: DateTime.now()));
                      calendarController.scrollToMonth(
                          date: DateTime.now(),
                          duration: const Duration(seconds: 2),
                          curve: Curves.easeInOutCubic);
                    })
                  ],
                ),
                body: SafeArea(
                    child: YearCalendar(
                  calendarController: calendarController,
                  daySelectedBackgroundColor: ColorsLimitless.greyDark,
                  monthTextAlign: TextAlign.left,
                  dayTextStyle: TextStyle(
                      color: ColorsLimitless.greyDark,
                      fontFamily: 'SF Pro',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  monthTextStyle: TextStyle(
                    color: ColorsLimitless.greyDark,
                    fontFamily: 'SF Pro',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                )));
          });
    });
  }
}
