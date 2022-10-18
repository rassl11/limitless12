import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';

class TrainingPreVideo extends StatelessWidget {
  const TrainingPreVideo({
    Key? key,
    required this.exerciseList,
    required this.instruction
  }) : super(key: key);

  final List<Exercises> exerciseList;
  final bool instruction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.r,vertical: 18.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
            width: 0.9.sw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        instruction == true ?
                        exerciseList[0].title ?? 'no title' : 
                        exerciseList[0].title ?? 'no title',
                        style: TextStyle(
                            color: ColorsLimitless.greyDark,
                            fontFamily: 'SF Pro',
                            letterSpacing: 0.5,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                        'assets/icons/workout_popup/close.svg',
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                
                SizedBox(
                  height: 15.r,
                ),
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.r),
                      child: Image.network(
                        exerciseList[0].imageUrl ?? '',
                        height: 200.r,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 0.3.sh,
                            width: 1.sw.r,
                            decoration: BoxDecoration(
                                color: ColorsLimitless.backgroundColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                                child: Icon(
                              Icons.image,
                              color: ColorsLimitless.greyDark,
                            )),
                          );
                        },
                      )),
                ),
                instruction == true ?
                Center(
                  child: SizedBox(
                    width: 0.7.sw,
                    child: Text(
                      exerciseList[0].title ?? 'no instruction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "SF Pro",
                          fontSize: 13.sp,
                          height: 1.8,
                          color: ColorsLimitless.textColor,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5),
                    ),
                  ),
                ) : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
