import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_event.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_state.dart';

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  TextFieldBloc() : super((TextFieldCloseState())) {
    on<TextFieldCloseEvent>((event, emit) async {
      emit(
        TextFieldCloseState(),
      );
      try {} catch (_) {}
    });
    on<TextFieldOpenEvent>((event, emit) async {
      emit(TextFieldOpenState());
      try {} catch (_) {}
    });
  }
}
