import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../questionnaire/widgets/close_icon.dart';

showProgramOnboardingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: const [
                    _MainBody(),
                    CloseIcon(),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

class _MainBody extends StatefulWidget {
  const _MainBody({Key? key}) : super(key: key);

  @override
  State<_MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<_MainBody> {
  final daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  final selectedDaysOfWeek = <String>[];
  final int selectedDaysLimit = 5;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .9,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(
          left: 20.r,
          right: 20.r,
          bottom: 21.r,
          top: 24.r,
        ),
        margin: EdgeInsets.symmetric(horizontal: 12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Program Onboarding',
              style: TextStyle(
                color: ColorsLimitless.greyDark,
                fontSize: 16.sp,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 21.h),
            Text(
              'Choose your weekly structure',
              style: TextStyle(
                color: ColorsLimitless.greyDark,
                fontSize: 16.sp,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '${selectedDaysOfWeek.length}/$selectedDaysLimit selected',
              style: TextStyle(
                color: const Color(0xffE94359),
                fontSize: 16.sp,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w700,
              ),
            ),
            ...List.generate(daysOfWeek.length, (index) {
              final day = daysOfWeek[index];

              return Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Material(
                  borderRadius: BorderRadius.circular(6.r),
                  elevation: 0.0,
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6.r),
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      setState(() {
                        if (!selectedDaysOfWeek.contains(day) &&
                            selectedDaysOfWeek.length < selectedDaysLimit) {
                          selectedDaysOfWeek.add(day);
                        } else {
                          selectedDaysOfWeek.remove(day);
                        }
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Colors.transparent,
                        border: Border.all(
                          color: const Color(0xFFE6E8EC),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            day,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsLimitless.greyDark,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/creator/${selectedDaysOfWeek.contains(day) ? 'creator_program_checkbox_checked' : 'creator_program_checkbox_cempty'}.svg',
                            width: 18.w,
                            height: 18.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: 25.h),
            Material(
              borderRadius: BorderRadius.circular(6.r),
              child: InkWell(
                onTap: selectedDaysOfWeek.isEmpty ? null : () {},
                borderRadius: BorderRadius.circular(6.r),
                splashFactory: InkRipple.splashFactory,
                splashColor: const Color(0xFFBA4454),
                child: Ink(
                  padding: EdgeInsets.zero,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: selectedDaysOfWeek.isEmpty
                        ? const Color(0xffECAAAA)
                        : const Color(0xFFE94359),
                  ),
                  child: Center(
                    child: Text(
                      'Schedule start',
                      style: TextStyle(
                        color: const Color(0xFFFCFCFD),
                        fontFamily: "SF Pro",
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
