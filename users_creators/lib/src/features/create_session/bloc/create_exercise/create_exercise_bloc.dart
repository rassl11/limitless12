import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_exercise/create_exercise_event.dart';
import 'package:users_creators/src/features/create_session/bloc/create_exercise/create_exercise_state.dart';
import 'package:users_creators/src/features/create_session/entity/domain/create_exercise.dart';
import 'package:users_creators/src/features/create_session/repo/create_session_repo.dart';

class CreateExerciseBloc extends Bloc<CreateExerciseEvent, CreateExerciseState> {
  CreateExerciseBloc() : super((NotCreatedExerciseState())) {
    on<CreateNewExerciseEvent>(
      (event, emit) async {
        await CreateSessionRepo().createExercise(CreateExercise(
          youtubeLink: CreateExerciseState.youtubeLink,
          exerciseDescription: CreateExerciseState.exerciseDescription,
          notes: "",
          typeOfExercise: CreateExerciseState.typeOfExercise,
          tempo: 0,
          title: CreateExerciseState.title,
          equipmentUsed: CreateExerciseState.equipmentUsed,
          primaryMuscleGroup: CreateExerciseState.primaryMuscleGroup,
          videoUrl: CreateExerciseState.videoUrl,
          otherMuscles: CreateExerciseState.otherMuscles,
          id: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
        ));
      },
    );
  }
}
