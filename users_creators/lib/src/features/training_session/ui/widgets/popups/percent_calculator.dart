import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/training_session/bloc/calculator/custom_percent_cubit.dart';
import 'package:users_creators/src/features/training_session/bloc/calculator/wight_cubit.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/calculator/calculator_list.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/calculator/highest_weight.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/calculator/repetitions.dart';

import '../calculator/custom_percentage.dart';

class PercentCalculator extends StatelessWidget {
  const PercentCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, int>(
      builder: (context, stateWeight) {
        return BlocBuilder<CustomPercentCubit, int>(
          builder: (context, statePercent) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Calculated 1 Rep Max',
                                style: TextStyle(
                                    fontFamily: "SF Pro",
                                    fontSize: 18.sp,
                                    color: ColorsLimitless.textColor,
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
                        const HighestWeight(),
                        SizedBox(
                          height: 20.r,
                        ),
                        const Repetitions(),
                        SizedBox(
                          height: 20.r,
                        ),
                        const CalculatorList(),
                        SizedBox(
                          height: 20.r,
                        ),
                        const CustomPersentage(),
                        SizedBox(
                          height: 8.r,
                        ),
                        Align(
                            alignment: const FractionalOffset(0.78, 0),
                            child: Text(
                              '= ${(stateWeight * statePercent) ~/ 100} kg',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                  color: ColorsLimitless.greyMedium,
                                  fontSize: 12.sp),
                            ))
                      ],
                    ),
                  ),
                ),
                ]),
            );
          },
        );
      },
    );
  }
}
