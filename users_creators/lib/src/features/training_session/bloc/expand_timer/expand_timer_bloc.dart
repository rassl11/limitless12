import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_state.dart';
import 'package:users_creators/src/features/training_session/bloc/expand_timer/expand_timer_event.dart';
import 'package:users_creators/src/features/training_session/bloc/expand_timer/expand_timer_state.dart';

class ExpandTimerBloc extends Bloc<ExpandedTimerEvent,ExpandedTimerState>{
  ExpandTimerBloc() : super((NotExpandedTimerState())) {
    on<ExpandTimerEvent>((event, emit) async {
      emit(
        ExpandTimerState(),
      );
      try {} catch (_) {}
    });
    on<CloseTimerEvent>((event, emit) async {
      emit(NotExpandedTimerState());
      try {} catch (_) {}
    });
  }
}
