import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/library/bloc/get_session_id/get_session_event.dart';
import 'package:users_creators/src/features/library/bloc/get_session_id/get_session_state.dart';
import 'package:users_creators/src/features/library/repo/my_sessions_repository.dart';

class GetSessionBloc extends Bloc<GetSessionEvent, GetSessionState> {
  GetSessionBloc() : super(EmptySessionState()) {
    on<GetSessionEvent>((event, emit) async {
      emit(LoadingGettingState());
      try {
        var result = await MySessionsRepository().getSessionById(event.sessionId);
        emit(GotSessionState(session: result));
      } catch (_) {
        emit(ErrorGettingState());
      }
    });
  }
}
