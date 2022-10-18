import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_event.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/repo/training_session_repo.dart';

class GetTrainingSessionBloc extends Bloc<TrainingSessionExerciseEvent, TrainingSessionExerciseState> {
  GetTrainingSessionBloc() : super(EmptyTrainingSessionState(session: StartSessionModel())) {
    on<TrainingSessionLoadEvent>((event, emit) async {
      emit(LoadingTrainingSessionState(session: StartSessionModel()));
      try {
        final result = await TrainingSessionRepo().startSession(TrainingSessionExerciseState.sessionId);

        emit(GotTrainingSessionState(session: result));
      } catch (_) {
        emit(ErrorTrainingSessionState(session: StartSessionModel()));
      }
    });
  }
}
