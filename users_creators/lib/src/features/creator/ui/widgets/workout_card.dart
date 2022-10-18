import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/creator/entity/workout_model.dart';

class WorkoutCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLimitedAccess;

  const WorkoutCardWidget({
    Key? key,
    required this.onTap,
    required this.isLimitedAccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 116.h,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: Colors.grey[100]!),
          ),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(12.0.w),
            child: Row(
              children: [
                Container(
                  width: 73.w,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              SvgPicture.asset(
                                'assets/icons/creator/workout_calendar.svg',
                                fit: BoxFit.contain,
                                width: 20.0.w,
                                height: 20.0.h,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Juicy glute workout',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: const Color(0xFF23262F),
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          const _CardBottomRow(
                            value: 'Advance',
                            img:
                                'assets/icons/creator/TrendsHotFlameCreatorWorkout.svg',
                          ),
                          SizedBox(width: 16.w),
                          const _CardBottomRow(
                            value: '30 min',
                            img:
                                'assets/icons/creator/TimeClockCircleCreatorWorkout.svg',
                          ),
                          SizedBox(width: 16.w),
                          const _CardBottomRow(
                            value: '0',
                            img:
                                'assets/icons/creator/MessagesButtbleCreatorWorkout.svg',
                          ),
                        ],
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
