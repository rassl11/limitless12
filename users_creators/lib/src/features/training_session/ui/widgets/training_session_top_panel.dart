import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_state.dart';


class TrainingSessionTopPanel extends StatelessWidget {
  const TrainingSessionTopPanel({Key? key, required this.exerciseLength})
      : super(key: key);

  final int exerciseLength;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeIndicatorLengthBloc, ChangeIndicatorLengthState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(bottom: 10.r, top: 5.r),
          color: Colors.white,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.r),
              child: Row(
                children: [
                  GestureDetector(
                    child: Text(
                      'Exit',
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 12.sp,
                          color: ColorsLimitless.greyMedium,
                          fontWeight: FontWeight.w700),
                    ),
                    onTap: (){
                      context.router.pop();
                    },
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    '${state.exerciseNumber}/$exerciseLength',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorsLimitless.textColor),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    child: SvgPicture.asset(
                        'assets/icons/training_session/task.svg'),
                    onTap: () {
                      // context.router.navigateNamed('/exerceise-settings-page');
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
