import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/core/constants/validation.dart';
import 'package:users_creators/src/features/library/entity/domain/session_model.dart';

class SingleExerciseCardTemplate extends StatelessWidget {
  const SingleExerciseCardTemplate({Key? key, required this.exercise, required this.index})
      : super(key: key);
  final List<SessionExerciseModel> exercise;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 7.r),
              height: 85.r,
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 30.r),
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: GestureDetector(
                      child: Image.network(
                        youtubeImage(exercise[0].youtubeLink ?? ''),
                        height: 65.r,
                        width: 65.r,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('No photo');
                        },
                      ),
                      onTap: () {
                    
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.r,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${exercise[0].title}",
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontSize: 16.sp,
                              color: ColorsLimitless.textColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8.r),
                        Text(
                          '${exercise[0].sets!.length} x ${exercise[0].sets![0].repeats} @ ${exercise[0].sets![0].weight} kg',
                          style: TextStyle(
                              fontFamily: 'SF Pro',
                              color: ColorsLimitless.greyLight,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 4.r),
                        Text(
                          'Working Max: ${exercise[0].repMax}',
                          style: TextStyle(
                              fontFamily: 'SF Pro',
                              color: ColorsLimitless.greyLight,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ]),
              )),
        ),
        Positioned.fromRelativeRect(
          rect: RelativeRect.fromLTRB(1, 1, 0.73.sw, 1),
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF353945),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7.r), bottomLeft: Radius.circular(7.r))),
              child: Center(
                  child: RotatedBox(
                quarterTurns: 0,
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF Pro',
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp),
                ),
              ))),
        ),
      ],
    );
  }
}
