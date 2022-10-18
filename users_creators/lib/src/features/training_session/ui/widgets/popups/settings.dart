import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_event.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/exercise_popup_menu.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/percent_calculator.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/pre_video.dart';

class SettingsTraining extends StatelessWidget {
  const SettingsTraining({
    Key? key,
    required this.superSet,
    required this.exerciseList,
    required this.indexOfCard,
  }) : super(key: key);

  final bool superSet;
  final int indexOfCard;
  final List<Exercises> exerciseList;

  Future<void> _showInstruction(BuildContext context) async {
    return showDialog<void>(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: const Color(0xFF142A4B59).withOpacity(0.25),
            child: TrainingPreVideo(
              instruction: true,
              exerciseList: exerciseList,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('assets/icons/training_session/frame.svg'),
            SizedBox(
              height: 5.r,
            ),
            GestureDetector(
              child: Text(
                'Swap',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsLimitless.textColor),
              ),
              onTap: () {
                context.read<ExerciseListBloc>().add(ExerciseLoadEvent());
                context.router.push(ExerciseListPageRoute(
                    indexOfExercise: indexOfCard, trainingSessionPart: true, swap: true));
                Navigator.pop(context);
              },
            ),
            const Divider(),
            GestureDetector(
              child: Text(
                'History',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsLimitless.textColor),
              ),
              onTap: () {
                superSet == false
                    ? context.router.navigateNamed('/training-history-page')
                    : context.router.navigateNamed('/super-set-history-page');

                Navigator.pop(context);
              },
            ),
            const Divider(),
            GestureDetector(
              child: Text(
                'Percent Calculator',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsLimitless.textColor),
              ),
              onTap: () {
                Navigator.pop(context);
                showPercentCalculatorDialog(context);
              },
            ),
            const Divider(),
            GestureDetector(
              child: Text(
                'Instruction',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsLimitless.textColor),
              ),
              onTap: () {
                Navigator.pop(context);
                _showInstruction(context);
              },
            ),
            const Divider(),
            GestureDetector(
              child: Text(
                'Add Exercise to End of Session',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsLimitless.textColor),
              ),
            ),
            const Divider(),
            GestureDetector(
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsLimitless.brandColor),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
