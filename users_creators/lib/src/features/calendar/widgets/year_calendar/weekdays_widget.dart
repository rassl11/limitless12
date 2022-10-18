import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:scrollable_clean_calendar/utils/extensions.dart';

class WeekdaysCustomWidget extends StatelessWidget {
  final bool showWeekdays;
  final CleanCalendarController cleanCalendarController;
  final String locale;
  final Layout? layout;
  final TextStyle? textStyle;
  final Widget Function(BuildContext context, String weekday)? weekdayBuilder;

  const WeekdaysCustomWidget({
    Key? key,
    required this.showWeekdays,
    required this.cleanCalendarController,
    required this.locale,
    required this.layout,
    required this.weekdayBuilder,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!showWeekdays) return const SizedBox.shrink();

    return GridView.count(
      crossAxisCount: DateTime.daysPerWeek,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: List.generate(DateTime.daysPerWeek, (index) {
        final weekDay = cleanCalendarController.getDaysOfWeek(locale)[index];

        if (weekdayBuilder != null) {
          return weekdayBuilder!(context, weekDay);
        }

        return <Layout, Widget Function()>{
          Layout.BEAUTY: () => _beauty(context, weekDay)
        }[layout]!();
      }),
    );
  }

 

  Widget _beauty(BuildContext context, String weekday) {
    return Center(
      child: Text(
        weekday.capitalize(),
        style: textStyle ??
            Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: ColorsLimitless.greyMedium,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                ),
      ),
    );
  }
}
