import 'package:flutter_bloc/flutter_bloc.dart';

class SessionDurationCubit extends Cubit<int> {
  SessionDurationCubit() : super(30);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
