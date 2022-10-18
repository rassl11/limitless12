import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_card/training_expand_card_event.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_card/training_expand_card_state.dart';

class TrainingExpandCardBloc extends Bloc<TrainingExpandCardEvent, TrainingExpandCardState> {
  TrainingExpandCardBloc() : super((TrainingClosedCardState())) {
    on<TrainingCloseCardEvent>((event, emit) async {
      emit(
        TrainingClosedCardState(),
      );
      try {} catch (_) {}
    });
    on<TrainingOpenCardEvent>((event, emit) async {
      emit(TrainingOpenedCardState());
      try {} catch (_) {}
    });
  }
}
