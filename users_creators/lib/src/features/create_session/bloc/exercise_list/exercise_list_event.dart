abstract class ExerciseListEvent {}

class ExerciseLoadEvent extends ExerciseListEvent {
  final int page;
  ExerciseLoadEvent({this.page = 1});
}

class SearchExerciseEvent extends ExerciseListEvent {
  final String value;

  SearchExerciseEvent({required this.value});
}

class DeleteExerciseEvent extends ExerciseListEvent {
  final String exerciseId;
  DeleteExerciseEvent({required this.exerciseId});
}
