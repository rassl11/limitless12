import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/new_exercise.dart';

import '../../../create_session/bloc/exercise_info/exercise_info_bloc.dart';
import '../../../create_session/bloc/exercise_info/exercise_info_event.dart';

class CreateExerciseButton extends StatelessWidget {
  const CreateExerciseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorsLimitless.brandColor),
              borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/create_session/add.svg',
                  color: ColorsLimitless.brandColor,
                  height: 13.r,
                ),
                SizedBox(
                  width: 7.r,
                ),
                Text(
                  'Create New Exercise',
                  style: TextStyle(
                      color: ColorsLimitless.brandColor,
                      fontFamily: 'SF Pro',
                      fontSize: 13.sp,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        BlocProvider.of<ExerciseInfoBloc>(context).add(LoadExerciseInfoEvent());
        showDialog(
            barrierColor: const Color(0xFF142A4B).withOpacity(0.35),
            context: context,
            builder: (context) {
              return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Center(child: NewExercise()));
            });
      },
    );
  }
}
