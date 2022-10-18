import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_event.dart';
import 'package:users_creators/src/features/training_session/bloc/change_indicator_length/change_indicator_state.dart';

class ChangeIndicatorLengthBloc
    extends Bloc<ChangeIndicatorLengthEvent, ChangeIndicatorLengthState> {
  ChangeIndicatorLengthBloc() : super(ChangedIndicatorLengthState(exerciseNumber: 0)) {
    on<AddIndicatorLengthEvent>((event, emit) async {
      emit(
        ChangedIndicatorLengthState(exerciseNumber: state.exerciseNumber + 1),
      );
      try {} catch (_) {}
    });

      on<MinusIndicatorLengthEvent>((event, emit) async {
      emit(
        ChangedIndicatorLengthState(exerciseNumber: state.exerciseNumber - 1),
      );
      try {} catch (_) {}
    });

      on<InitialStateIndicatorLengthEvent>((event, emit) async {
      emit(
        ChangedIndicatorLengthState(exerciseNumber: state.exerciseNumber = 0),
      );
      try {} catch (_) {}
    });

    
  }
}
