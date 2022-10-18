class TrainingModel {
  String number;
  List<String> name;
  List<String> image;
  List<String>? details;
  List<int> reps;
  List<int> kg;
  List<int> set;

  TrainingModel({
      required this.number,
      required this.name,
      required this.image,
      required this.details,
      required this.reps,
      required this.set,
      required this.kg});
}

List<TrainingModel> trainingModelList = [
  TrainingModel(
    details: ['3 x 12 @ 20 kg','3 x 12 @ 20 kg'],
    set: [1],
    name: ['Db Bench Press','Db Bench Press'],
    image: ['assets/images/training_session/run_man.png','assets/images/training_session/run_man.png'],
    kg: [],
    reps: [],
    number: '2.Triset ',
  ),
  TrainingModel(
    details: ['3 x 12 @ 20 kg'],
    name: ['Db Bench Press'],
    set: [1,2,3],
    image: ['assets/images/training_session/run_man.png'],
    kg: [],
    reps: [],
    number: '2',
  ),
];
