import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_event.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';
import 'package:users_creators/src/features/training_session/bloc/swap_exercise/swap_exercise_event.dart';
import 'package:users_creators/src/features/training_session/bloc/swap_exercise/swap_exercise_state.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/entity/swap_session_model.dart';
import 'package:users_creators/src/features/training_session/repo/training_session_repo.dart';

class SwapTrainingExerciseBloc
    extends Bloc<SwapTrainingExerciseEvent, SwapTrainingExerciseState> {
  SwapTrainingExerciseBloc() : super(SwapedTrainingExerciseState()) {
    on<SwapedTrainingExerciseEvent>((event, emit) async {
      try {
        final result = await TrainingSessionRepo().swapTrainingExercise(
            SwapExercise(
                sessionId: SwapTrainingExerciseState.sessionId,
                groupId: SwapTrainingExerciseState.groudId,
                round: SwapTrainingExerciseState.round,
                swappedExercises: SwapTrainingExerciseState.swappedExercises));

        emit(SwapedTrainingExerciseState());
      } catch (_) {}
    });
  }
}
