import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/library/bloc/workout_popup/bloc_workout.dart';
import 'package:users_creators/src/features/library/bloc/workout_popup/user_popup_event.dart';
import 'package:users_creators/src/features/library/entity/model/library/workout_popup.dart';
import 'package:users_creators/src/features/library/ui/widgets/workout_popup_list.dart';

class AddToCalendar extends StatelessWidget {
  const AddToCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: GestureDetector(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: Colors.white),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.r, vertical: 20.r),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 33.r,
                            width: 33.r,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF353945)),
                            child: Center(
                              child: Text(
                                "JD",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.r,
                          ),
                          Text(
                            'Week 4 day 3',
                            style: TextStyle(
                                color: const Color(0xFF353945),
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                      ListView.builder(
                          padding: EdgeInsets.only(bottom: 20.r),
                          shrinkWrap: true,
                          itemCount: workOutPopup.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              child: WorkOutPopupList(
                                index: index,
                              ),
                              onTap: () {},
                            );
                          })),
                      Material(
                        borderRadius: BorderRadius.circular(6.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(6.r),
                          splashFactory: InkRipple.splashFactory,
                          splashColor: const Color(0xFFBA4454),
                          child: Ink(
                            padding: EdgeInsets.zero,
                            height: 0.055.sh,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: const Color(0xFFE94359)),
                            child: Center(
                              child: Text(
                                'Add to Calendar',
                                style: TextStyle(
                                    color: const Color(0xFFFCFCFD),
                                    fontFamily: "SF Pro",
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                          onTap: () {
                            context
                                .read<UserWorkoutBloc>()
                                .add(CloseWorkoutEvent());
                          },
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
              top: 20.r,
              right: 20.r,
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/icons/workout_popup/close.svg',
                  height: 19.r,
                ),
                onTap: () {
                  context.read<UserWorkoutBloc>().add(CloseWorkoutEvent());
                },
              ),
            ),
          ],
        )
      ])),
    );
  }
}
