import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/training_session/bloc/finished_round/finished_round_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/finished_round/finished_round_state.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/add_rounds.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_cards/card_with_sets.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/pre_video.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/settings.dart';

class TopWidgetCardWithSets extends StatelessWidget {
  const TopWidgetCardWithSets(
      {Key? key, required this.indexOfCard, required this.exerciseList})
      : super(key: key);

  final int indexOfCard;
  final List<Exercises> exerciseList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.r),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.only(left: 33.r, right: 14.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditRounds(
                      indexOfCard: indexOfCard,
                      exerciseList: exerciseList,
                    ),
                    SizedBox(
                      height: 20.r,
                    ),
                    Column(
                      children: List.generate(exerciseList.length,
                          (indexOfTextField) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.r),
                          child: CardWithSets(
                            exerciseList: exerciseList,
                            indexOfTextField: indexOfTextField,
                            indexOfCard: indexOfCard,
                          ),
                        );
                      }),
                    ),
                  ],
                )),
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
                  quarterTurns: 3,
                  child: Text(
                    exerciseList.length == 2
                        ? "${indexOfCard + 1}. Superset"
                        : exerciseList.length == 3
                            ? "${indexOfCard + 1}. Triset"
                            : "${indexOfCard + 1}. Curcuit",
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
    );
  }
}

class EditRounds extends StatefulWidget {
  const EditRounds({
    Key? key,
    required this.exerciseList,
    required this.indexOfCard,
  }) : super(key: key);
  final List<Exercises> exerciseList;
  final int indexOfCard;

  @override
  State<EditRounds> createState() => _EditRoundsState();
}

class _EditRoundsState extends State<EditRounds> {
  void _showBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (_) {
        return AspectRatio(
          aspectRatio: 2,
          child: SizedBox(
            child: AddRounds(
              onTap: onTap,
              exerciseList: widget.exerciseList,
            ),
          ),
        );
      },
    );
  }

  void onTap() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishRoundBloc, FinishRoundState>(
      builder: (context, state) {
        return Row(children: [
          GestureDetector(
            child: Text('Rounds',
                style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 14.sp,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w700,
                    color: ColorsLimitless.brandColor)),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
          SizedBox(
            width: 20.r,
          ),
          Expanded(
            child: SizedBox(
                width: 0.5.sw,
                height: 50.r,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children:
                      List.generate(widget.exerciseList.first.round!, (index) {
                    return IntrinsicWidth(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              height: 36.r,
                              width: 36.r,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: state is FinishedRoundState &&
                                          widget.exerciseList.first.doneRound
                                              .isNotEmpty &&
                                          widget.exerciseList.first.doneRound
                                              .contains(index + 1)
                                      ? const Color(0xFFECAAAA)
                                      : state is FinishedRoundState &&
                                              widget.exerciseList.first
                                                  .doneRound.isNotEmpty &&
                                              widget.exerciseList.first
                                                      .doneRound.last ==
                                                  index
                                          ? const Color(0xFFBA4454)
                                          : const Color(0xFFE6E8EC)),
                              child: state is FinishedRoundState &&
                                      widget.exerciseList.first.doneRound
                                          .isNotEmpty &&
                                      widget.exerciseList.first.doneRound
                                          .contains(index + 1)
                                  ? Center(
                                      child: SvgPicture.asset(
                                          'assets/icons/training_session/done_round.svg'),
                                    )
                                  : Center(
                                      child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                          fontFamily: "SF Pro",
                                          fontSize: 14.sp,
                                          color: state is FinishedRoundState &&
                                                  widget.exerciseList.first
                                                      .doneRound.isNotEmpty &&
                                                  widget.exerciseList.first
                                                          .doneRound.last ==
                                                      index
                                              ? Colors.white
                                              : Color(0xFF777E90)),
                                    )),
                            ),
                          ),
                          widget.exerciseList.first.round! - 1 == index
                              ? const SizedBox()
                              : const Flexible(
                                  child: Divider(
                                    indent: 5,
                                    endIndent: 5,
                                    thickness: 1.4,
                                  ),
                                )
                        ],
                      ),
                    );
                  }),
                )),
          ),
          SizedBox(
            width: 10.r,
          ),
          GestureDetector(
            child: SvgPicture.asset(
              'assets/icons/creator/settings.svg',
              height: 20.r,
            ),
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                context: context,
                builder: (_) {
                  return SizedBox(
                      height: 0.5.sh,
                      child: SettingsTraining(
                        exerciseList: widget.exerciseList,
                        superSet: true,
                        indexOfCard: widget.indexOfCard,
                      ));
                },
              );
            },
          ),
        ]);
      },
    );
  }
}
