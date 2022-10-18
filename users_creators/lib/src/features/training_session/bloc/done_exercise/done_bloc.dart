import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_event.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_state.dart';

class DoneExerciseBloc
    extends Bloc<DoneExerciseEvent, DoneExerciseState> {
  DoneExerciseBloc() : super((NotDidExerciceState())) {
    on<DidExerciseEvent>((event, emit) async {
      emit(
        DidExerciseState(),
      );
      try {} catch (_) {}
    });
    on<NotDidExerciceEvent>((event, emit) async {
      emit(NotDidExerciceState());
      try {} catch (_) {}
    });
  }
}
