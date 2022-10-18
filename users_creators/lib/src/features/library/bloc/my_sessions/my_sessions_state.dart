import 'package:users_creators/src/features/library/entity/domain/session_model.dart';
import 'package:users_creators/src/features/library/entity/domain/template_model.dart';

abstract class MySessionTemplatesState {}

abstract class MySessionCalendarState {}

class MySessionsOptionsState {}

class LoadingTemplatesState extends MySessionTemplatesState {}

class LoadedTemplatesState extends MySessionTemplatesState {
  final List<TemplateModel> loadedTemplate;
  LoadedTemplatesState({required this.loadedTemplate});
}

class EmptyTemplatesState extends MySessionTemplatesState {}

class ErrorTemplateState extends MySessionTemplatesState {}

class LoadingSessionsState extends MySessionCalendarState {}

class LoadedSessionsState extends MySessionCalendarState {
  final List<SessionModel> loadedSessions;
  LoadedSessionsState({required this.loadedSessions});
}

class EmptySessionsState extends MySessionCalendarState {}

class ErrorSessionsState extends MySessionCalendarState {}
