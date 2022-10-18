import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';

import '../../../bloc/create_session/create_session_bloc.dart';
import '../../../bloc/create_session/create_session_event.dart';

Future<void> showWorkingMaxDialog(
    BuildContext context, ExerciseViewModel exercise) async {
  showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFF142A4B).withOpacity(0.25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Center(
              child: WorkingMaxDialog(exercise: exercise),
            ),
          ),
        );
      });
}

class WorkingMaxDialog extends StatefulWidget {
  final ExerciseViewModel? exercise;

  const WorkingMaxDialog({Key? key, this.exercise}) : super(key: key);

  @override
  State<WorkingMaxDialog> createState() => _WorkingMaxDialogState();
}

class _WorkingMaxDialogState extends State<WorkingMaxDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        contentPadding: EdgeInsets.only(top: 7.r, bottom: 3.r),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.r, right: 16.r, bottom: 18.r, top: 10.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child:
                          SvgPicture.asset('assets/icons/settings/close.svg'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 28.r,
                ),
                Text(
                  'A.Db Bench Press',
                  style: TextStyle(
                      color: ColorsLimitless.greyDark,
                      fontFamily: 'SF Pro',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  'Working Max',
                  style: TextStyle(
                      fontFamily: "SF Pro",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5),
                ),
                SizedBox(
                  height: 10.r,
                ),
                SizedBox(
                  width: 0.6.sw,
                  child: Text(
                    'This is how much you can lift for 1 rep, and is used for percentage-based weight in your programming',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xFF353945),
                        height: 1.5,
                        fontFamily: 'SF Pro',
                        fontSize: 13.sp,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 30.r,
                ),
                SizedBox(
                  height: 35.r,
                  width: 90.r,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: controller,
                    autofocus: false,
                    cursorColor: ColorsLimitless.textColor,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 0.r),
                      filled: true,
                      hintStyle: TextStyle(
                          color: ColorsLimitless.greyLight,
                          fontFamily: 'SF Pro',
                          fontSize: 11.sp,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400),
                      hintMaxLines: 1,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                            width: 1, color: ColorsLimitless.brandColor),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1,
                              color:
                                  ColorsLimitless.greyLight.withOpacity(0.3))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.r,
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
                                'Save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Sf",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                          onTap: () {
                            if (widget.exercise == null ||
                                controller.text.trim().isEmpty) return;

                            context.read<CreateSessionBloc>().add(
                                  SetWorkingMaxEvent(
                                    exerciseId: widget.exercise!.exerciseId,
                                    groupId: widget.exercise!.groupId,
                                    repMax: int.parse(controller.text),
                                  ),
                                );
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
      ),
    );
  }
}
