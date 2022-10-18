import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/finished_round/finished_round_event.dart';
import 'package:users_creators/src/features/training_session/bloc/finished_round/finished_round_state.dart';

class FinishRoundBloc extends Bloc<FinishRoundEvent, FinishRoundState>{
    FinishRoundBloc() : super((NotFinishedRoundState())) {
    on<FinishedRoundEvent>((event, emit) async {
      emit(
        FinishedRoundState(),
      );
      try {} catch (_) {}
    });
    }
}