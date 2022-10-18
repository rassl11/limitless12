import 'dart:ui';

import 'package:components/common_widgets/slidable/action_pane_motion.dart';
import 'package:components/common_widgets/slidable/slid.dart';
import 'package:components/common_widgets/slidable/slidable.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/final_card/slidable_action.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_cards/kg_and_reps.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/pre_video.dart';
import 'package:uuid/uuid.dart';

class ExpandedTrainingCard extends StatefulWidget {
  const ExpandedTrainingCard({
    Key? key,
    required this.index,
    required this.exerciseList,
  }) : super(key: key);

  final List<Exercises> exerciseList;
  final int index;

  @override
  State<ExpandedTrainingCard> createState() => _ExpandedTrainingCardState();
}

class _ExpandedTrainingCardState extends State<ExpandedTrainingCard> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Color(0xFF142A4B59).withOpacity(0.25),
            child: TrainingPreVideo(
              instruction: true,
              exerciseList: widget.exerciseList,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTrainingSessionBloc, TrainingSessionExerciseState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 30.r,
            ),
            Row(
              children: [
                SizedBox(
                  width: 32.r,
                ),
                Text(
                  'Reps',
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 11.sp, color: ColorsLimitless.greyLight, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                ),
                SizedBox(
                  width: 85.r,
                ),
                Text(
                  'Kg',
                  style: TextStyle(fontFamily: 'SF Pro', fontSize: 11.sp, color: ColorsLimitless.greyLight, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                ),
              ],
            ),
            SizedBox(
              height: 10.r,
            ),
            Column(
                children: List.generate(widget.exerciseList[0].sets!.length, (indexOfTextField) {
              return Padding(
                  padding: EdgeInsets.only(bottom: 14.r),
                  child: Slidable(
                      endActionPane: ActionPaneCustom(extentRatio: 0.38, motion: BehindMotion(), children: [
                        SlidableAction(
                          spacing: 0,
                          padding: EdgeInsets.zero,
                          onPressed: (context) {},
                          widget: Container(
                            width: 47.r,
                            decoration: BoxDecoration(color: const Color(0xFFE6E8EC), borderRadius: BorderRadius.circular(5.r)),
                            child: Center(
                                child: Text(
                              'Miss',
                              style: TextStyle(
                                  fontFamily: "SF Pro", fontSize: 14.sp, letterSpacing: 0.5, color: ColorsLimitless.textColor, fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                        SlidableAction(
                            spacing: 0,
                            padding: EdgeInsets.zero,
                            onPressed: (BuildContext context) {
                              widget.exerciseList[0].sets!.removeAt(indexOfTextField);
                              setState(() {});
                            },
                            widget: Container(
                              width: 45.r,
                              decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(5.r)),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icons/training_session/basket.svg',
                                  height: 18.r,
                                ),
                              ),
                            ))
                      ]),
                      child: KgAndReps(
                        exerciseList: widget.exerciseList,
                        indexOfCard: widget.index,
                        indexOfTextField: indexOfTextField,
                      )));
            })),
            SizedBox(
              height: 11.r,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.r),
                      decoration: BoxDecoration(border: Border.all(color: ColorsLimitless.greyMedium), borderRadius: BorderRadius.circular(6.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/create_session/add.svg'),
                          SizedBox(
                            width: 5.r,
                          ),
                          Text(
                            'Add Set',
                            style: TextStyle(fontFamily: "SF Pro", fontSize: 12.sp, letterSpacing: 0.5, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      final id = const Uuid().v4().toString();
                      if (widget.exerciseList[0].sets!.isNotEmpty) {
                        widget.exerciseList[0].sets!.add(Sets(
                            id: id,
                            orderNumber: widget.exerciseList[0].sets!.last.orderNumber,
                            repeats: widget.exerciseList[0].sets!.last.repeats,
                            weight: widget.exerciseList[0].sets!.last.weight,
                            isDone: false));
                      } else {
                        widget.exerciseList[0].sets!.add(Sets(id: id, orderNumber: 0, repeats: "0", weight: 0, isDone: false));
                      }

                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
