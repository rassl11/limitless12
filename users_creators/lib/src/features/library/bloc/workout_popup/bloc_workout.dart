
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/library/bloc/workout_popup/user_popup_event.dart';
import 'package:users_creators/src/features/library/bloc/workout_popup/user_popup_state.dart';

import '../../entity/model/library/workout_popup.dart';


class UserWorkoutBloc extends Bloc<UserWorkoutEvent, UserWorkoutState> {


  UserWorkoutBloc() : super((UserCloserWorkoutState())) {
    on<ShowWorkoutEvent>((event, emit) async {
        emit(UserLoadingWorkoutState());
        try {
          emit(UserLoadedWorkout(userLoadedWorkout: workOutPopup));
        } catch (_) {
          emit(UserErrorWorkoutState());
        }
    });
    on<CloseWorkoutEvent>((event, emit) async {
        emit(UserCloserWorkoutState());

    });
  }
}
