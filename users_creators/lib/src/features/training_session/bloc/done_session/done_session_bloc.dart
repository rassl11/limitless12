import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/done_session/done_session_event.dart';
import 'package:users_creators/src/features/training_session/bloc/done_session/done_session_state.dart';
import 'package:users_creators/src/features/training_session/entity/done_session_model.dart';
import 'package:users_creators/src/features/training_session/repo/training_session_repo.dart';

class DoneSessionBloc extends Bloc<DoneSessionEvent,DoneSessionState>{
  DoneSessionBloc() : super((NotDoneSessionState())) {
    on<DidSessionEvent>((event, emit) async {
      emit(DidSessionState(),
      );
      try {
        await TrainingSessionRepo().executeSession(DoneSessionModel(
            id: DoneSessionState.id,
            intensity: DoneSessionState.intensity,
            trainingDurationInMinutes: DoneSessionState.trainingDurationInMinutes,
            exercises: DoneSessionState.exercise
            ));
      } catch (_) {

      }
  
    });
  }
}