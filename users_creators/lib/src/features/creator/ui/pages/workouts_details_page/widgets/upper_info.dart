import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpperInfoBlock extends StatelessWidget {
  const UpperInfoBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 173.h,
      child: Row(
        children: [
          Container(
            width: 106.w,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/creator/trainer_photo.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MONSTER tuesday! GLUTES + HAMSTRING',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16.sp,
                    height: 1.4,
                    color: ColorsLimitless.greyDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                const _IconText(
                  img: 'assets/icons/creator/TimeClockCircleCreatorWorkout.svg',
                  text: '45 mins',
                ),
                SizedBox(height: 6.h),
                const _IconText(
                  img: 'assets/icons/creator/chart.svg',
                  text: 'Advanced',
                ),
                SizedBox(height: 6.h),
                const _IconText(
                  img: 'assets/icons/creator/icons8-barbell 1.svg',
                  text: 'Free Weights',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final String img;
  final String text;

  const _IconText({
    Key? key,
    required this.img,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          img,
          width: 16.0.w,
          height: 16.0.w,
          fit: BoxFit.contain,
          color: const Color(0xff777E91),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 10.sp,
              height: 1.4,
              color: const Color(0xff777E91),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
