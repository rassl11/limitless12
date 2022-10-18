import 'package:users_creators/src/features/training_session/entity/swap_session_model.dart';

abstract class SwapTrainingExerciseState {
  static String? groudId = '';
  static String sessionId = '';
  static int? round = 0;
  static String? newExerciseId = '';
  static String oldExerciseId = '';
  static List<Sets> sets = [
    Sets(orderNumber: 0, repeats: 0, weight: 0, percent: 0)
  ];
  static List<SwappedExercises> swappedExercises = [
    SwappedExercises(
      oldExerciseId: oldExerciseId,
      newExerciseId: newExerciseId,
      sets: sets,
      orderNumber: 0
    )
  ];
}

class SwapedTrainingExerciseState extends SwapTrainingExerciseState {}
