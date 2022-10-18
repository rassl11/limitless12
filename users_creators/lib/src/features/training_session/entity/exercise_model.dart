class TrainingExerciseModel {
  String number;
  List<String> name;
  List<String> image;
  bool? record;
  List<String>? details;
  String? status;

  TrainingExerciseModel(
      {required this.record,
      required this.status,
      required this.number,
      required this.name,
      required this.image,
      required this.details});
}

List<TrainingExerciseModel> trainingExerciseList = [
  TrainingExerciseModel(
      status: 'record',
      record: true,
      details: ['3 x 12 @ 20 kg'],
      name: ['Db Bench Press'],
      image: ['assets/images/training_session/run_man.png'],
      number: '2.Triset '),
  TrainingExerciseModel(
    status: 'swap',
    record: null,
    details: ['3 x 12 @ 20 kg'],
    name: ['Db Bench Press'],
    image: ['assets/images/training_session/run_man.png'],
    number: '2',
  ),
  TrainingExerciseModel(
    status: 'dismiss',
    record: null,
    details: ['3 x 12 @ 20 kg'],
    name: ['Db Bench Press'],
    image: ['assets/images/training_session/run_man.png'],
    number: '3',
  ),
  TrainingExerciseModel(
    status: null,
    record: null,
    details: ['3 x 12 @ 20 kg'],
    name: ['Db Bench Press'],
    image: ['assets/images/training_session/run_man.png'],
    number: '4',
  ),
  TrainingExerciseModel(
    status: null,
    record: null,
    details: ['3 x 12 @ 20 kg'],
    name: ['Db Bench Press'],
    image: ['assets/images/training_session/run_man.png'],
    number: '5',
  ),
  TrainingExerciseModel(
    status: null,
    record: null,
    details: ['3 x 12 @ 20 kg'],
    name: ['Db Bench Press'],
    image: ['assets/images/training_session/run_man.png'],
    number: '6',
  ),
];
