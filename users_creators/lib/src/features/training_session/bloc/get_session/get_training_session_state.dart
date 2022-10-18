import 'package:users_creators/src/features/training_session/entity/start_session.dart';

abstract class TrainingSessionExerciseState {
  static String sessionId = '6d2dc921-cf37-4c0b-b1eb-1f21ed6f04a2';
  final StartSessionModel session;
  TrainingSessionExerciseState({required this.session});
}

class GotTrainingSessionState extends TrainingSessionExerciseState {
  GotTrainingSessionState({required super.session});
}

class ErrorTrainingSessionState extends TrainingSessionExerciseState {
  ErrorTrainingSessionState({required super.session});
}

class LoadingTrainingSessionState extends TrainingSessionExerciseState {
  LoadingTrainingSessionState({required super.session});
}

class EmptyTrainingSessionState extends TrainingSessionExerciseState {
  EmptyTrainingSessionState({required super.session});
}
