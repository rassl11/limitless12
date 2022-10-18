import 'package:json_annotation/json_annotation.dart';

part 'start_session.g.dart';

@JsonSerializable()
class StartSessionModel {
  String? id;
  String? name;
  String? instructions;
  int? restIntervalSec;
  String? userId;
  String? userAvatarUrl;
  String? firstName;
  String? lastName;
  bool? isMine;
  bool? isArchived;
  List<Exercises>? exercises;

  StartSessionModel(
      {this.id,
      this.name,
      this.instructions,
      this.restIntervalSec,
      this.userId,
      this.userAvatarUrl,
      this.firstName,
      this.lastName,
      this.isMine,
      this.isArchived,
      this.exercises});

  factory StartSessionModel.fromJson(Map<String, dynamic> json) => _$StartSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$StartSessionModelToJson(this);
}

@JsonSerializable()
class Exercises {
  String? title;
  String? imageUrl;
  int? orderNumber;
  String? id;
  int? restIntervalSec;
  int? round;
  String? groupId;
  int? repMax;
  List<Sets>? sets;
  List doneRound= [];


  Exercises({this.title, this.id, this.imageUrl, this.orderNumber, this.restIntervalSec, this.round, this.groupId, this.repMax, this.sets});

  factory Exercises.fromJson(Map<String, dynamic> json) => _$ExercisesFromJson(json);

  Map<String, dynamic> toJson() => _$ExercisesToJson(this);
}

@JsonSerializable()
class Sets {
  String? id;
  int? orderNumber;
  String? repeats;
  int? weight;
  bool? isDone;

  Sets({this.id, this.orderNumber, this.repeats, this.weight, this.isDone});

  factory Sets.fromJson(Map<String, dynamic> json) => _$SetsFromJson(json);

  Map<String, dynamic> toJson() => _$SetsToJson(this);
}
