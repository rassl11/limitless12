class WorkoutResult{
  List<int> results;
  List<String> category;

  WorkoutResult({
    required this.results,
    required this.category
  });
}

List<WorkoutResult> workoutResultList = [
  WorkoutResult(
    results: [11,30,355],
    category: ['EXERCISE','SET','CATEGORY']
  )
];