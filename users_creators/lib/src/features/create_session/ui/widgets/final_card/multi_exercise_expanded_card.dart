import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/core/view_models/set_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_event.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_state.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/editing_card/set_row.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/final_card/sets_list_widget.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/exercise_info_dialog.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/working_max_dialog.dart';

class MultiExerciseExpandedCard extends StatefulWidget {
  const MultiExerciseExpandedCard(
      {Key? key,
      required this.exercise,
      required this.indexOfCard,
      required this.index})
      : super(key: key);

  final int indexOfCard;
  final ExerciseViewModel exercise;
  final int index;

  @override
  State<MultiExerciseExpandedCard> createState() =>
      _MultiExerciseExpandedCardState();
}

class _MultiExerciseExpandedCardState extends State<MultiExerciseExpandedCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.r),
      child: Stack(
        children: [
          GestureDetector(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.r, right: 14.r, top: 10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.exercise.name,
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 16.sp,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.r,
                    ),
                    SizedBox(
                        height: 65.r,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.r),
                                    child: Image.network(
                                      widget.exercise.image,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                        
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
                                    widget.exercise.description,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.r,
                            ),
                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: const Color(0xFFF7F9FB)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.r, ),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Last',
                                            style: TextStyle(
                                                fontFamily: "SF Pro",
                                                fontSize: 12.sp,
                                                letterSpacing: 0.5,
                                                color: ColorsLimitless.textColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 5.r,
                                          ),
                                          Text(
                                            'None',
                                            style: TextStyle(
                                                fontFamily: "SF Pro",
                                                fontSize: 12.sp,
                                                letterSpacing: 0.5,
                                                color: ColorsLimitless.greyLight,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 38.r,
                                      ),
                                      Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Working max',
                                            style: TextStyle(
                                              fontFamily: "SF Pro",
                                              fontSize: 12.sp,
                                              letterSpacing: 0.5,
                                              color: ColorsLimitless.textColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.r,
                                          ),
                                          Text(
                                            widget.exercise.repMax == 0
                                                ? 'Add'
                                                : widget.exercise.repMax
                                                    .toString(),
                                            style: TextStyle(
                                              fontFamily: "SF Pro",
                                              fontSize: 12.sp,
                                              letterSpacing: 0.5,
                                              color: ColorsLimitless.brandColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20.r,
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/create_session/right_arrow.svg')
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                showWorkingMaxDialog(context, widget.exercise);
                              },
                            )
                          ],
                        ),
                      ),
                      
                
                    SizedBox(
                      height: 20.r,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.r),
                      child: Row(
                        children: [
                          const SetRow(text: 'Set'),
                          SizedBox(
                            width: 37.r,
                          ),
                          const SetRow(text: 'Reps'),
                          SizedBox(
                            width: 63.r,
                          ),
                          const SetRow(text: 'Kg'),
                          SizedBox(
                            width: 70.r,
                          ),
                          const SetRow(text: '%'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.r,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.r),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(widget.exercise.sets.length,
                              (int setIndex) {
                            return SetsListWidget(
                              exercise: widget.exercise,
                              set: widget.exercise.sets[setIndex],
                              setIndex: setIndex,
                            );
                          })),
                    ),
                    SizedBox(
                      height: 5.r,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3.r,
                          ),
                          SvgPicture.asset(
                            'assets/icons/create_session/add_circle.svg',
                            height: 14.r,
                          ),
                          SizedBox(
                            width: 8.r,
                          ),
                          Text(
                            'Add Set',
                            style: TextStyle(
                                fontSize: 12.sp,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
                                fontFamily: "SF Pro"),
                          )
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          if (widget.exercise.sets.isNotEmpty) {
                            var lastSet = widget.exercise.sets.last;
                            widget.exercise.sets.add(SetViewModel(
                                orderNumber: lastSet.orderNumber + 1,
                                repeats: lastSet.repeats,
                                weight: lastSet.weight,
                                percentage: lastSet.percentage));
                          } else {
                            widget.exercise.sets.add(SetViewModel(
                                orderNumber: 0,
                                repeats: "0",
                                weight: 0,
                                percentage: 0));
                          }
                        });
                      },
                    ),
                  
                  ],
                ),
              ),
            ),
            onTap: () {
              ExpandCardState.indexOfExercise = widget.index;
              ExpandCardState.indexOfCard = widget.indexOfCard;
              context.read<ExpandCardBloc>().add(CloseCardEvent());
            },
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
  }
}
