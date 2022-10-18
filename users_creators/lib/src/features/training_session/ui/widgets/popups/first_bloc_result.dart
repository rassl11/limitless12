import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/entity/workout_result.dart';

class FirstBloc extends StatelessWidget {
  const FirstBloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50.r,
        child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 50.r,
              );
            },
            itemCount: workoutResultList[0].results.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    '${workoutResultList[0].results[index]}',
                    style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 24.sp,
                        fontStyle: FontStyle.italic,
                        color: ColorsLimitless.textColor,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 4.r,
                  ),
                  Text(
                    workoutResultList[0].category[index],
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
