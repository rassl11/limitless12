
class LibraryTemplateList {
  String nameOfTrainer;
  String nameOfCard;
  List<String> exercice;

  LibraryTemplateList(
      {required this.nameOfTrainer,
      required this.nameOfCard,
      required this.exercice});
}

List<LibraryTemplateList> libraryTemplateList = [
  LibraryTemplateList(
      nameOfTrainer: 'JD',
      nameOfCard: 'Week 4 day 3',
      exercice: [
        'Leg Press, ',
        'Walking Lunges, ',
        'Lying Leg Curl,',
        'Calf Raise'
      ]),
];

