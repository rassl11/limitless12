import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/exercise_filter_popup.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/swap/all_exercise_swap.dart';

class ExcerciseListSwap extends StatefulWidget {
  const ExcerciseListSwap({Key? key, required this.onTap}) : super(key: key);

  final Function onTap;

  @override
  State<ExcerciseListSwap> createState() => _ExcerciseListSwapState();
}

class _ExcerciseListSwapState extends State<ExcerciseListSwap> {
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (_) => GestureDetector(
              child: Container(
                color: Color(0xFF142A4B).withOpacity(0.35),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: CupertinoAlertDialog(
                    title: const Text('Swap Exercise?'),
                    content: Column(
                      children: [
                        SizedBox(
                          height: 2.r,
                        ),
                        Text(
                          'Barbel Split Squat',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            letterSpacing: 0.5,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Text(
                          'If you swap an exercise with values logged, you may lose your data for that exercise.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            letterSpacing: 0.5,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(
                        textStyle: TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                        onPressed: () {
                          context.router.navigateBack();
                        },
                        child: const Text('No thanks'),
                      ),
                      CupertinoDialogAction(
                        textStyle: TextStyle(
                          fontFamily: "SF Pro",
                          fontSize: 14.sp,
                          color: CupertinoDynamicColor.resolve(
                              CupertinoColors.systemBlue, _),
                        ),
                        isDestructiveAction: true,
                        onPressed: () {
                          context.router.navigateBack();
                        },
                        child: const Text('Yes!'),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(14.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Exercise type',
                        style: TextStyle(
                            color: ColorsLimitless.greyDark,
                            fontFamily: 'SF Pro',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 14.r,
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              child: AllExerciseSwap(
                                onTapInfo: widget.onTap,
                              ),
                              onTap: () {
                                _showAlertDialog(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 40.r,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 5.r, top: 12.r, bottom: 12.r),
                              child: SvgPicture.asset(
                                'assets/icons/discover/search.svg',
                                color: ColorsLimitless.greyLight,
                              ),
                            ),
                            filled: true,
                            fillColor:
                                ColorsLimitless.greyLight.withOpacity(0.2),
                            hintText: 'Search exercises',
                            hintStyle: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 13.sp,
                                letterSpacing: 0.5,
                                color: ColorsLimitless.greyLight,
                                fontWeight: FontWeight.w400),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                borderSide: BorderSide(
                                  width: 1,
                                )),
                          ),
                        )),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          context: context,
                          builder: (_) {
                            return const ExerciseFilterPopUp();
                          },
                        );
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/create_session/sort.svg',
                        color: ColorsLimitless.greyDark,
                        height: 24.r,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
