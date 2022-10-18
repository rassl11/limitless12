abstract class DoneExerciseState {
  static List doneExercises = [];


  static void checkIfDone(a) {
    doneExercises.add(a);
  }
}

class DidExerciseState extends DoneExerciseState {}

class NotDidExerciceState extends DoneExerciseState {}
