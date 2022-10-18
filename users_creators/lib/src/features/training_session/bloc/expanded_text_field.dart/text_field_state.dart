abstract class TextFieldState {
  static int indexOfTextField = -1;
  static int indexOfCard = -1;
  static int indexOfExercise = -1;

  static void changeIndexOfTextField(int a) {
    indexOfTextField = a;
  }

  static void changeIndexOfCard(int a) {
    indexOfCard = a;
  }
    static void changeIndexOfExercise(int a) {
    indexOfExercise = a;
  }
}

class TextFieldOpenState extends TextFieldState {}

class TextFieldCloseState extends TextFieldState {}
