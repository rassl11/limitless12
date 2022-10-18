import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_event.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_state.dart';

class ExpandCardBloc extends Bloc<ExpandCardEvent, ExpandCardState> {
  ExpandCardBloc() : super((CloseCardState())) {
    on<CloseCardEvent>((event, emit) async {
      emit(
        CloseCardState(),
      );
      try {} catch (_) {}
    });
    on<OpenCardEvent>((event, emit) async {
      emit(OpenCardState());
      try {} catch (_) {}
    });
  }
}
