import 'package:users_creators/src/core/view_models/exercise_view_model.dart';

abstract class BaseSessionEvent {}

class CreateSessionEvent extends BaseSessionEvent {
  final Function(String) onNotValid;
  final Function onSuccess;
  final Function onError;
  final bool isEditing;

  CreateSessionEvent({
    required this.onNotValid,
    required this.onSuccess,
    required this.onError,
    required this.isEditing,
  });
}

class RefreshCreateSessionEvent extends BaseSessionEvent {}

class AddExercisesEvent extends BaseSessionEvent {
  final List<ExerciseViewModel> exercises;
  AddExercisesEvent({required this.exercises});
}

class SwapExercisesEvent extends BaseSessionEvent {
  final ExerciseViewModel exercise;
  SwapExercisesEvent({required this.exercise,});
}

class NameSetEvent extends BaseSessionEvent {
  String name;
  NameSetEvent({required this.name});
}

class InstructionsSetEvent extends BaseSessionEvent {
  String instructions;
  InstructionsSetEvent({required this.instructions});
}

class SetExerciseRestIntervalEvent extends BaseSessionEvent {
  final String groupId;
  final int restInterval;
  SetExerciseRestIntervalEvent(
      {required this.groupId, required this.restInterval});
}

class SetRoundsEvent extends BaseSessionEvent {
  final String groupId;
  final int rounds;
  SetRoundsEvent({required this.groupId, required this.rounds});
}

class DeleteExerciseEvent extends BaseSessionEvent {
  final String groupId;
  DeleteExerciseEvent({required this.groupId});
}

class SetWorkingMaxEvent extends BaseSessionEvent {
  final String exerciseId;
  final String groupId;
  final int repMax;
  SetWorkingMaxEvent({
    required this.exerciseId,
    required this.groupId,
    required this.repMax,
  });
}

class GetSessionByIdEvent extends BaseSessionEvent {
  final String sessionId;
  GetSessionByIdEvent({required this.sessionId});
}

class ClearSessionFieldsEvent extends BaseSessionEvent {
  ClearSessionFieldsEvent();
}
