import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/entity/exercise_model.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_list.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/history/top_panel_set.dart';

import '../widgets/training_session_top_panel.dart';

class ExerciseSettingsPage extends StatelessWidget {
  const ExerciseSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLimitless.backgroundColor,
      body: Column(children: [
        const TopPanelTrainingSetHistory(
          text: 'Exercise list',
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 14.r, right: 14.r, top: 20.r),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trainingExerciseList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    trainingExerciseList.length - trainingExerciseList.length ==
                                index &&
                            trainingExerciseList[0].status != null
                        ? Padding(
                            padding: EdgeInsets.only(bottom: 15.r),
                            child: Text(
                              'Completed Exercise',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontSize: 14.sp,
                                  color: ColorsLimitless.textColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        : const SizedBox(),
                        trainingExerciseList.length- 3 == index ?
                         Padding(
                            padding: EdgeInsets.only(bottom: 15.r,top: 10.r),
                            child: Text(
                              'Current Exercise',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontSize: 14.sp,
                                  color: Color(0xFFBA4454),
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        : const SizedBox(),
                    trainingExerciseList.length - 2 == index &&
                            trainingExerciseList[index].status == null
                        ? Padding(
                            padding: EdgeInsets.only(bottom: 10.r, top: 10.r),
                            child: Text(
                              'Next Exercise',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontSize: 14.sp,
                                  color: ColorsLimitless.textColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.r),
                      child: ExerciseList(
                        indexOfCard: index,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
