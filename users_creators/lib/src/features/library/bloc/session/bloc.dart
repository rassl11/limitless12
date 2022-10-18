
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/library/bloc/session/user_session_event.dart';
import 'package:users_creators/src/features/library/bloc/session/user_session_state.dart';

import '../../entity/model/library/calendar_model.dart';
import '../../entity/model/library/template_model.dart';


class UserBloc extends Bloc<UserSessionEvent, UserSessionState> {


  UserBloc() : super(UserLoadedCalendar(userLoadedCalendar: calendarList)) {
    on<CalendarEvent>((event, emit) async {
        emit(UserLoadingState());
        try {
          emit(UserLoadedCalendar(userLoadedCalendar: calendarList));
        } catch (_) {
          emit(UserErrorState());
        }
    });
    on<TemplatesEvent>((event, emit) {
      emit(UserLoadingState());
      try{
        emit(UserLoadedTemplates(userLoadedTemplates: libraryTemplateList));
      }
      catch(_){
          emit(UserErrorState());
      }
    },);
  }
}
