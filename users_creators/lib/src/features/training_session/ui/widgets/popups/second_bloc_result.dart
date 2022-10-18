import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/training_session/entity/workout_result_minutes.dart';

class SecondBloc extends StatelessWidget {
  const SecondBloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 15.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: const Color(0xFFF7F9FB),
      ),
      height: 95.r,
      child: Center(
        child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 50.r,
              );
            },
            itemCount: workoutResultMinutes[0].name.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                      workoutResultMinutes[0].icon[index]),
                  Text(
                    workoutResultMinutes[0].result[index],
                    style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 12.sp,
                        color: ColorsLimitless.textColor,
                        fontWeight: FontWeight.w700),
                  ),
                
                  Text(
                    workoutResultMinutes[0].name[index],
                    style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 11.sp,
                        color: ColorsLimitless.greyMedium,
                        letterSpacing: 0.5),
                  )
                ],
              );
            }),
      ),
    );
  }
}

