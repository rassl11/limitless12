import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../entity/workout_model.dart';

class ProgramCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback? onTapBtn;
  final bool isLimitedAccess;

  const ProgramCardWidget({
    Key? key,
    required this.onTap,
    this.onTapBtn,
    required this.isLimitedAccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 203.h,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: Row(
              children: [
                Container(
                  width: 95.w,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    image: DecorationImage(
                      image: AssetImage(workoutList.first.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isLimitedAccess) ...[
                                SvgPicture.asset(
                                  'assets/icons/creator/workout_lock.svg',
                                  fit: BoxFit.cover,
                                  width: 16.0.w,
                                  height: 16.0.h,
                                ),
                                SizedBox(width: 4.w),
                              ],
                              Text(
                                isLimitedAccess
                                    ? 'Limitless One'
                                    : 'Free Access',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF777E91),
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Pro Full Body',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: const Color(0xFF23262F),
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              const _CardBottomRow(
                                value: 'Advance',
                                img:
                                    'assets/icons/creator/TrendsHotFlameCreatorWorkout.svg',
                              ),
                              SizedBox(width: 16.w),
                              const _CardBottomRow(
                                value: '4 weeks',
                                img:
                                    'assets/icons/creator/CalendarSevenCreatorProgram.svg',
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Material(
                        borderRadius: BorderRadius.circular(6.r),
                        child: InkWell(
                          onTap: onTapBtn,
                          borderRadius: BorderRadius.circular(6.r),
                          splashFactory: InkRipple.splashFactory,
                          splashColor: const Color(0xFFBA4454),
                          child: Ink(
                            padding: EdgeInsets.zero,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: const Color(0xFFE94359),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/creator/CalendarCheckCreatorProgram.svg',
                                  fit: BoxFit.cover,
                                  width: 16.0.w,
                                  height: 16.0.h,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Weekly structure',
                                  style: TextStyle(
                                    color: const Color(0xFFFCFCFD),
                                    fontFamily: "SF Pro",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardBottomRow extends StatelessWidget {
  final String value;
  final String img;

  const _CardBottomRow({
    Key? key,
    required this.value,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          img,
          fit: BoxFit.cover,
          width: 12.0.w,
          height: 12.0.h,
        ),
        SizedBox(width: 4.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            color: const Color(0xFF777E91),
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
