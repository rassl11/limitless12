abstract class TrainingExpandCardState {
  static int indexOfExercise = -1;
  static int indexOfCard = -1;

  static void changeIndexOfExercese(int a) {
    indexOfExercise = a;
  }

  static void changeIndexOfCard(int a) {
    indexOfCard = a;
  }
}

class TrainingOpenedCardState extends TrainingExpandCardState {}

class TrainingClosedCardState extends TrainingExpandCardState {}
