abstract class UserWorkoutState{}

class UserCloserWorkoutState extends UserWorkoutState{}

class UserErrorWorkoutState extends UserWorkoutState{}

class UserLoadingWorkoutState extends UserWorkoutState {}

class UserLoadedWorkout extends UserWorkoutState{
    List<dynamic> userLoadedWorkout;
  UserLoadedWorkout({
    required this.userLoadedWorkout
  });
}


