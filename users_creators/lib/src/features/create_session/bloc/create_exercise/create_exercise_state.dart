abstract class CreateExerciseState {
  static late String youtubeLink;
  static late String exerciseDescription = '';
  static late String typeOfExercise = '';
  static late String title = '';
  static late String equipmentUsed = '';
  static  late String primaryMuscleGroup = '';
  static late String videoUrl = '';
  static  String otherMuscles = '';
  static bool pressed = false;
}

class CreatedExerciseState extends CreateExerciseState {}

class NotCreatedExerciseState extends CreateExerciseState {}
