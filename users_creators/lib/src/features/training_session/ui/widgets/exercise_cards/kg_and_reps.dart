import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_event.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_event.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_state.dart';
import 'package:users_creators/src/features/training_session/bloc/done_session/done_session_state.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_event.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_state.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_cards/training_session_text_field.dart';

class KgAndReps extends StatefulWidget {
  KgAndReps(
      {Key? key,
      required this.indexOfTextField,
      required this.indexOfCard,
      required this.exerciseList})
      : super(key: key);

  final List<Exercises> exerciseList;
  final int indexOfTextField;
  final int indexOfCard;

  @override
  State<KgAndReps> createState() => _KgAndRepsState();
}

class _KgAndRepsState extends State<KgAndReps> {
  List doneExercises = [];
  void checkDone() {
    for (int i = 0; i < widget.exerciseList[0].sets!.length; i++) {
      if (widget.exerciseList[0].sets![i].isDone == true) {
        doneExercises.add(true);
      }
    }

  }

    

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoneExerciseBloc, DoneExerciseState>(
      builder: (context, stateDone) {
        return BlocBuilder<TextFieldBloc, TextFieldState>(
          builder: (context, state) {
            return GestureDetector(
              child: Container(
                height: state is TextFieldOpenState &&
                        TextFieldState.indexOfTextField ==
                            widget.indexOfTextField &&
                        TextFieldState.indexOfCard == widget.indexOfCard && widget.exerciseList[0].sets![widget.indexOfTextField].isDone == false
                    ? 110.r
                    : 55.r,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: state is TextFieldOpenState &&
                                TextFieldState.indexOfTextField ==
                                    widget.indexOfTextField &&
                                TextFieldState.indexOfCard == widget.indexOfCard
                                && widget.exerciseList[0].sets![widget.indexOfTextField].isDone == false
                            ? ColorsLimitless.brandColor
                            : const Color(0xFFE6E8EC)),
                    borderRadius: BorderRadius.circular(6.r)),
                child: Row(
                  children: [
                    Expanded(
                      child: TrainingTextFieldEditCard(
                        superSet: false,
                        indexOfExercise: widget.indexOfTextField,
                        repeats: true,
                        exerciseList: widget.exerciseList,
                        indexOfCard: widget.indexOfCard,
                        index: widget.indexOfTextField,
                      ),
                    ),
                    VerticalDivider(
                      indent: state is TextFieldOpenState &&
                              TextFieldState.indexOfTextField ==
                                  widget.indexOfTextField &&
                              TextFieldState.indexOfCard == widget.indexOfCard
                              && widget.exerciseList[0].sets![widget.indexOfTextField].isDone == false
                          ? 20.r
                          : 8.r,
                      endIndent: state is TextFieldOpenState &&
                              TextFieldState.indexOfTextField ==
                                  widget.indexOfTextField &&
                              TextFieldState.indexOfCard == widget.indexOfCard
                              && widget.exerciseList[0].sets![widget.indexOfTextField].isDone == false
                          ? 20.r
                          : 8.r,
                      width: 0,
                      color: ColorsLimitless.greyLight,
                    ),
                    Expanded(
                      child: TrainingTextFieldEditCard(
                        superSet: false,
                        indexOfExercise: widget.indexOfTextField,
                        repeats: false,
                        exerciseList: widget.exerciseList,
                        indexOfCard: widget.indexOfCard,
                        index: widget.indexOfTextField,
                      ),
                    ),
                    VerticalDivider(
                      indent: state is TextFieldOpenState &&
                              TextFieldState.indexOfTextField ==
                                  widget.indexOfTextField &&
                              TextFieldState.indexOfCard == widget.indexOfCard
                              && widget.exerciseList[0].sets![widget.indexOfTextField].isDone == false
                          ? 20.r
                          : 8.r,
                      endIndent: state is TextFieldOpenState &&
                              TextFieldState.indexOfTextField ==
                                  widget.indexOfTextField &&
                              TextFieldState.indexOfCard == widget.indexOfCard
                              && widget.exerciseList[0].sets![widget.indexOfTextField].isDone == false
                          ? 20.r
                          : 8.r,
                      width: 0,
                      color: ColorsLimitless.greyLight,
                    ),
                    state is TextFieldOpenState &&
                            TextFieldState.indexOfTextField ==
                                widget.indexOfTextField &&
                            TextFieldState.indexOfCard == widget.indexOfCard
                            && widget.exerciseList[0].sets![widget.indexOfTextField].isDone == false
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
                                context
                                    .read<TextFieldBloc>()
                                    .add(TextFieldCloseEvent());
                                widget
                                    .exerciseList[0]
                                    .sets![widget.indexOfTextField]
                                    .isDone = true;

                                checkDone();
                                if (doneExercises.length ==
                                    widget.exerciseList[0].sets!.length) {
                                  context
                                      .read<ChangeIndicatorLengthBloc>()
                                      .add(AddIndicatorLengthEvent());
                                }
                                context
                                    .read<DoneExerciseBloc>()
                                    .add(DidExerciseEvent());
                              },
                            ),
                          )
                        : stateDone is DidExerciseState &&
                                widget
                                        .exerciseList[0]
                                        .sets![widget.indexOfTextField]
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
                ),
              ),
              onTap: () {
                if(widget.exerciseList[0].sets![widget.indexOfTextField].isDone == false){
                TextFieldState.changeIndexOfTextField(widget.indexOfTextField);
                TextFieldState.changeIndexOfCard(widget.indexOfCard);
                if (state is TextFieldCloseState) {
                  context.read<TextFieldBloc>().add(TextFieldOpenEvent());
                } else {
                  context.read<TextFieldBloc>().add(TextFieldOpenEvent());
                }
                }
              
              },
            );
          },
        );
      },
    );
  }
}
