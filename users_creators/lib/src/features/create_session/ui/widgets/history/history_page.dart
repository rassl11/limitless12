import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/create_session/entity/history_exercise.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/exercise.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/graph/graph_place_holder.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/history_exercise_list.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/personal_multi_record.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/top_panel_history.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/working_max.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLimitless.backgroundColor,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const TopPanelHistory(),
            SizedBox(
              height: 14.r,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //MULTIRECORDS
                      const PersonalMultiRecord(),
                      //ONE RECORD
                      // const PersonalRecord(),
                      SizedBox(
                        height: 22.r,
                      ),
                      const WorkingMax(),
                      SizedBox(
                        height: 22.r,
                      ),
                      //exerciseModelList.isEmpty ?
                      const GraphPlaceHolder(), // : Graph(),
                      SizedBox(
                        height: 22.r,
                      ),
                      const Exercise(),
                      SizedBox(
                        height: 20.r,
                      ),
                      Row(
                        children: [
                          Text(
                            'Sets',
                            style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 11.sp,
                                color: ColorsLimitless.textColor,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 65.r,
                          ),
                          Text(
                            'Reps',
                            style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 11.sp,
                                color: ColorsLimitless.textColor,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 110.r,
                          ),
                          Text(
                            'Kg',
                            style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 11.sp,
                                color: ColorsLimitless.textColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.r,
                      ),
                      Column(
                          children: List.generate(
                              historyExerciseList.length,
                              (index) => HistoryExerciseList(
                                    index: index,
                                  ))),
                      SizedBox(
                        height: 10.r,
                      ),
                      Center(
                        child: GestureDetector(
                          child: Container(
                            width: 0.69.sw,
                            padding: EdgeInsets.symmetric(vertical: 12.r),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFE6E8EC)),
                                borderRadius: BorderRadius.circular(6.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/create_session/add.svg'),
                                SizedBox(
                                  width: 5.r,
                                ),
                                Text(
                                  'Add set',
                                  style: TextStyle(
                                      fontFamily: "SF Pro",
                                      fontSize: 12.sp,
                                      letterSpacing: 0.5,
                                      color: ColorsLimitless.textColor,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            historyExerciseList.add(
                              HistoryExercise(
                                  number:
                                      historyExerciseList[historyExerciseList.length - 1].number +
                                          1,
                                  reps: 15,
                                  kg: 20),
                            );
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
