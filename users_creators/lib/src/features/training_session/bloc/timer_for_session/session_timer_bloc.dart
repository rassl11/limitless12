import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/timer_for_session/sesion_timer_state.dart';
import 'package:users_creators/src/features/training_session/bloc/timer_for_session/session_timer_event.dart';
import 'dart:async';

class SessionTimerBloc extends Bloc<SessionTimerEvent, SessionTimerState> {
  SessionTimerBloc() : super(NotStartedSessionTimerState(0)) {
    Timer timer;
    int second = 0;
    timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => {
              second = second + 1,
              if (second >= 59 && second % 60 == 0)
                {
                  state.minutes = state.minutes + 1,
                }
            });
    on<StartSessionTimerEvent>((event, emit) async {
      timer;
      emit(StartedSessionTimerState(state.minutes));
    });

    on<StopSessionTimerEvent>(
      (event, emit) {
        timer.cancel();
        NotStartedSessionTimerState(state.minutes);
      },
    );
    on<IncrementTimerEvent>((event, emit) async {
      state.minutes = state.minutes + 1;
      emit(StartedSessionTimerState(state.minutes));
    });
    on<DecrementTimerEvent>((event, emit) async {
    
        state.minutes = state.minutes - 1;
      
      emit(StartedSessionTimerState(state.minutes));
    });
  }
}
