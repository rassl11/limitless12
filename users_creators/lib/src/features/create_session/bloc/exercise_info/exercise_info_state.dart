import 'package:users_creators/src/features/create_session/entity/domain/get_exercise.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/exercise.dart';

abstract class ExerciseInfoState {}

class LoadedExerciseInfoState extends ExerciseInfoState {
  final List typeOfExercise;
  final List equipment;
  final List primaryMuscle;
  final List otherMuscle;
  LoadedExerciseInfoState({
    required this.typeOfExercise,
    required this.equipment,
    required this.otherMuscle,
    required this.primaryMuscle
    });

}

class EmptyExerciseInfoState extends ExerciseInfoState {}
