import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/library/entity/model/library/calendar_model.dart';
import 'package:users_creators/src/features/training_session/bloc/calculator/wight_cubit.dart';
import 'package:users_creators/src/features/training_session/entity/calculator_model.dart';

class CalculatorList extends StatelessWidget {
  const CalculatorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, int>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(top: 19.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Color(0xFFF7F9FB)),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: calculatorList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4.5, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15.r),
                    child: SizedBox(
                      width: 100.r,
                      child: RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: '${calculatorList[index].procent}%  =  ',
                              style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                  color: ColorsLimitless.textColor,
                                  fontSize: 13.sp),
                            ),
                            TextSpan(
                              text: '${state * calculatorList[index].procent~/100} kg',
                              style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w600,
                                  color: ColorsLimitless.textColor,
                                  fontSize: 13.sp),
                            )
                          ])),
                    ),
                  ),
                  index != calendarList.length - 1 &&
                          index != calendarList.length
                      ? Divider(
                          thickness: 0.5,
                          indent: 20.r,
                          endIndent: 20.r,
                        )
                      : const SizedBox()
                ],
              );
            },
          ),
        );
      },
    );
  }
}
