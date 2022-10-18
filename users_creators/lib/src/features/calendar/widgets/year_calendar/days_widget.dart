import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/models/day_values_model.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:scrollable_clean_calendar/utils/extensions.dart';
import 'package:users_creators/src/features/calendar/session/domain/date_session.dart';

class DaysCustomWidget extends StatelessWidget {
  final CleanCalendarController cleanCalendarController;
  final DateTime month;
  final double calendarCrossAxisSpacing;
  final double calendarMainAxisSpacing;
  final Layout? layout = Layout.BEAUTY;
  final Widget Function(
    BuildContext context,
    DayValues values,
  )? dayBuilder;
  final Color? selectedBackgroundColor;
  final Color? backgroundColor;
  final Color? selectedBackgroundColorBetween;
  final Color? disableBackgroundColor;
  final Color? dayDisableColor;
  final double radius;
  final TextStyle? textStyle;
  final List<DateSession> sessions;

  const DaysCustomWidget({
    Key? key,
    required this.month,
    required this.cleanCalendarController,
    required this.calendarCrossAxisSpacing,
    required this.calendarMainAxisSpacing,
    required this.dayBuilder,
    required this.selectedBackgroundColor,
    required this.backgroundColor,
    required this.selectedBackgroundColorBetween,
    required this.disableBackgroundColor,
    required this.dayDisableColor,
    required this.radius,
    required this.textStyle,
    required this.sessions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int monthPositionStartDay = (cleanCalendarController.weekdayStart -
            DateTime.daysPerWeek -
            DateTime(month.year, month.month).weekday)
        .abs();
    monthPositionStartDay = monthPositionStartDay > DateTime.daysPerWeek
        ? monthPositionStartDay - DateTime.daysPerWeek
        : monthPositionStartDay;

    final start = monthPositionStartDay == 7 ? 0 : monthPositionStartDay;

    return GridView.count(
      crossAxisCount: DateTime.daysPerWeek,
      physics: const NeverScrollableScrollPhysics(),
      addRepaintBoundaries: false,
      padding: EdgeInsets.zero,
      crossAxisSpacing: calendarCrossAxisSpacing,
      mainAxisSpacing: calendarMainAxisSpacing,
      shrinkWrap: true,
      children: List.generate(
          DateTime(month.year, month.month + 1, 0).day + start, (index) {
        if (index < start) return const SizedBox.shrink();
        final day = DateTime(month.year, month.month, (index + 1 - start));
        final text = (index + 1 - start).toString();

        bool isSelected = false;

        if (cleanCalendarController.rangeMinDate != null) {
          if (cleanCalendarController.rangeMinDate != null &&
              cleanCalendarController.rangeMaxDate != null) {
            isSelected = day
                    .isSameDayOrAfter(cleanCalendarController.rangeMinDate!) &&
                day.isSameDayOrBefore(cleanCalendarController.rangeMaxDate!);
          } else {
            isSelected =
                day.isAtSameMomentAs(cleanCalendarController.rangeMinDate!);
          }
        }

        Widget widget;

        final dayValues = DayValues(
          day: day,
          isFirstDayOfWeek: day.weekday == cleanCalendarController.weekdayStart,
          isLastDayOfWeek: day.weekday == cleanCalendarController.weekdayEnd,
          isSelected: isSelected,
          maxDate: cleanCalendarController.maxDate,
          minDate: cleanCalendarController.minDate,
          text: text,
          // selectedMaxDate: cleanCalendarController.rangeMaxDate,
          selectedMinDate: cleanCalendarController.rangeMinDate,
        );

        if (dayBuilder != null) {
          widget = dayBuilder!(context, dayValues);
        } else {
          widget = <Layout, Widget Function()>{
            Layout.BEAUTY: () => _beauty(context, dayValues),
          }[layout]!();
        }

        return GestureDetector(
          onTap: () {
            if (day.isBefore(cleanCalendarController.minDate) &&
                !day.isSameDay(cleanCalendarController.minDate)) {
              if (cleanCalendarController.onPreviousMinDateTapped != null) {
                cleanCalendarController.onPreviousMinDateTapped!(day);
              }
            } else if (day.isAfter(cleanCalendarController.maxDate)) {
              if (cleanCalendarController.onAfterMaxDateTapped != null) {
                cleanCalendarController.onAfterMaxDateTapped!(day);
              }
            } else {
              if (!cleanCalendarController.readOnly) {
                cleanCalendarController.onDayClick(day);
              }
            }
          },
          child: widget,
        );
      }),
    );
  }

  Widget _beauty(BuildContext context, DayValues values) {
    BorderRadiusGeometry? borderRadius;
    Color bgColor = Colors.transparent;
    TextStyle txtStyle =
        (textStyle ?? Theme.of(context).textTheme.bodyText1)!.copyWith(
      color: backgroundColor != null
          ? backgroundColor!.computeLuminance() > .5
              ? ColorsLimitless.greyDark
              : Colors.white
          : Theme.of(context).colorScheme.onSurface,
    );

    if (values.isSelected) {
      if (values.isFirstDayOfWeek) {
        borderRadius = BorderRadius.circular(radius);
      } else if (values.isLastDayOfWeek) {
        borderRadius = BorderRadius.only(
          topRight: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        );
      }

      if ((values.selectedMinDate != null &&
              values.day.isSameDay(values.selectedMinDate!)) ||
          (values.selectedMaxDate != null &&
              values.day.isSameDay(values.selectedMaxDate!))) {
        bgColor =
            selectedBackgroundColor ?? Theme.of(context).colorScheme.primary;
        txtStyle =
            (textStyle ?? Theme.of(context).textTheme.bodyText1)!.copyWith(
          color: selectedBackgroundColor != null
              ? selectedBackgroundColor!.computeLuminance() > .5
                  ? ColorsLimitless.greyDark
                  : Colors.white
              : Theme.of(context).colorScheme.onPrimary,
        );

        if (values.selectedMinDate == values.selectedMaxDate) {
          borderRadius = BorderRadius.circular(radius);
        } else if (values.selectedMinDate != null &&
            values.day.isSameDay(values.selectedMinDate!)) {
          borderRadius = BorderRadius.circular(radius);
        } else if (values.selectedMaxDate != null &&
            values.day.isSameDay(values.selectedMaxDate!)) {
          borderRadius = BorderRadius.only(
            topRight: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          );
        }
      } else {
        bgColor = selectedBackgroundColorBetween ??
            Theme.of(context).colorScheme.primary.withOpacity(.3);
        txtStyle =
            (textStyle ?? Theme.of(context).textTheme.bodyText1)!.copyWith(
          color:
              selectedBackgroundColor ?? Theme.of(context).colorScheme.primary,
        );
      }
    } else if (values.day.isSameDay(values.minDate)) {
    } else if (values.day.isBefore(values.minDate) ||
        values.day.isAfter(values.maxDate)) {
      txtStyle = (textStyle ?? Theme.of(context).textTheme.bodyText1)!.copyWith(
        color: dayDisableColor ??
            Theme.of(context).colorScheme.onSurface.withOpacity(.5),
      );
    }
    final sessionIndex = sessions.indexWhere((element) =>
        DateTime.parse(element.date!).day == values.day.day &&
        DateTime.parse(element.date!).month == month.month);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 40.h,
          width: 36.w,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  values.text,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: txtStyle,
                ),
                const SizedBox(height: 2),
                SizedBox(
                  height: 14,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: sessionIndex == -1 ? 0 : sessions[sessionIndex].mySessionsCount,
                            itemBuilder: (context, index) =>  Card(
                              shape:  const CircleBorder(),
                              color: values.isSelected ? Colors.white : ColorsLimitless.greyDark,
                              child: const Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2),

                              ),
                            )),
                            ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:  sessionIndex == -1 ? 0 : sessions[sessionIndex].creatorSessionsCount,
                            itemBuilder: (context, index) => const Card(
                              shape:   CircleBorder(),
                              color: ColorsLimitless.brandColor,
                              child:  Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2),

                              ),
                            )),
                      ],
                    ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
