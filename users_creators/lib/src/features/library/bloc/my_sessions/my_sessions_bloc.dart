import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_event.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_state.dart';
import 'package:users_creators/src/features/library/repo/my_sessions_repository.dart';

class MySessionsCalendarBloc extends Bloc<BaseMySessionsEvent, MySessionCalendarState> {
  MySessionsCalendarBloc() : super((LoadedSessionsState(loadedSessions: []))) {
    on<LoadSessionCalendarEvent>((event, emit) async {
      emit(LoadingSessionsState());

      try {
        final sessions = await MySessionsRepository().getUserSessions();
        if (sessions.isEmpty) {
          emit(EmptySessionsState());
        } else {
          emit(LoadedSessionsState(loadedSessions: sessions));
        }
      } catch (_) {
        emit(ErrorSessionsState());
      }
    });
  }
}

class MySessionsTemplatesBloc extends Bloc<BaseMySessionsEvent, MySessionTemplatesState> {
  MySessionsTemplatesBloc() : super((EmptyTemplatesState())) {
    on<LoadSessionTemplatesEvent>((event, emit) async {
      emit(LoadingTemplatesState());
      try {
        final templates = await MySessionsRepository().getUserTemplates();
        if (templates.isEmpty) {
          emit(EmptyTemplatesState());
        } else {
          emit(LoadedTemplatesState(loadedTemplate: templates));
        }
      } catch (_) {
        emit(ErrorTemplateState());
      }
    });
  }
}

class MySessionsOptionsBloc extends Bloc<BaseMySessionsOptionsEvent, MySessionsOptionsState> {
  MySessionsOptionsBloc() : super((MySessionsOptionsState())) {
    on<SetSessionToDateEvent>((event, emit) async {
      var isSuccess = await MySessionsRepository().setSessionToDate(event.sessionId, event.date);
      if (isSuccess) {
        event.onSuccess();
      } else {
        event.onError();
      }
    });
    on<DeleteSessionEvent>((event, emit) async {
      var isDeleted = await MySessionsRepository().deleteSession(event.sessionId);
      if (isDeleted) {
        event.onSuccess();
      } else {
        event.onError();
      }
    });
    on<CopySessionEvent>((event, emit) async {
      var isCopied = await MySessionsRepository().copySession(event.sessionId);
      if (isCopied) {
        event.onSuccess();
      } else {
        event.onError();
      }
    });
  }
}
