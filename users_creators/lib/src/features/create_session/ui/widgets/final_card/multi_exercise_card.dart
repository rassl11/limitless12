import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/core/helpers/time_helpers.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_event.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_event.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_state.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/editing_card/session_rounds.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/final_card/multi_exercise_expanded_card.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/exercise_info_dialog.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/rest_timer_dialog.dart';

class MultiExerciseCard extends StatelessWidget {
  const MultiExerciseCard(
      {Key? key, required this.exercises, required this.index})
      : super(key: key);

  final int index;
  final List<ExerciseViewModel> exercises;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpandCardBloc, ExpandCardState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.r),
          child: Slidable(
            key: key,
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  backgroundColor: ColorsLimitless.brandColor,
                  icon: Icons.delete,
                  onPressed: (context) {
                    context.read<CreateSessionBloc>().add(
                        DeleteExerciseEvent(groupId: exercises.first.groupId));
                  },
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFE6E8EC)),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.r,
                          ),
                          SessionRounds(
                            index: index,
                            exercise: exercises.first,
                          ),
                          SizedBox(
                            height: 20.r,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.r, bottom: 10.r),
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  border: Border.all(
                                      color: ColorsLimitless.greyMedium),
                                ),
                                child: Center(
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.r),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/create_session/timer.svg'),
                                            SizedBox(
                                              width: 5.r,
                                            ),
                                            exercises[0].restIntervalSec == 0
                                                ? Text(
                                                    'Set rest timer',
                                                    style: TextStyle(
                                                        fontFamily: 'SF Pro',
                                                        fontSize: 12.sp,
                                                        letterSpacing: 0.5,
                                                        color: ColorsLimitless
                                                            .textColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                : Text(formattedTime(
                                                    time: exercises[0]
                                                        .restIntervalSec))
                                          ],
                                        ))),
                              ),
                              onTap: () {
                                showRestIntervalDialog(context, exercises[0]);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.r,
                          ),
                          Column(
                              children: List.generate(exercises.length,
                                  (exerciseIndex) {
                            if (state is OpenCardState &&
                                ExpandCardState.indexOfCard == index &&
                                ExpandCardState.indexOfExercise ==
                                    exerciseIndex) {
                              return MultiExerciseExpandedCard(
                                indexOfCard: index,
                                exercise: exercises[exerciseIndex],
                                index: exerciseIndex,
                              );
                            }
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.r),
                              child: GestureDetector(
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child:ClipRRect(
                                borderRadius: BorderRadius.circular(5.r),
                                child: Image.network(
                                  exercises[exerciseIndex].image,
                                  height: 60.r,
                                  width: 80.r,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 60.r,
                                      width: 80.r,
                                      decoration: BoxDecoration(
                                          color:
                                              ColorsLimitless.backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.image,
                                        color: ColorsLimitless.greyDark,
                                      )),
                                    );
                                  },
                                )),
                                        onTap: () {
                                          showExerciseInfoDialog(
                                              context,
                                              exercises[exerciseIndex].name,
                                              exercises[exerciseIndex]
                                                  .youtubeLink,
                                              exercises[exerciseIndex]
                                                  .description);
                                        },
                                      ),
                                      SizedBox(
                                        width: 15.r,
                                      ),
                                      Expanded(
                                        child: Text(
                                          exercises[exerciseIndex].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: 'SF Pro',
                                              fontSize: 16.sp,
                                              color: ColorsLimitless.textColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  ExpandCardState.indexOfCard = index;
                                  ExpandCardState.indexOfExercise =
                                      exerciseIndex;
                                  context
                                      .read<ExpandCardBloc>()
                                      .add(OpenCardEvent());
                                },
                              ),
                            );
                          }))
                        ],
                      ),
                    )),
                Positioned.fromRelativeRect(
                  rect: RelativeRect.fromLTRB(1, 1, 0.86.sw, 1),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF353945),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7.r),
                              bottomLeft: Radius.circular(7.r))),
                      child: Center(
                          child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          exercises.length == 2
                              ? '${index + 1}.Superset'
                              : exercises.length == 3
                                  ? '${index + 1} .Triset'
                                  : '${index + 1} .Circuit',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SF Pro',
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w700,
                              fontSize: 13.sp),
                        ),
                      ))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
