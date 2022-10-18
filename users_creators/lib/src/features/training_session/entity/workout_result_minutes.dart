class WorkoutResulMinutes{
  List<String> icon;
  List<String> result;
  List<String> name;

  WorkoutResulMinutes({
    required this.icon,
    required this.result,
    required this.name
  });

  
}

List<WorkoutResulMinutes> workoutResultMinutes = [
    WorkoutResulMinutes(
      icon: ['assets/icons/training_session/bloc.svg','assets/icons/training_session/minutes.svg','assets/icons/training_session/intensity.svg'],
      result: ['4/4','75','7/10'],
      name: ['Blocks','Minutes','Intensity']
    )
  ];