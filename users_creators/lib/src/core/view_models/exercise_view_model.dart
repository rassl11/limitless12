import 'package:json_annotation/json_annotation.dart';

import 'set_view_model.dart';



class ExerciseViewModel {
  String exerciseId;
  String name;
  String description;
  String youtubeLink;
  String image;
  String groupId;
  int round;
  int restIntervalSec;
  int repMax;
  List<SetViewModel> sets;

  ExerciseViewModel({
    required this.exerciseId,
    required this.name,
    required this.description,
    required this.youtubeLink,
    required this.image,
    required this.groupId,
    required this.round,
    required this.restIntervalSec,
    required this.repMax,
    required this.sets,
  });
}
