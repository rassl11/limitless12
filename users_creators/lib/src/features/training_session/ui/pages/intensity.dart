import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_event.dart';
import 'package:users_creators/src/features/training_session/bloc/done_session/done_session_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/done_session/done_session_event.dart';
import 'package:users_creators/src/features/training_session/bloc/done_session/done_session_state.dart';
import 'package:users_creators/src/features/training_session/bloc/finished_round/finished_round_state.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';
import 'package:users_creators/src/features/training_session/bloc/session_duration/session_duration_cubit.dart';
import 'package:users_creators/src/features/training_session/bloc/timer_for_session/sesion_timer_state.dart';
import 'package:users_creators/src/features/training_session/bloc/timer_for_session/session_timer_bloc.dart';
import 'package:users_creators/src/features/training_session/entity/done_session_model.dart';

import '../../bloc/timer_for_session/session_timer_event.dart';

class Intensity extends StatefulWidget {
  const Intensity({Key? key}) : super(key: key);

  @override
  State<Intensity> createState() => _IntensityState();
}

class _IntensityState extends State<Intensity> {
  double intensity = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTrainingSessionBloc, TrainingSessionExerciseState>(
      builder: (context, trainingState) {
        return BlocBuilder<SessionTimerBloc, SessionTimerState>(
          builder: (context, state) {
            return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                backgroundColor: ColorsLimitless.backgroundColor,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 1.sw,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SafeArea(
                            bottom: false,
                            child: Text(
                              'Intensity',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontSize: 18.sp,
                                  color: ColorsLimitless.textColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10.r,
                          ),
                          Text(
                            'How did this session feel?',
                            style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 12.sp,
                                color: ColorsLimitless.textColor,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 14.r,
                          ),
                          Text(
                            intensity <= 0.4
                                ? 'Easy'
                                : intensity <= 0.7
                                    ? 'Medium'
                                    : 'Hard',
                            style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: ColorsLimitless.textColor),
                          ),
                          SizedBox(
                            height: 20.r,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.r),
                            child: Container(
                              height: 8.r,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFF04A832),
                                    Color(0xFF8AD916),
                                    Color(0xFFFFF627),
                                    Color(0xFFFFC700),
                                    Color(0xFFD13807)
                                  ]),
                                  borderRadius: BorderRadius.circular(6.r)),
                              child: SliderTheme(
                                data: const SliderThemeData(
                                    disabledActiveTrackColor:
                                        Colors.transparent,
                                    disabledInactiveTrackColor:
                                        Colors.transparent,
                                    activeTrackColor: Colors.transparent,
                                    inactiveTrackColor: Colors.transparent,
                                    thumbColor: Colors.red,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 10)),
                                child: Slider(
                                  value: intensity,
                                  onChanged: (val) {
                                    setState(() {
                                      intensity = val;
                                      DoneSessionState.intensity =
                                          (val * 10).toInt();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.r,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7.r,
                    ),
                    Category(
                    
                      subTitle: 'minutes',
                      title: 'Training duration',
                    ),
                    SizedBox(
                      height: 7.r,
                    ),
                    Stack(
                      children: [
                        Image.asset(
                            'assets/images/training_session/weight.png'),
                        Center(
                          heightFactor: 5,
                          child: Text(
                            'COMING SOON',
                            style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 23.sp,
                                color: ColorsLimitless.greyMedium,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.italic),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 7.r,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Image.asset('assets/images/training_session/fat.png'),
                          Center(
                            heightFactor: 5,
                            child: Text(
                              'COMING SOON',
                              style: TextStyle(
                                  fontFamily: "SF Pro",
                                  fontSize: 23.sp,
                                  color: ColorsLimitless.greyMedium,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        child: Container(
                          color: Colors.white,
                          child: SizedBox(
                            height: 40.h,
                            child: Material(
                              borderRadius: BorderRadius.circular(6.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(6.r),
                                splashFactory: InkRipple.splashFactory,
                                splashColor: ColorsLimitless.brandColor,
                                child: Ink(
                                  padding: EdgeInsets.zero,
                                  height: 0.07.sh,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: ColorsLimitless.brandColor),
                                  child: Center(
                                    child: Text(
                                      'Finish session',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "SF Pro",
                                          letterSpacing: 0.7,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  DoneSessionState.trainingDurationInMinutes =
                                      state.minutes ;
                                  for (int exerciseIndex = 0;
                                      exerciseIndex <
                                          trainingState
                                              .session.exercises!.length;
                                      exerciseIndex++) {
                                    DoneSessionState.exercise.add(Exercises(
                                        groupId: trainingState.session
                                            .exercises![exerciseIndex].groupId,
                                        round: trainingState.session
                                            .exercises![exerciseIndex].round,
                                        id: trainingState.session
                                            .exercises![exerciseIndex].groupId,
                                        sets: trainingState.session
                                            .exercises![exerciseIndex].sets!
                                            .map((e) =>
                                                ExecuteSet.fromJson(e.toJson()))
                                            .toList()));
                                  }
                                  context
                                      .read<DoneSessionBloc>()
                                      .add(DidSessionEvent());
                                  context
                                      .read<ChangeIndicatorLengthBloc>()
                                      .add(InitialStateIndicatorLengthEvent());
                                  FinishRoundState.finishedRound.clear();
                                  context
                                      .read<DoneSessionBloc>()
                                      .add(DidSessionEvent());
                                  context.router.push(BottomBarPageRoute());
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.subTitle,
    required this.title,

  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionTimerBloc, SessionTimerState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 18.r,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorsLimitless.textColor),
              ),
              SizedBox(
                height: 12.r,
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 12.sp,
                    color: ColorsLimitless.textColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 12.r,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                        'assets/icons/training_session/minus.svg'),
                    onTap: () {
                      if (state.minutes > 1) {
                      context
                          .read<SessionTimerBloc>()
                          .add(DecrementTimerEvent());
                      }
                    },
                  ),
                  SizedBox(
                    width: 8.r,
                  ),
                  Container(
                    width: 90.r,
                    height: 35.r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(color: ColorsLimitless.greyLight)),
                    child: Center(child: Text('${state.minutes}')),
                  ),
                  SizedBox(
                    width: 8.r,
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                        'assets/icons/training_session/plus.svg'),
                    onTap: () {
                      context
                          .read<SessionTimerBloc>()
                          .add(IncrementTimerEvent());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 25.r,
              ),
            ],
          ),
        );
      },
    );
  }
}
