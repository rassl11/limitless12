abstract class ChangeIndicatorLengthState{
  int exerciseNumber;
  ChangeIndicatorLengthState({
    required this.exerciseNumber
  });
}

class ChangedIndicatorLengthState extends ChangeIndicatorLengthState {
  ChangedIndicatorLengthState({required super.exerciseNumber});
}