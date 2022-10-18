import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/creator/entity/workout_model.dart';

class WorkoutList extends StatelessWidget {
  final int index;

  const WorkoutList({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = workoutList[index].image;

    if (image == null) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 58.r),
        decoration: BoxDecoration(
          color: const Color(0xFFE6E8EC),
          borderRadius: BorderRadius.circular(6.r),
        ),
      );
    }

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 160.w,
        padding: EdgeInsets.all(12.h),
        foregroundDecoration: index == 0
            ? null
            : const BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
              ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(.6),
              BlendMode.softLight,
            ),
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: (160 * .7).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'My Tiktok workouts',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '16 workouts inside',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  color: const Color(0xFFB1B5C4),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
