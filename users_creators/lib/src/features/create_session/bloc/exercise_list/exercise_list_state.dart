import '../../entity/domain/exercise_model.dart';

abstract class ExerciseListState {
  static int index = -1;
}

class ExerciseLoadedListState extends ExerciseListState {
  final List<ExerciseModel> myExerciseList;
  final List<ExerciseModel> basicExerciseList;

  ExerciseLoadedListState({required this.myExerciseList, required this.basicExerciseList});
}

class ExerciseLoadingListState extends ExerciseListState {}

class ExerciseEmptyListState extends ExerciseListState {}

class ExerciseErrorListState extends ExerciseListState {}
