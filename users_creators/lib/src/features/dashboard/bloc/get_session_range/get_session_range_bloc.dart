import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_event.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_state.dart';
import 'package:users_creators/src/features/dashboard/repo/dashboard_repo.dart';

class GetSessionRangeBloc
    extends Bloc<GetSessionRangeEvent, GetSessionRangeState> {
  GetSessionRangeBloc() : super((NotGetSessionRangeState())) {
    on<GotSessionRangeEvent>((event, emit) async {
      if (state is NotGetSessionRangeState) {
        emit(LoadingGetSessionRangeState());
      }
      try {
        final summary = await DashboardRepo().getSummary(event.requestRange);
        final getHours = await DashboardRepo().getHours(event.requestRange);
        final getVolume = await DashboardRepo().getVolume(event.requestRange);
        final getReps = await DashboardRepo().getReps(event.requestRange);
        emit(GotSessionRangeState(
            range: GetSessionRangeEvent.lastRequestDate,
            getSummary: summary,
            getHours: getHours,
            getReps: getReps,
            getVolume: getVolume));
      } catch (_) {
        emit(ErrorGetSessionRangeState());
      }
    });
    on<UpdateSessionRangeEvent>((event, emit) async {
      emit(LoadingGetSessionRangeState());
      try {
        final summary = await DashboardRepo().getSummary(event.requestRange);
        final getHours = await DashboardRepo().getHours(event.requestRange);
        final getVolume = await DashboardRepo().getVolume(event.requestRange);
        final getReps = await DashboardRepo().getReps(event.requestRange);
        emit(GotSessionRangeState(
            range: GetSessionRangeEvent.lastRequestDate,
            getSummary: summary,
            getHours: getHours,
            getReps: getReps,
            getVolume: getVolume));
      } catch (_) {
        emit(ErrorGetSessionRangeState());
      }
    });
  }
}
