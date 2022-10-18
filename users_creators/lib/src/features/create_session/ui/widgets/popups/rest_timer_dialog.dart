import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_event.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/timer_text_field.dart';

import '../../../entity/rest_timer_model.dart';

Future<void> showRestIntervalDialog(
    BuildContext context, ExerciseViewModel exercise) async {
  showDialog(
      useSafeArea: false,
      barrierColor: const Color(0xFF142A4B).withOpacity(0.25),
      context: context,
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF142A4B).withOpacity(0.25),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Center(
                  child: RestTimerDialog(
                    exercise: exercise,
                  ),
                )));
      });
}

class RestTimerDialog extends StatefulWidget {
  const RestTimerDialog({Key? key, required this.exercise}) : super(key: key);
  final ExerciseViewModel exercise;

  @override
  State<RestTimerDialog> createState() => _RestTimerDialogState();
}

class _RestTimerDialogState extends State<RestTimerDialog> {
  int quickStartIndex = 2;
  int restIntervalSec = 60;

  final TextEditingController minutes = TextEditingController();

  final TextEditingController seconds = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        contentPadding: EdgeInsets.only(top: 7.r, bottom: 3.r),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
            padding: EdgeInsets.only(top: 18.r, right: 14.r, left: 14.r,bottom: 18.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Rest timer',
                            style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: ColorsLimitless.textColor),
                          ),
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(
                              'assets/icons/workout_popup/close.svg'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.r,
                    ),
                    Text(
                      'Quick Start (min)',
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 12.sp,
                          color: ColorsLimitless.greyMedium,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5),
                    ),
                    SizedBox(
                      height: 15.r,
                    ),
                    Wrap(
                        spacing: 8.r,
                        children: List.generate(restTimerModel.length, (index) {
                          return GestureDetector(
                            child: Container(
                                height: 50.r,
                                width: 52.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  border: Border.all(
                                      color: quickStartIndex == index
                                          ? ColorsLimitless.brandColor
                                          : ColorsLimitless.greyLight),
                                ),
                                child: Center(
                                  child: Text(
                                    '${restTimerModel[index].minutes}:${restTimerModel[index].seconds}',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro',
                                        fontSize: 12.sp,
                                        color: ColorsLimitless.textColor,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )),
                            onTap: () {
                              setState(() {
                                quickStartIndex = index;
                                restIntervalSec = int.parse(
                                            restTimerModel[index].minutes) *
                                        60 +
                                    int.parse(restTimerModel[index].seconds);
                              });
                            },
                          );
                        })),
                    SizedBox(
                      height: 40.r,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Customize (min)',
                          style: TextStyle(
                              fontFamily: 'SF Pro',
                              letterSpacing: 0.5,
                              fontSize: 13.sp,
                              color: ColorsLimitless.greyMedium,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 50.r,
                        ),
                        TimerField(
                            controller: minutes,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Empty';
                              }
                              return null;
                            }),
                        SizedBox(
                          width: 5.r,
                        ),
                        Text(
                          ':',
                          style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontSize: 14.sp,
                              color: ColorsLimitless.greyLight,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 5.r,
                        ),
                        TimerField(
                            controller: seconds,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Empty';
                              }
                              return null;
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 20.r,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Material(
                            borderRadius: BorderRadius.circular(6.r),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6.r),
                              child: Ink(
                                height: 37.r,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    border: Border.all(
                                        color: ColorsLimitless.greyLight
                                            .withOpacity(0.5)),
                                    color: Colors.white),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Sf",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.r,
                        ),
                        Expanded(
                          child: Material(
                            borderRadius: BorderRadius.circular(6.r),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6.r),
                              child: Ink(
                                height: 37.r,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: ColorsLimitless.brandColor),
                                child: Center(
                                  child: Text(
                                    'Set',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Sf",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (minutes.text.isNotEmpty &&
                                    seconds.text.isNotEmpty) {
                                  restIntervalSec =
                                      int.parse(minutes.text) * 60 +
                                          int.parse(seconds.text);
                                  context.read<CreateSessionBloc>().add(
                                      SetExerciseRestIntervalEvent(
                                          groupId: widget.exercise.groupId,
                                          restInterval: restIntervalSec));
                                } else {
                                  context.read<CreateSessionBloc>().add(
                                      SetExerciseRestIntervalEvent(
                                          groupId: widget.exercise.groupId,
                                          restInterval: restIntervalSec));
                                }
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          
        );
  }
}
