import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/core/view_models/set_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_event.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/editing_card/set_text_field.dart';

// ignore: must_be_immutable
class SetsListWidget extends StatelessWidget {
  SetsListWidget({Key? key, required this.exercise, required this.set, required this.setIndex})
      : super(key: key) {
    set.orderNumber = setIndex;
    selectedPercentage = set.percentage;
  }
  final int setIndex;
  final ExerciseViewModel exercise;
  final SetViewModel set;
  double selectedPercentage = 0;

  void showPercentageDialog(Widget child, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
              height: 200.r,
              child: SafeArea(
                top: false,
                child: child,
              ));
        });
  }

  final List<double> _numbers = [
    0,
    2.5,
    5,
    7.5,
    10,
    12.5,
    15,
    17.5,
    20,
    22.5,
    25,
    27.5,
    30,
    32.5,
    35,
    37.5,
    40,
    42.5,
    45,
    47,
    50,
    62.5,
    65,
    67.5,
    70,
    72.5,
    75,
    77,
    80,
    82.5,
    85,
    87.5,
    90,
    92.5,
    95,
    97,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 16.r),
        child: Slidable(
            key: key,
            enabled: setIndex > 0,
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  backgroundColor: ColorsLimitless.brandColor,
                  icon: Icons.delete,
                  onPressed: onDeleteSet,
                ),
              ],
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                width: 5.r,
              ),
              Text(
                '${setIndex + 1}',
                style: TextStyle(
                    fontFamily: 'SF Pro', fontSize: 12.sp, color: ColorsLimitless.greyMedium),
              ),
              SizedBox(
                width: 20.r,
              ),
              SetTextField(set: set, setIndex: setIndex, field: 'repeats'),
              SizedBox(
                width: 10.r,
              ),
              SetTextField(set: set, setIndex: setIndex, field: 'weight'),
              SizedBox(
                width: 10.r,
              ),
              GestureDetector(
                child: Container(
                  height: 35.r,
                  width: 70.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r), color: const Color(0xFFF7F9FB)),
                  child: Center(
                    child: Text(set.percentage.toString(),
                        style: TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 12.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                            color: ColorsLimitless.textColor)),
                  ),
                ),
                onTap: () {
                  showPercentageDialog(
                      Stack(
                        children: [
                          CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                                initialItem: _numbers.indexOf(set.percentage)),
                            itemExtent: 35.r,
                            onSelectedItemChanged: (int selectedItem) {
                              selectedPercentage = _numbers[selectedItem];
                            },
                            children: List<Widget>.generate(_numbers.length, (int index) {
                              return GestureDetector(
                                child: Center(
                                    child: Text(
                                  '${_numbers[index]}',
                                  style: TextStyle(
                                      fontFamily: "SF Pro", fontSize: 15.sp, letterSpacing: 0.5),
                                )),
                              );
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.r, right: 14.r, top: 14.r),
                            child: Row(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                  onTap: (() => Navigator.pop(context)),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: "SF Pro",
                                      fontSize: 13.sp,
                                      letterSpacing: 0.5,
                                      color: ColorsLimitless.greyLight,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )),
                                GestureDetector(
                                  onTap: () {
                                    set.percentage = selectedPercentage;
                                    context
                                        .read<CreateSessionBloc>()
                                        .add(RefreshCreateSessionEvent());
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                      fontFamily: "SF Pro",
                                      fontSize: 13.sp,
                                      letterSpacing: 0.5,
                                      color: ColorsLimitless.brandColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      context);
                },
              )
            ])));
  }

  void onDeleteSet(BuildContext context) {
    exercise.sets.removeAt(setIndex);
    context.read<CreateSessionBloc>().add(RefreshCreateSessionEvent());
  }
}
