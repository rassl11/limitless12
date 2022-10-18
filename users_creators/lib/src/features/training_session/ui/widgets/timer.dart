import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expand_timer/expand_timer_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expand_timer/expand_timer_state.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/expanded_timer.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/simple_timer.dart';

import '../../bloc/expand_timer/expand_timer_event.dart';

class TimerBottomSheet extends StatefulWidget {
  TimerBottomSheet({Key? key, required this.timerDuration}) : super(key: key);

  Duration timerDuration;

  @override
  _TimerBottomSheetState createState() => _TimerBottomSheetState();
}

class _TimerBottomSheetState extends State<TimerBottomSheet> {
  late Timer countdownTimer;
  late double value;
  late bool pause;
  late int totalDurationInSeconds;
  late int seconds;
  late DraggableScrollableController _controller;
  bool isExpanded = false;

  @override
  void initState() {
    pause = true;
    value = 0;
    _controller = DraggableScrollableController();
    _controller.addListener(
      () {
        if (isExpanded == false && _controller.pixels > 400) {
          isExpanded = true;
          context.read<ExpandTimerBloc>().add(ExpandTimerEvent());
        } else if (isExpanded == true && _controller.pixels < 400) {
          isExpanded = false;
          context.read<ExpandTimerBloc>().add(CloseTimerEvent());
        }
      },
    );
    startTimer();
    totalDurationInSeconds = widget.timerDuration.inSeconds;

    super.initState();
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      setCountDown();
      startIndicatorTimer();
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    countdownTimer.cancel();
  }

  void resetTimer() {
    countdownTimer.cancel();
    setState(() {
      widget.timerDuration = const Duration(minutes: 0, seconds: 0);
      value = 1;
    });
  }

  void startIndicatorTimer() {
    setState(() {
      if (value >= 1) {
        countdownTimer.cancel();
        pause = false;
      } else {
        value = 1 - (seconds / totalDurationInSeconds);
      }
    });
  }

  void changePause() {
    if (pause == false) {
      pause = true;
      startTimer();
    } else {
      pause = false;
      stopTimer(reset: false);
    }
    setState(() {});
  }

  void setCountDown() {
    int reduceSecondsBy = 1;
    setState(() {
      seconds = widget.timerDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer.cancel();
        pause = false;
      } else {
        widget.timerDuration = Duration(seconds: seconds);
      }
    });
  }

  void addDuration() {
    widget.timerDuration = widget.timerDuration + const Duration(seconds: 15);
    totalDurationInSeconds = totalDurationInSeconds + 15;
  }

  void subsctactDuration() {
    widget.timerDuration = widget.timerDuration - const Duration(seconds: 15);
    totalDurationInSeconds = totalDurationInSeconds - 15;
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(widget.timerDuration.inMinutes.remainder(60));
    final seconds = strDigits(widget.timerDuration.inSeconds.remainder(60));
    return BlocBuilder<ExpandTimerBloc, ExpandedTimerState>(
      builder: (context, state) {
        return DraggableScrollableSheet(
            controller: _controller,
            initialChildSize: 0.32,
            minChildSize: 0.2,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: scrollController,
                  child: SafeArea(
                      child: state is ExpandTimerState
                          ? ExpandedTimer(
                              reset: resetTimer,
                              addDuration: addDuration,
                              substractDuration: subsctactDuration,
                              pause: pause,
                              minutes: minutes,
                              seconds: seconds,
                              value: value,
                              changePauseStatus: changePause,
                              totalDurationInSeconds: totalDurationInSeconds,
                              timerDuration: widget.timerDuration)
                          : SimpleTimer(
                              reset: resetTimer,
                              addDuration: addDuration,
                              substractDuration: subsctactDuration,
                              pause: pause,
                              minutes: minutes,
                              seconds: seconds,
                              value: value,
                              changePauseStatus: changePause,
                              totalDurationInSeconds: totalDurationInSeconds,
                              timerDuration: widget.timerDuration)),
                ),
              );
            });
      },
    );
  }
}
