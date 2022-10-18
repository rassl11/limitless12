import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../calendar/session/domain/exercise.dart';
import '../../../../../calendar/widgets/session/excercise_widget.dart';

class CoachInstructions extends StatelessWidget {
  const CoachInstructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/creator/info-circle.svg',
              width: 18.0.w,
              height: 18.0.w,
              fit: BoxFit.contain,
              color: ColorsLimitless.greyDark,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Coach Instructions',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 14.sp,
                  color: ColorsLimitless.greyDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Column(
          children: List.generate(4, (index) {
            return ExerciseWidget(
              index: index,
              quarterTurns: 3,
              exercises: const [],
            );
            // return _InstructionCard(
            //   index: index,
            //   blackSideContent:
            //       index.isEven ? index + 1 : '${index + 1}.Superset',
            // );
          }),
        ),
      ],
    );
  }
}

class _InstructionCard extends StatelessWidget {
  final int index;
  final dynamic blackSideContent;

  const _InstructionCard({
    Key? key,
    required this.index,
    required this.blackSideContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 17.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 24.w,
              decoration: BoxDecoration(
                color: const Color(
                    0xff353945), //    active color - color: Color(0xFF23262F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.r),
                  bottomLeft: Radius.circular(6.r),
                ),
              ),
              child: Center(
                child: blackSideContent is int
                    ? Text(
                        blackSideContent.toString(),
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 18.sp,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          blackSideContent,
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 14.sp,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 20.w,
                  bottom: 13.h,
                  left: 12.w,
                  top: 16.h,
                ),
                child: Column(
                  children: List.generate(index + 1, (indexs) {
                    return _InstructionItem(
                      index: indexs,
                      indexParent: index + 1,
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InstructionItem extends StatefulWidget {
  final int index;
  final int indexParent;

  const _InstructionItem({
    Key? key,
    required this.index,
    required this.indexParent,
  }) : super(key: key);

  @override
  State<_InstructionItem> createState() => _InstructionItemState();
}

class _InstructionItemState extends State<_InstructionItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isExpanded = !isExpanded),
      child: Container(
        margin: EdgeInsets.only(
            bottom: (widget.index < widget.indexParent - 1 ? 16 : 0).h),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 68.w,
              height: 68.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: Image.asset(
                  'assets/images/create_session/exercise_image.png',
                ),
              ),
            ),
            SizedBox(width: 11.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Db Bench Press',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 18.sp,
                      color: ColorsLimitless.greyDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  if (!isExpanded)
                    Text(
                      '3 x 12 @ 20 kg',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 14.sp,
                        color: const Color(0xffB1B5C4),
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  else
                    Text(
                      '''10 Jumping Jacks
10 Front to back leg swings, each leg
10 Side to side leg swings, each leg
10 Forward arm circles
10 Backward arm circles
10 Alternating quad stretches (hold 2-3 sec)
10 Alternating hamstring stretches (hold2-3 sec)
5 Inchworm Push-ups
For Completion''',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 12.sp,
                        color: const Color(0xffB1B5C4),
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
