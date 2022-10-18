class WorkOutPopup {
  String number;
  String image;
  List<String> title;
  List<String> subtitle;

  WorkOutPopup(
      {required this.image,
      required this.number,
      required this.subtitle,
      required this.title});
}

List<WorkOutPopup> workOutPopup = [
  WorkOutPopup(
    image: 'assets/images/workout_popup/run_man.png',
    number: '1',
    title: ['Db Bench Press'],
    subtitle: ['3 x 12 @ 20 kg'],
  ),
  WorkOutPopup(
    image: 'assets/images/workout_popup/run_man.png',
    number: '2',
    title: ['Db Bench Press'],
    subtitle: ['3 x 12 @ 20 kg'],
  ),
  WorkOutPopup(
    image: 'assets/images/workout_popup/run_man.png',
    number: '3.Superset',
    title: ['Db Bench Press'],
    subtitle: ['3 x 12 @ 20 kg'],
  ),
];


