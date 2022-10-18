part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.notSubscribed() = NotSubscibed;
  const factory SessionState.haveNoSession() = HaveNoSession;
  const factory SessionState.haveSession({required List<Session> sessions}) = HaveSessions;
  const factory SessionState.loading() = Loading;
}
