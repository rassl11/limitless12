import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/calendar/session/domain/exercise.dart';

class ExerciseWidget extends StatelessWidget {
  final List<Exercise> exercises;
  final int quarterTurns;
  final int index;

  const ExerciseWidget(
      {Key? key, required this.exercises, required this.quarterTurns, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: exercises.length * 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: exercises.length * 100,
                  width: 20.r,
                  decoration: BoxDecoration(
                      color: const Color(0xFF353945),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.r), bottomLeft: Radius.circular(5.r))),
                  child: Center(
                      child: RotatedBox(
                    quarterTurns: quarterTurns,
                    child: Text(
                      exercises.length == 1
                          ? '${index + 1}'
                          : exercises.length == 2
                              ? '${index + 1}.Superset'
                              : exercises.length == 3
                                  ? '${index + 1} .Triset'
                                  : '${index + 1} .Circuit',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF Pro',
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp),
                    ),
                  ))),
              SizedBox(
                width: 11.r,
              ),
              Expanded(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: exercises.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: exercises[i].imageUrl != null
                                  ? Image.network(
                                      exercises[i].imageUrl!,
                                      height: 70,
                                      width: 80,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    )
                                  : Container(
                                      height: 70,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: ColorsLimitless.backgroundColor,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.image,
                                        color: ColorsLimitless.greyDark,
                                      )),
                                    ),
                            ),
                            SizedBox(
                              width: 10.r,
                            ),
                            Flexible(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  overflow: TextOverflow.fade,
                                  exercises[i].title!,
                                  softWrap: false,
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 16.sp,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 6.r,
                                ),
                                Text(
                                  '${exercises[i].sets!.length} x ${exercises[i].sets![0].repeats} @ ${exercises[i].sets![0].weight} kg',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 13.sp,
                                      letterSpacing: 1,
                                      color: const Color(0xFFB1B5C3)),
                                )
                              ],
                            )),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
