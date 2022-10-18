import 'dart:ui';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/bloc/check_if_done_bloc/check_if_done_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/check_if_done_bloc/check_if_done_state.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_state.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_state.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_cards/text_field_for_kg_and_reps.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/pre_video.dart';
import '../../../bloc/done_exercise/done_bloc.dart';
import '../popups/session_result.dart';

class CardWithSets extends StatefulWidget {
  const CardWithSets(
      {Key? key,
      required this.indexOfCard,
      required this.indexOfTextField,
      required this.exerciseList})
      : super(key: key);

  final int indexOfCard;
  final List<Exercises> exerciseList;
  final int indexOfTextField;

  @override
  State<CardWithSets> createState() => _CardWithSetsState();
}

class _CardWithSetsState extends State<CardWithSets> {
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: const Color(0xFF142A4B59).withOpacity(0.25),
            child: TrainingPreVideo(
              instruction: false,
              exerciseList: widget.exerciseList,
            ),
          ),
        );
      },
    );
  }

  void showResult() {
    showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF142A4B).withOpacity(0.25),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: const Center(child: SessionResultDialog())));
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckIfExerciseDoneBloc, CheckIfExerciseDoneState>(
      builder: (context, stateRound) {
        return BlocBuilder<DoneExerciseBloc, DoneExerciseState>(
          builder: (context, stateDone) {
            return BlocBuilder<TextFieldBloc, TextFieldState>(
                builder: (context, state) {
              return Column(children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Image.network(
                          widget.exerciseList[widget.indexOfTextField]
                                  .imageUrl ??
                              '',
                          height: 60.r,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 60.r,
                              width: 70.r,
                              decoration: BoxDecoration(
                                  color: ColorsLimitless.backgroundColor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Center(
                                  child: Icon(
                                Icons.image,
                                color: ColorsLimitless.greyDark,
                              )),
                            );
                          },
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                      SizedBox(
                        width: 10.r,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.exerciseList[widget.indexOfTextField].title!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontSize: 16.sp,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.r,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.r,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 32.r,
                    ),
                    Text(
                      'Reps',
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 11.sp,
                          color: ColorsLimitless.greyMedium,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5),
                    ),
                    SizedBox(
                      width: 75.r,
                    ),
                    Text(
                      'Kg',
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 11.sp,
                          color: ColorsLimitless.greyMedium,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.r,
                ),
                Column(
                  children: List.generate(
                      widget.exerciseList[widget.indexOfTextField].sets!.length,
                      (index) {
                    return Padding(
                        padding: EdgeInsets.only(bottom: 14.r),
                        child: TextFieldPart(
                          textFieldState: state,
                          indexOfCard: widget.indexOfCard,
                          indexOfExercise: index,
                          indexOfTextField: widget.indexOfTextField,
                          exerciseList: widget.exerciseList,
                          stateDone: stateDone,
                          stateRound: stateRound,
                        ));
                  }),
                )
              ]);
            });
          },
        );
      },
    );
  }
}
