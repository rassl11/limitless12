import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_info/exercise_info_event.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_info/exercise_info_state.dart';
import 'package:users_creators/src/features/create_session/repo/create_session_repo.dart';

class ExerciseInfoBloc extends Bloc<ExerciseInfoEvent, ExerciseInfoState> {
  ExerciseInfoBloc() : super((EmptyExerciseInfoState())) {
    on<LoadExerciseInfoEvent>((event, emit) async {
      try {
        final loadedExercise = await CreateSessionRepo().getExerciseInfo();
        final typeOfExercise = loadedExercise.typeOfExercise;
        final primaryMuscle = loadedExercise.primaryMuscleGroup;
        final equipment = loadedExercise.equipmentUsed;
        final othersMuscle = loadedExercise.otherMuscleGroup;
        emit(LoadedExerciseInfoState(
            typeOfExercise: typeOfExercise!,
            primaryMuscle: primaryMuscle!,
            equipment: equipment!,
            otherMuscle: othersMuscle!));
      } catch (_) {
        emit(EmptyExerciseInfoState());
      }
    });
  }
}
