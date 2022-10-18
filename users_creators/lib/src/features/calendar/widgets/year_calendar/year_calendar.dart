import 'package:components/common_widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/models/day_values_model.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:scrollable_clean_calendar/widgets/month_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:users_creators/src/features/calendar/bloc/calendar_bloc.dart';
import 'package:users_creators/src/features/calendar/widgets/year_calendar/days_widget.dart';
import 'package:users_creators/src/features/calendar/widgets/year_calendar/weekdays_widget.dart';

class YearCalendar extends StatefulWidget {
  final ScrollController? scrollController;
  final bool showWeekdays;
  final Layout? layout;
  final double spaceBetweenMonthAndCalendar;
  final double spaceBetweenCalendars;
  final double calendarCrossAxisSpacing;
  final double calendarMainAxisSpacing;
  final EdgeInsets? padding;
  final TextStyle? monthTextStyle;
  final TextAlign? monthTextAlign;
  final TextStyle? weekdayTextStyle;
  final TextStyle? dayTextStyle;
  final Color? daySelectedBackgroundColor;
  final Color? dayBackgroundColor;
  final Color? daySelectedBackgroundColorBetween;
  final Color? dayDisableBackgroundColor;
  final Color? dayDisableColor;
  final double dayRadius;
  final Widget Function(BuildContext context, String month)? monthBuilder;
  final Widget Function(BuildContext context, String weekday)? weekdayBuilder;
  final Widget Function(BuildContext context, DayValues values)? dayBuilder;

  final CleanCalendarController calendarController;

   const YearCalendar({Key? key, 
    this.scrollController,
    this.showWeekdays = true,
    this.layout,
    this.calendarCrossAxisSpacing = 4,
    this.calendarMainAxisSpacing = 4,
    this.spaceBetweenCalendars = 24,
    this.spaceBetweenMonthAndCalendar = 24,
    this.padding,
    this.monthBuilder,
    this.weekdayBuilder,
    this.dayBuilder,
    this.monthTextAlign,
    this.monthTextStyle,
    this.weekdayTextStyle,
    this.daySelectedBackgroundColor,
    this.dayBackgroundColor,
    this.daySelectedBackgroundColorBetween,
    this.dayDisableBackgroundColor,
    this.dayDisableColor,
    this.dayTextStyle,
    this.dayRadius = 6,
    required this.calendarController,
  }) : super(key: key);

  @override
  State<YearCalendar> createState() =>
      _YearCalendarState();
}

class _YearCalendarState extends State<YearCalendar> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final focusDate = widget.calendarController.initialFocusDate;
      if (focusDate != null) {
        widget.calendarController.jumpToMonth(date: focusDate);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.scrollController != null) {
      return listViewCalendar();
    } else {
      return scrollablePositionedListCalendar();
    }
  }

  Widget listViewCalendar() {
    return ListView.separated(
      controller: widget.scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      separatorBuilder: (_, __) =>
          SizedBox(height: widget.spaceBetweenCalendars),
      itemCount: widget.calendarController.months.length,
      itemBuilder: (context, index) {
        final month = widget.calendarController.months[index];

        return childCollumn(month);
      },
    );
  }

  Widget scrollablePositionedListCalendar() {
    return ScrollablePositionedList.separated(
      itemScrollController: widget.calendarController.itemScrollController,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      separatorBuilder: (_, __) =>
          SizedBox(height: widget.spaceBetweenCalendars),
      itemCount: widget.calendarController.months.length,
      itemBuilder: (context, index) {
        final month = widget.calendarController.months[index];

        return childCollumn(month);
      },
    );
  }

  Widget childCollumn(DateTime month) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return state.map(loaded: (value) {
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: MonthWidget(
                month: month,
                locale: 'en',
                layout: Layout.BEAUTY,
                monthBuilder: widget.monthBuilder,
                textAlign: widget.monthTextAlign,
                textStyle: widget.monthTextStyle,
              ),
            ),
            SizedBox(height: widget.spaceBetweenMonthAndCalendar),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeekdaysCustomWidget(
                  showWeekdays: widget.showWeekdays,
                  cleanCalendarController: widget.calendarController,
                  locale: 'en',
                  layout: Layout.BEAUTY,
                  weekdayBuilder: widget.weekdayBuilder,
                  textStyle: widget.weekdayTextStyle,
                ),
                AnimatedBuilder(
                  animation: widget.calendarController,
                  builder: (_, __) {
                    return DaysCustomWidget(
                      month: month,
                      cleanCalendarController: widget.calendarController,
                      calendarCrossAxisSpacing: widget.calendarCrossAxisSpacing,
                      calendarMainAxisSpacing: widget.calendarMainAxisSpacing,
                      dayBuilder: widget.dayBuilder,
                      backgroundColor: widget.dayBackgroundColor,
                      selectedBackgroundColor: widget.daySelectedBackgroundColor,
                      selectedBackgroundColorBetween:
                          widget.daySelectedBackgroundColorBetween,
                      disableBackgroundColor: widget.dayDisableBackgroundColor,
                      dayDisableColor: widget.dayDisableColor,
                      radius: widget.dayRadius,
                      textStyle: widget.dayTextStyle, 
                      sessions: value.sessions,
                    );
                  },
                )
              ],
            )
          ],
        );
        }, loading: (Loading value) {  return const AppLoadingWidget();},);
        
      }
    );
  }
}
