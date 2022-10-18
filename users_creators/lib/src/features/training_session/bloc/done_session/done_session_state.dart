import 'package:users_creators/src/features/training_session/entity/done_session_model.dart';

abstract class DoneSessionState {
  static int intensity = 0;
  static String id = '';
  static int trainingDurationInMinutes = 0;
  static List<Exercises> exercise = [];
  static List<ExecuteSet> sets = [];

}

class DidSessionState extends DoneSessionState{}

class NotDoneSessionState extends DoneSessionState{}