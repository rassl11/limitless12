import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';

import 'calculator/buttons.dart';

class AddRounds extends StatefulWidget {
  const AddRounds({Key? key, required this.exerciseList, required this.onTap})
      : super(key: key);

  final List<Exercises> exerciseList;
  final Function onTap;

  @override
  State<AddRounds> createState() => _AddRoundsState();
}

class _AddRoundsState extends State<AddRounds> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.r),
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 20.r,
                ),
                SvgPicture.asset('assets/icons/training_session/rectangle.svg'),
                SizedBox(
                  height: 15.r,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Rounds',
                        style: TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 14.sp,
                            color: ColorsLimitless.textColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    GestureDetector(
                        child: SvgPicture.asset(
                            'assets/icons/training_session/minus.svg'),
                        onTap: () {
                          if (widget.exerciseList[0].round! > 1) {
                            widget.exerciseList[0].round =
                                widget.exerciseList[0].round! - 1;
                            widget.onTap();
                            setState(() {});
                          }
                        }),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.r),
                      child: Container(
                        width: 70.r,
                        height: 42.r,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE4E6EA)),
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Center(
                          child: Text(
                            '${widget.exerciseList[0].round}',
                            style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: ColorsLimitless.textColor),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/icons/training_session/plus.svg'),
                      onTap: () {
                        widget.exerciseList[0].round =
                            widget.exerciseList[0].round! + 1;
                        widget.onTap();
                        setState(() {});
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.r,
                ),
                const CalculatorButtons()
              ],
            )));
  }
}
