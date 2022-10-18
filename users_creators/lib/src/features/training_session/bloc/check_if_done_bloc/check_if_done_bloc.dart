import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/check_if_done_bloc/check_if_done_event.dart';
import 'package:users_creators/src/features/training_session/bloc/check_if_done_bloc/check_if_done_state.dart';

class CheckIfExerciseDoneBloc
    extends Bloc<CheckIfExerciseDoneEvent, CheckIfExerciseDoneState> {
  CheckIfExerciseDoneBloc() : super(NotDoneExerciseStatusState(done: 1)) {
    on<DoneExerciseStatusEvent>((event, emit) {
    emit(DoneExerciseStatusState(done: state.done + 1));
    },);
    on<NotDoneExerciseStatusEvent>((event, emit) {
      emit(NotDoneExerciseStatusState(done: state.done = 1 ));
    });
  }
}
