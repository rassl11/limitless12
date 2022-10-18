import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/ui/pages/instruction_page.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/history/history.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/history/top_panel_history.dart';

class TrainingHistoryPage extends StatefulWidget {
  const TrainingHistoryPage({Key? key}) : super(key: key);

  @override
  State<TrainingHistoryPage> createState() => _TrainingHistoryPageState();
}

class _TrainingHistoryPageState extends State<TrainingHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLimitless.backgroundColor,
      body: SafeArea(
        top: false,
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              const TopPanelTrainingHistory(
                text: 'Db Bench Press',
              ),
              SizedBox(
                height: 14.r,
              ),
              Expanded(
                child: SizedBox(
                  width: 1.sw,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.r),
                          child: Container(
                      
                            height: 35.r,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE6E8EC).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(6.r)),
                            child: TabBar(
                                padding: EdgeInsets.zero,
                                indicatorPadding: EdgeInsets.symmetric(
                                    horizontal: 4.r, vertical: 5.r),
                                indicator: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.r)),
                                    color: Colors.white),
                                splashFactory: NoSplash.splashFactory,
                                unselectedLabelColor: ColorsLimitless.greyLight,
                                indicatorColor: ColorsLimitless.greyDark,
                                labelColor: ColorsLimitless.greyDark,
                                labelStyle: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontSize: 12.sp,
                                    letterSpacing: 0.5,
                                    color: ColorsLimitless.textColor,
                                    fontWeight: FontWeight.w700),
                                tabs: const [
                                  Tab(
                                    text: 'History',
                                  ),
                                  Tab(
                                    text: 'Instruction',
                                  ),
                                ]),
                          ),
                        ),
                         const Expanded(
                            child: TabBarView(children: [
                          //EMPTY HISTORY
                          // const EmptyHistory(),
                          //NOT EMPTY HISTORY
                           TrainingHistory(),
                           InstructionPage()
                        ])),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
