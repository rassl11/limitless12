 abstract class CheckIfExerciseDoneState{
   int done;
   CheckIfExerciseDoneState({
     required this.done
   });
}

class DoneExerciseStatusState extends CheckIfExerciseDoneState{
  DoneExerciseStatusState({required super.done});
}

class NotDoneExerciseStatusState extends CheckIfExerciseDoneState{
  NotDoneExerciseStatusState({required super.done});
}