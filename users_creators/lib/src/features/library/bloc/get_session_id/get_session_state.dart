import 'package:users_creators/src/features/library/entity/domain/session_model.dart';

abstract class GetSessionState {}

class GotSessionState extends GetSessionState {
  final SessionModel session;
  GotSessionState({required this.session});
}

class ErrorGettingState extends GetSessionState {}

class LoadingGettingState extends GetSessionState {}

class EmptySessionState extends GetSessionState {}
