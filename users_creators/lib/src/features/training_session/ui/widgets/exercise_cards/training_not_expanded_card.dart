import 'dart:ui';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/core/constants/validation.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/pre_video.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_card/training_expand_card_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_card/training_expand_card_event.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_card/training_expand_card_state.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';
import 'package:users_creators/src/features/training_session/bloc/swap_exercise/swap_exercise_state.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_cards/expanded_training_card.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/pre_video.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/settings.dart';

class TrainingNotExpandedCard extends StatefulWidget {
  const TrainingNotExpandedCard({
    Key? key,
    required this.index,
    required this.list,
    required this.state,
  }) : super(key: key);
  final int index;
  final GotTrainingSessionState state;
  final List<Exercises> list;

  @override
  State<TrainingNotExpandedCard> createState() =>
      _TrainingNotExpandedCardState();
}

class _TrainingNotExpandedCardState extends State<TrainingNotExpandedCard> {
  
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
              instruction: false,
              exerciseList: widget.list,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingExpandCardBloc, TrainingExpandCardState>(
      builder: (context, expandState) {
        return Padding(
          padding: EdgeInsets.only(bottom: 40.r),
          child: Stack(
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 100),
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.r),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.r, right: 12.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Image.network(
                                    youtubeImage(widget.list[0].imageUrl ?? ''),
                                    height: 60.r,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 70,
                                        width: 80,
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
                                  ),
                                  onTap: () {
                                    _showInstruction(context);
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
                                        widget.list[0].title!,
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
                              ],
                            ),
                          ),
                          expandState is TrainingOpenedCardState &&
                                  TrainingExpandCardState.indexOfCard ==
                                      widget.index
                              ? ExpandedTrainingCard(
                                  exerciseList: widget.list,
                                  index: widget.index,
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    TrainingExpandCardState.indexOfCard = widget.index;
                    context
                        .read<TrainingExpandCardBloc>()
                        .add(TrainingOpenCardEvent());
                  },
                ),
              ),
              Positioned(
                top: 8.r,
                right: 15.r,
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/creator/settings.svg',
                    height: 20.r,
                  ),
                  onTap: () {
                    SwapTrainingExerciseState.groudId = widget.list[0].groupId!;
                    SwapTrainingExerciseState.oldExerciseId =
                        widget.list[0].id!;
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
                              exerciseList: widget.list,
                              superSet: false,
                              indexOfCard: widget.index,
                            ));
                      },
                    );
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
        );
      },
    );
  }
}
