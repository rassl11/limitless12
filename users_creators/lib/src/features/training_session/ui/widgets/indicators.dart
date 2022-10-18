import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_state.dart';
import 'package:users_creators/src/features/training_session/bloc/check_if_done_bloc/check_if_done_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/check_if_done_bloc/check_if_done_event.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';
import 'package:users_creators/src/features/training_session/bloc/timer_for_session/session_timer_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/timer_for_session/session_timer_event.dart';
import 'package:users_creators/src/features/training_session/entity/training_model.dart';

class Indicators extends StatelessWidget {
  const Indicators({
    Key? key,
    required this.exerciseLength,
  }) : super(key: key);

  final int exerciseLength;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeIndicatorLengthBloc, ChangeIndicatorLengthState>(
      listener: (context, state) {
        if (state.exerciseNumber == exerciseLength) {
          context.read<SessionTimerBloc>().add(StopSessionTimerEvent());
          context.router.navigateNamed('/Intensity');
          
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Container(
                color: Color(0xFFE6E8EC),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                      height: 5.r,
                      width: exerciseLength != 0 ?   (1.sw / exerciseLength ) * state.exerciseNumber : 
                      (1.sw / 1 ) * state.exerciseNumber,
                      color: const Color(0xFF23262F),
                      child: const SizedBox()),
                )),
          ],
        );
      },
    );
  }
}
