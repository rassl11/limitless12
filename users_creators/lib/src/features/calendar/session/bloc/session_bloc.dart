import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_creators/src/core/constants/common.dart';
import 'package:users_creators/src/features/calendar/session/repo/session_repo.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';
import 'package:users_creators/src/features/calendar/session/domain/set.dart';
import '../domain/exercise.dart';
import '../domain/session.dart';

part 'session_event.dart';
part 'session_state.dart';
part 'session_bloc.freezed.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final repo = SessionRepo();
  SessionBloc() : super(const SessionState.loading()) {
    on<_GetSessions>((event, emit) async {
      emit(const SessionState.loading());

      final session = await repo.getSessions(event.date);
      final List subscription = [1, 2];
      if (LoginRepo().getAuthData()!.role == UserRole.creator) {
        if (session.isEmpty) {
          emit(const SessionState.notSubscribed());
        } else {
          emit(SessionState.haveSession(sessions: session));
        }
      } else {
        if (subscription.isEmpty && session.isEmpty) {
          emit(const SessionState.notSubscribed());
        } else if (subscription.isNotEmpty && session.isEmpty) {
          emit(const SessionState.haveNoSession());
          // emit(SessionState.haveSession(sessions: sessionss));
        } else if (session.isNotEmpty) {
          emit(SessionState.haveSession(sessions: session));
        }
      }
    });
    on<_Delete>((event, emit) async {
      emit(const SessionState.loading());
      bool deleted = await repo.deleteSession(event.sessionId);
      if (deleted) {
        add(SessionEvent.getSessions(date: DateTime.now()));
      }
    });
    on<_Copy>((event, emit) async {
      emit(const SessionState.loading());
      await repo.copySession(event.sessionId, event.dateTime);

      add(SessionEvent.getSessions(date: DateTime.now()));
    });
    on<_Move>((event, emit) async {
      emit(const SessionState.loading());
      await repo.moveSession(event.sessionId, event.dateTime);

      add(SessionEvent.getSessions(date: DateTime.now()));
    });
  }

  // final sessionss = [Session(
  //                 name: 'fff',
  //                 sessionId: 'fdfd',
  //                 instructions: 'sds',
  //                 restIntervalSec: 3,
  //                 userId: 'dsdsd',
  //                 userAvatarUrl: 'dsdsdfs',
  //                 firstName: 'sdfsdfs',
  //                 isArchived: false,
  //                 isMine: true,
  //                 exercises: [
  //   Exercise(
  //       groupId: '0',
  //       title: 'title',
  //       imageUrl: null,
  //       orderNumber: 2,
  //       restIntervalSec: 8,

  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  //   Exercise(
  //       groupId: '1',
  //       title: 'title',
  //       imageUrl: null,
  //       orderNumber: 2,
  //       restIntervalSec: 8,

  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  //   Exercise(
  //     groupId: '2',
  //       title: 'title',
  //       imageUrl: null,
  //       restIntervalSec: 8,
  //       orderNumber: 2,
  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  //   Exercise(
  //       groupId: '1',
  //       title: 'title',
  //       imageUrl: null,
  //       restIntervalSec: 8,
  //       orderNumber: 2,
  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  //   Exercise(
  //       title: 'title',
  //       imageUrl: null,
  //       groupId: '2',
  //       orderNumber: 2,
  //       restIntervalSec: 8,
  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  // ])];
}
