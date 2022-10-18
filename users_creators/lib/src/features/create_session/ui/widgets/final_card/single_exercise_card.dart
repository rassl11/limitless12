import 'dart:ui';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_event.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_event.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_state.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/final_card/single_exercise_expanded_card.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/exercise_info_dialog.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/exercise_popup_menu.dart';

class SingleExerciseCard extends StatefulWidget {
  const SingleExerciseCard(
      {Key? key, required this.exercise, required this.index})
      : super(key: key);

  final int index;

  final ExerciseViewModel exercise;

  @override
  State<SingleExerciseCard> createState() => _SingleExerciseCardState();
}

class _SingleExerciseCardState extends State<SingleExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpandCardBloc, ExpandCardState>(
      builder: (context, state) {
        if (state is OpenCardState &&
            ExpandCardState.indexOfCard == widget.index) {
          return SingleExerciseExpandedCard(
            exercise: widget.exercise,
            index: widget.index,
          );
        }
        return Padding(
          padding: EdgeInsets.only(bottom: 10.r),
          child: Slidable(
            key: widget.key,
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  backgroundColor: ColorsLimitless.brandColor,
                  icon: Icons.delete,
                  onPressed: (context) {
                    context.read<CreateSessionBloc>().add(
                        DeleteExerciseEvent(groupId: widget.exercise.groupId));
                  },
                ),
              ],
            ),
            child: Stack(
              children: [
                GestureDetector(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 7.r),
                      height: 85.r,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFE6E8EC)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.r),
                        child: Row(children: [
                          GestureDetector(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.r),
                                child: Image.network(
                                  widget.exercise.image,
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
                                  widget.exercise.name,
                                  widget.exercise.youtubeLink,
                                  widget.exercise.description);
                            },
                          ),
                          SizedBox(
                            width: 15.r,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 0.5.sw,
                                child: Text(
                                  widget.exercise.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 16.sp,
                                      color: ColorsLimitless.textColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 8.r,
                              )
                            ],
                          ),
                        ]),
                      )),
                  onTap: () {
                    ExpandCardState.indexOfCard = widget.index;
                    context.read<ExpandCardBloc>().add(OpenCardEvent());
                  },
                ),
                Positioned(
                  top: 8.r,
                  right: 15.r,
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      'assets/icons/creator/settings.svg',
                      height: 20.r,
                    ),
                    onTapDown: (TapDownDetails details) {
                      showExercisePopupMenu(
                          context, details.globalPosition, widget.index);
                    },
                  ),
                ),
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
                        quarterTurns: 0,
                        child: Text(
                          "${widget.index + 1}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SF Pro',
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp),
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
