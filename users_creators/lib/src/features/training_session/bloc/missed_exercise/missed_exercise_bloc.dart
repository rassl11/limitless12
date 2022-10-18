import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_event.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_state.dart';
import 'package:users_creators/src/features/training_session/bloc/missed_exercise/missed_exercise_event.dart';
import 'package:users_creators/src/features/training_session/bloc/missed_exercise/missed_exercise_state.dart';

class MissedExerciseBloc
    extends Bloc<MissedExerciseEvent, MissedExerciseState> {
  MissedExerciseBloc() : super((NotMissedExerciseState())) {
    on<MissExerciseEvent>((event, emit) async {
      emit(
        MissExerciseState(),
      );
      try {} catch (_) {}
    });
  }
}
