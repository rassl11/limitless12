abstract class BaseMySessionsEvent {}

class LoadSessionTemplatesEvent extends BaseMySessionsEvent {}

class LoadSessionCalendarEvent extends BaseMySessionsEvent {}

abstract class BaseMySessionsOptionsEvent {}

class SetSessionToDateEvent extends BaseMySessionsOptionsEvent {
  DateTime date;
  String sessionId;
  Function onSuccess;
  Function onError;

  SetSessionToDateEvent(
      {required this.sessionId,
      required this.date,
      required this.onSuccess,
      required this.onError});
}

class DeleteSessionEvent extends BaseMySessionsOptionsEvent {
  String sessionId;
  Function onSuccess;
  Function onError;

  DeleteSessionEvent({required this.sessionId, required this.onSuccess, required this.onError});
}

class CopySessionEvent extends BaseMySessionsOptionsEvent {
  String sessionId;
  Function onSuccess;
  Function onError;

  CopySessionEvent({required this.sessionId, required this.onSuccess, required this.onError});
}
