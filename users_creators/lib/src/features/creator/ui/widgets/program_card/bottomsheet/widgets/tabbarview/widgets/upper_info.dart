import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgramUpperInfoBlock extends StatelessWidget {
  const ProgramUpperInfoBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 172.h,
      child: Row(
        children: [
          Container(
            width: 108.w,
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
                SizedBox(height: 4.h),
                const _IconText(
                  img: 'assets/icons/creator/Calendar_creator_program.svg',
                  text: '7 days',
                ),
                SizedBox(height: 16.h),
                const _IconText(
                  img:
                      'assets/icons/creator/SynchronizeArrowsSquare_creator_program.svg',
                  text: '4 Weeks',
                ),
                SizedBox(height: 16.h),
                const _IconText(
                  img:
                      'assets/icons/creator/TrendsHotFlame_creator_program.svg',
                  text: 'Advance',
                ),
                SizedBox(height: 16.h),
                const _IconText(
                  img:
                      'assets/icons/creator/FitnessDumbbellLift_creator_program.svg',
                  text: 'Fundamentals',
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
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 16.sp,
              color: const Color(0xff353945),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
