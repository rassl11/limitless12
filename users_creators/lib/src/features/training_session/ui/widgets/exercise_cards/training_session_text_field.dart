import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_event.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_state.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';

class TrainingTextFieldEditCard extends StatelessWidget {
  TrainingTextFieldEditCard(
      {Key? key,
      required this.index,
      required this.indexOfCard,
      required this.exerciseList,
      required this.indexOfExercise,
      required this.superSet,
      required this.repeats})
      : super(key: key);
  final int index;
  final int indexOfCard;
  final int indexOfExercise;
  final bool superSet;
  final List<Exercises> exerciseList;
  final bool repeats;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTrainingSessionBloc, TrainingSessionExerciseState>(
      builder: (context, trainingState) {
        return BlocBuilder<TextFieldBloc, TextFieldState>(
          builder: (context, state) {
            return SizedBox(
              height: 50.r,
              width: 75.r,
              child: Center(
                child: TextFormField(
                  initialValue: '',

                  onChanged: (value) {
                    final intValue = int.parse(value);
                    if (repeats == true && superSet == true) {
                      exerciseList[index].sets![indexOfExercise].repeats = value;
                      trainingState.session.exercises![trainingState.session.exercises!.indexWhere((element) => element.groupId == exerciseList[index].groupId)]
                          .sets![indexOfExercise].repeats = value;
                    } else if (repeats == false && superSet == true) {
                      exerciseList[index].sets![indexOfExercise].weight = intValue;
                      trainingState.session.exercises![trainingState.session.exercises!.indexWhere((element) => element.groupId == exerciseList[index].groupId)]
                          .sets![indexOfExercise].weight = intValue;
                    } else if (repeats == true && superSet == false) {
                      exerciseList[0].sets![indexOfExercise].repeats = value;
                      trainingState.session.exercises![trainingState.session.exercises!.indexWhere((element) => element.groupId == exerciseList[0].groupId)]
                          .sets![indexOfExercise].repeats = value;
                    } else if (repeats == false && superSet == false) {
                      exerciseList[0].sets![indexOfExercise].weight = intValue;
                      trainingState.session.exercises![trainingState.session.exercises!.indexWhere((element) => element.groupId == exerciseList[0].groupId)]
                          .sets![indexOfExercise].weight = intValue;
                    }
                  },
                  onTap: () {
                    TextFieldState.changeIndexOfTextField(index);
                    TextFieldState.changeIndexOfCard(indexOfCard);
                    TextFieldState.changeIndexOfExercise(indexOfExercise);
                    context.read<TextFieldBloc>().add(TextFieldOpenEvent());
                  },

                  style: TextStyle(fontSize: 16.sp, fontFamily: "SF Pro", fontWeight: FontWeight.w700, color: ColorsLimitless.textColor),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  // autofocus: true,
                  cursorColor: ColorsLimitless.brandColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 1.r),
                    filled: true,
                    hintText: '--',
                    hintStyle: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 17.sp,
                        letterSpacing: 0.5,
                        color: state is TextFieldOpenState &&
                                TextFieldState.indexOfCard == indexOfCard &&
                                TextFieldState.indexOfExercise == indexOfExercise &&
                                TextFieldState.indexOfTextField == index
                            ? ColorsLimitless.textColor
                            : ColorsLimitless.greyLight,
                        fontWeight: FontWeight.w700),
                    hintMaxLines: 1,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(fontFamily: 'SF Pro', fontSize: 11.sp, fontWeight: FontWeight.w400),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.transparent),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.transparent),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(width: 1, color: Colors.transparent)),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
