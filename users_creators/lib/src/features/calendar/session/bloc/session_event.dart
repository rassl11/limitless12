part of 'session_bloc.dart';

@freezed
 class SessionEvent with _$SessionEvent{
  const factory SessionEvent.getSessions({required DateTime date}) = _GetSessions;
  const factory SessionEvent.deleteSession({required String sessionId}) = _Delete;
  const factory SessionEvent.copySession({required String sessionId, required DateTime dateTime}) = _Copy;
  const factory SessionEvent.move({required String sessionId, required DateTime dateTime}) = _Move;
}