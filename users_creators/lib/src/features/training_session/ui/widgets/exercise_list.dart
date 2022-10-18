import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/training_session/entity/exercise_model.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({Key? key, required this.indexOfCard}) : super(key: key);

  final int indexOfCard;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE6E8EC)),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.r,
              ),
              ListView.builder(
                  padding: EdgeInsets.only(top: 4.r),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: trainingExerciseList[indexOfCard].name.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, ind) {
                    return ExerciseListAllCards(
                      indexOfCard: indexOfCard,
                      ind: ind,
                    );
                  }),
            ],
          ),
        ),
        Positioned(
            bottom: 4.r,
            left: 32.r,
            child: trainingExerciseList[indexOfCard].status == 'record'
                ? SvgPicture.asset('assets/icons/training_session/record.svg')
                : trainingExerciseList[indexOfCard].status == 'swap'
                    ? SvgPicture.asset('assets/icons/training_session/swap.svg')
                    : trainingExerciseList[indexOfCard].status == 'dismiss'
                        ? SvgPicture.asset(
                            'assets/icons/training_session/dismiss.svg')
                        : const SizedBox()),
        Positioned(
          top: 12.r,
          right: 15.r,
          child: GestureDetector(
            child: SvgPicture.asset(
              'assets/icons/creator/settings.svg',
              height: 20.r,
            ),
            // onTapDown: (TapDownDetails details) {
            //   _showPopupMenu(context, details.globalPosition);
            // },
          ),
        ),
        Positioned.fromRelativeRect(
          rect: RelativeRect.fromLTRB(1, 1, 0.86.sw, 1),
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF353945),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7.r),
                      bottomLeft: Radius.circular(7.r))),
              child: Center(
                  child: RotatedBox(
                quarterTurns:
                    trainingExerciseList[indexOfCard].number.length == 1
                        ? 0
                        : 3,
                child: Text(
                  trainingExerciseList[indexOfCard].number,
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

class ExerciseListAllCards extends StatelessWidget {
  const ExerciseListAllCards(
      {Key? key, required this.indexOfCard, required this.ind})
      : super(key: key);

  final int indexOfCard;
  final int ind;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 33.r, bottom: 10.r),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Image.asset(
                    trainingExerciseList[indexOfCard].image[ind],
                    height: 65.r,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  width: 10.r,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trainingExerciseList[indexOfCard].name[ind],
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 16.sp,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.r,
                    ),
                    trainingExerciseList[indexOfCard].details == null
                        ? const Text(
                            '-',
                            style: TextStyle(
                              color: Color(0xFFB1B5C3),
                            ),
                          )
                        : Text(
                            trainingExerciseList[indexOfCard].details![ind],
                            style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 12.sp,
                                letterSpacing: 1,
                                color: const Color(0xFFB1B5C3)),
                          ),
                    SizedBox(
                      height: 10.r,
                    ),
                    trainingExerciseList[indexOfCard].record != null
                        ? Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/training_session/kubok.svg'),
                              SizedBox(
                                width: 4.r,
                              ),
                              Text(
                                'New Rep Max',
                                style: TextStyle(
                                    fontFamily: "SF Pro",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1BB266)),
                              ),
                            ],
                          )
                        : SizedBox()
                  ],
                ),
                SizedBox(
                  width: 10.r,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
