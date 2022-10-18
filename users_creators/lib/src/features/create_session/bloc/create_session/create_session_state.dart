import 'package:users_creators/src/core/view_models/exercise_view_model.dart';

abstract class BaseCreateSessionState {
  static String id = '';
}

class DefaultSessionState extends BaseCreateSessionState {
  String name;
  String instructions;
  List<ExerciseViewModel> exercises = [];

  DefaultSessionState({
    required this.name,
    required this.instructions,
    required this.exercises,
  });
}

class CreatingSessionState extends BaseCreateSessionState {}
