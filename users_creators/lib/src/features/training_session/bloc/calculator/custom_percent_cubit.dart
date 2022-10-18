import 'package:bloc/bloc.dart';

class CustomPercentCubit extends Cubit<int> {

  CustomPercentCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}