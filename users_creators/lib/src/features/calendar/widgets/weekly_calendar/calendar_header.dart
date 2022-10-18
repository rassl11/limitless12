import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/calendar/bloc/calendar_bloc.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({Key? key, required this.onTap}) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
      return state.map(
        loaded: (value) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 5.r),
              child: SafeArea(
                top: true,
                bottom: false,
                child: Row(
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        child: Row(
                          children: [
                            Text(
                              DateFormat('MMMM', 'en').format(DateTime(
                                  value.selectedYear, value.selectedMonth)),
                              style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 8.r,
                            ),
                            SvgPicture.asset(
                              'assets/icons/calendar_header/arrow_down.svg',
                              height: 15.r,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        context.router.navigateNamed('/year-calendar-screen');
                      },
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    InkWell(
                      onTap: () => onTap(),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                                width: 1, color: ColorsLimitless.greyLight)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.r, vertical: 6.r),
                          child: Center(
                            child: Text(
                              'Today',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsLimitless.greyDark),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    SvgPicture.asset(
                      'assets/icons/calendar_header/alarm.svg',
                      height: 24.r,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        loading: (Loading value) {
          return const AppLoadingWidget();
        },
      );
    });
  }
}
