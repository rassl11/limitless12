import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_event.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_state.dart';
import 'package:users_creators/src/features/create_session/entity/domain/exercise_model.dart';
import 'package:users_creators/src/features/create_session/repo/create_session_repo.dart';

class ExerciseListBloc extends Bloc<ExerciseListEvent, ExerciseListState> {
  ExerciseListBloc() : super((ExerciseEmptyListState())) {
    on<ExerciseLoadEvent>((event, emit) async {
      emit(ExerciseLoadingListState());
      try {
        final basicExercise = await CreateSessionRepo().getBasicExercise(event.page);
        final myExercise = await CreateSessionRepo().getMyExercise();

        emit(ExerciseLoadedListState(myExerciseList: myExercise, basicExerciseList: basicExercise));
      } catch (_) {
        emit(ExerciseErrorListState());
      }
    });
    on<SearchExerciseEvent>((event, emit) async {
      emit(ExerciseLoadingListState());
      try {
        final exercises = await CreateSessionRepo().searchExercise(event.value);
        final myExercise = <ExerciseModel>[];
        final basicExercise = <ExerciseModel>[];
        myExercise.addAll(exercises.where((element) => element.isMine == true));
        basicExercise.addAll(exercises.where((element) => element.isMine == false));

        emit(ExerciseLoadedListState(myExerciseList: myExercise, basicExerciseList: basicExercise));
      } catch (_) {
        emit(ExerciseErrorListState());
      }
    });
    on<DeleteExerciseEvent>((event, emit) async {
      emit(ExerciseLoadingListState());
      try {
        final isDeleted = await CreateSessionRepo().deleteExerciseById(event.exerciseId);
        if (isDeleted) {
          final basicExercise = await CreateSessionRepo().getBasicExercise(1);
          final myExercise = await CreateSessionRepo().getMyExercise();
          emit(ExerciseLoadedListState(
              myExerciseList: myExercise, basicExerciseList: basicExercise));
        } else {
          emit(ExerciseErrorListState());
        }
      } catch (_) {
        emit(ExerciseErrorListState());
      }
    });
  }
}
