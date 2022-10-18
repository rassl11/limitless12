import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/core/helpers/comon_helpers.dart';
import 'package:users_creators/src/features/training_session/bloc/done_session/done_session_state.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';
import 'package:users_creators/src/features/training_session/bloc/swap_exercise/swap_exercise_state.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/coach_name_card.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_cards/all_training_card.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/indicators.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/training_session_top_panel.dart';

class StartTrainingSessionPage extends StatefulWidget {
  StartTrainingSessionPage({Key? key}) : super(key: key);

  @override
  State<StartTrainingSessionPage> createState() =>
      _StartTrainingSessionPageState();
}

class _StartTrainingSessionPageState extends State<StartTrainingSessionPage> {
  List currentGroup = [];

  getTotalExercises(GotTrainingSessionState state) {
    final exericises = state.session.exercises!.groupBy((m) => m.groupId);
    DoneSessionState.id = state.session.id!;
    SwapTrainingExerciseState.sessionId = state.session.id!;

    for (int exerciseIndex = 0;
        exerciseIndex < exericises.length;
        exerciseIndex++) {
      currentGroup.add(exericises.values.elementAt(exerciseIndex));
    }

    return currentGroup;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: ColorsLimitless.backgroundColor,
      body: BlocBuilder<GetTrainingSessionBloc, TrainingSessionExerciseState>(
        builder: (context, state) {
          if (state is GotTrainingSessionState) {
            if (currentGroup.isEmpty) {
              getTotalExercises(state);
            }
            return Stack(
              children: [
                Column(
                  children: [
                    TrainingSessionTopPanel(
                      exerciseLength: currentGroup.length,
                    ),
                    Indicators(
                      exerciseLength: currentGroup.length,
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.r),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.r,
                                ),
                                CoachNameCard(
                                  state: state,
                                ),
                                SizedBox(
                                  height: 20.r,
                                ),
                                AllTrainingCard(
                                  trainingState: state,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                if (isKeyboard)
                  Positioned(
                      bottom: 0.r,
                      child: Container(
                        padding: EdgeInsets.only(right: 10.r),
                        height: 50.r,
                        alignment: Alignment.centerRight,
                        width: 1.sw,
                        color: Colors.white,
                        child: GestureDetector(
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 14.sp,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
                                color: ColorsLimitless.brandColor),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ))
              ],
            );
          }
          if (state is ErrorTrainingSessionState) {
            return const Center(
              child: Text('Error'),
            );
          }
          if (state is LoadingTrainingSessionState) {
            return const AppLoadingWidget();
          }
          if (state is EmptyTrainingSessionState) {
            return const Center(child: Text('No training session yet'));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
