abstract class UserSessionState{}

class UserEmptyState extends UserSessionState{}

class UserErrorState extends UserSessionState{}

class UserLoadingState extends UserSessionState {}

class UserLoadedTemplates extends UserSessionState{
    List<dynamic> userLoadedTemplates;
  UserLoadedTemplates({
    required this.userLoadedTemplates
  });
}

class UserLoadedCalendar extends UserSessionState{
  List<dynamic> userLoadedCalendar;
  UserLoadedCalendar({
    required this.userLoadedCalendar
  });
}

