import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_event.dart';
import 'package:users_creators/src/features/training_session/bloc/check_if_done_bloc/check_if_done_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/check_if_done_bloc/check_if_done_event.dart';
import 'package:users_creators/src/features/training_session/bloc/check_if_done_bloc/check_if_done_state.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_event.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_state.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_event.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_state.dart';
import 'package:users_creators/src/features/training_session/bloc/finished_round/finished_round_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/finished_round/finished_round_event.dart';
import 'package:users_creators/src/features/training_session/bloc/finished_round/finished_round_state.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_cards/training_session_text_field.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/timer.dart';

class TextFieldPart extends StatelessWidget {
  TextFieldPart({
    Key? key,
    required this.exerciseList,
    required this.indexOfCard,
    required this.indexOfExercise,
    required this.indexOfTextField,
    required this.stateDone,
    required this.stateRound,
    required this.textFieldState,
  }) : super(key: key);

  final TextFieldState textFieldState;
  final int indexOfTextField;
  final int indexOfCard;
  final List<Exercises> exerciseList;
  final int indexOfExercise;
  final DoneExerciseState stateDone;
  final CheckIfExerciseDoneState stateRound;
  int totalDoneExerciseInList = 0;

  void check() {
    List value = [];
    for (int i = 0; i < exerciseList.length; i++) {
      final setsLength = exerciseList[i].sets!.length;
      value.add(setsLength);
    }

    totalDoneExerciseInList = value.reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            height: textFieldState is TextFieldOpenState &&
                    TextFieldState.indexOfTextField == indexOfTextField &&
                    TextFieldState.indexOfExercise == indexOfExercise &&
                    TextFieldState.indexOfCard == indexOfCard &&
                    exerciseList[indexOfTextField]
                            .sets![indexOfExercise]
                            .isDone ==
                        false
                ? 110.r
                : 55.r,
            decoration: BoxDecoration(
                border: Border.all(
                    color: textFieldState is TextFieldOpenState &&
                            TextFieldState.indexOfTextField ==
                                indexOfTextField &&
                            TextFieldState.indexOfExercise == indexOfExercise &&
                            TextFieldState.indexOfCard == indexOfCard &&
                            exerciseList[indexOfTextField]
                                    .sets![indexOfExercise]
                                    .isDone ==
                                false
                        ? ColorsLimitless.brandColor
                        : const Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(6.r)),
            child: Row(
              children: [
                Expanded(
                  child: TrainingTextFieldEditCard(
                    superSet: true,
                    indexOfExercise: indexOfExercise,
                    exerciseList: exerciseList,
                    repeats: true,
                    indexOfCard: indexOfCard,
                    index: indexOfTextField,
                  ),
                ),
                VerticalDivider(
                  indent: textFieldState is TextFieldOpenState &&
                          TextFieldState.indexOfTextField == indexOfTextField &&
                          TextFieldState.indexOfExercise == indexOfExercise &&
                          TextFieldState.indexOfCard == indexOfCard &&
                          exerciseList[indexOfTextField]
                                  .sets![indexOfExercise]
                                  .isDone ==
                              false
                      ? 20.r
                      : 8.r,
                  endIndent: textFieldState is TextFieldOpenState &&
                          TextFieldState.indexOfTextField == indexOfTextField &&
                          TextFieldState.indexOfExercise == indexOfExercise &&
                          TextFieldState.indexOfCard == indexOfCard &&
                          exerciseList[indexOfTextField]
                                  .sets![indexOfExercise]
                                  .isDone ==
                              false
                      ? 20.r
                      : 8.r,
                  width: 0,
                  color: ColorsLimitless.greyLight,
                ),
                Expanded(
                  child: TrainingTextFieldEditCard(
                    superSet: true,
                    indexOfExercise: indexOfExercise,
                    exerciseList: exerciseList,
                    repeats: false,
                    indexOfCard: indexOfCard,
                    index: indexOfTextField,
                  ),
                ),
                VerticalDivider(
                  indent: textFieldState is TextFieldOpenState &&
                          TextFieldState.indexOfTextField == indexOfTextField &&
                          TextFieldState.indexOfExercise == indexOfExercise &&
                          TextFieldState.indexOfCard == indexOfCard &&
                          exerciseList[indexOfTextField]
                                  .sets![indexOfExercise]
                                  .isDone ==
                              false
                      ? 20.r
                      : 8.r,
                  endIndent: textFieldState is TextFieldOpenState &&
                          TextFieldState.indexOfTextField == indexOfTextField &&
                          TextFieldState.indexOfExercise == indexOfExercise &&
                          TextFieldState.indexOfCard == indexOfCard &&
                          exerciseList[indexOfTextField]
                                  .sets![indexOfExercise]
                                  .isDone ==
                              false
                      ? 20.r
                      : 8.r,
                  width: 0,
                  color: ColorsLimitless.greyLight,
                ),
                textFieldState is TextFieldOpenState &&
                        TextFieldState.indexOfTextField == indexOfTextField &&
                        TextFieldState.indexOfExercise == indexOfExercise &&
                        TextFieldState.indexOfCard == indexOfCard &&
                        exerciseList[indexOfTextField]
                                .sets![indexOfExercise]
                                .isDone ==
                            false
                    ? Expanded(
                        child: GestureDetector(
                          child: Container(
                            color: ColorsLimitless.brandColor,
                            child: Center(
                              child: Text(
                                'Done',
                                style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();

                            context
                                .read<TextFieldBloc>()
                                .add(TextFieldCloseEvent());
                            context
                                .read<DoneExerciseBloc>()
                                .add(DidExerciseEvent());

                            context
                                .read<CheckIfExerciseDoneBloc>()
                                .add(DoneExerciseStatusEvent());

                            exerciseList[indexOfTextField]
                                .sets![indexOfExercise]
                                .isDone = true;

                            check();

                            if (stateRound.done == totalDoneExerciseInList) {
                              if (exerciseList.first.doneRound.isEmpty) {
                                exerciseList.first.doneRound.add(1);
                              } else {
                                exerciseList.first.doneRound
                                    .add(exerciseList.first.doneRound.last + 1);

                                if (exerciseList[exerciseList.indexWhere(
                                            (element) => element.round != 0)]
                                        .round ==
                                    exerciseList.first.doneRound.last) {
                                  context
                                      .read<ChangeIndicatorLengthBloc>()
                                      .add(AddIndicatorLengthEvent());
                                  context
                                      .read<CheckIfExerciseDoneBloc>()
                                      .add(NotDoneExerciseStatusEvent());
                                }
                              }
                              if (exerciseList[exerciseList.indexWhere(
                                          (element) => element.round != 0)]
                                      .round !=
                                  exerciseList.first.doneRound.last) {
                                context
                                    .read<CheckIfExerciseDoneBloc>()
                                    .add(NotDoneExerciseStatusEvent());
                                for (int i = 0; i < exerciseList.length; i++) {
                                  for (int b = 0;
                                      b < exerciseList[i].sets!.length;
                                      b++) {
                                    exerciseList[i].sets![b].isDone = false;
                                  }
                                }
                              }

                              context
                                  .read<FinishRoundBloc>()
                                  .add(FinishedRoundEvent());

                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                isDismissible: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                context: context,
                                builder: (_) {
                                  return TimerBottomSheet(
                                      timerDuration: Duration(
                                          seconds: exerciseList[exerciseList
                                                          .indexWhere(
                                                              (element) =>
                                                                  element
                                                                      .round !=
                                                                  0)]
                                                      .restIntervalSec ==
                                                  0
                                              ? 60
                                              : exerciseList[exerciseList
                                                      .indexWhere((element) =>
                                                          element.round != 0)]
                                                  .restIntervalSec!));
                                },
                              );
                            }
                          },
                        ),
                      )
                    : stateDone is DidExerciseState &&
                            exerciseList[indexOfTextField]
                                    .sets![indexOfExercise]
                                    .isDone ==
                                true
                        ? Expanded(
                            child: SvgPicture.asset(
                              'assets/icons/training_session/done.svg',
                            ),
                          )
                        : Expanded(
                            child: SvgPicture.asset(
                              'assets/icons/training_session/play.svg',
                            ),
                          ),
              ],
            )),
        onTap: () {
          if (exerciseList[indexOfTextField].sets![indexOfExercise].isDone ==
              false) {
            TextFieldState.changeIndexOfTextField(indexOfTextField);
            TextFieldState.changeIndexOfCard(indexOfCard);
            TextFieldState.changeIndexOfExercise(indexOfExercise);

            context.read<TextFieldBloc>().add(TextFieldOpenEvent());
          }
        });
  }
}
