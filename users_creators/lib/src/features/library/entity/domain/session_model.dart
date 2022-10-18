import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  String id;
  String? name;
  String? instructions;
  String? userId;
  String? userAvatarUrl;
  String? firstName;
  String? lastName;
  bool? isMine;
  bool? isArchived;
  List<SessionExerciseModel>? exercises;

  SessionModel(
      {required this.id,
      this.name,
      this.instructions,
      this.userId,
      this.userAvatarUrl,
      this.firstName,
      this.lastName,
      this.isMine,
      this.isArchived,
      this.exercises});

  factory SessionModel.fromJson(Map<String, dynamic> json) => _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}

@JsonSerializable()
class SessionExerciseModel {
  String? title;
  String? imageUrl;
  String? youtubeLink;
  int? orderNumber;
  int? restIntervalSec;
  int? round;
  String? groupId;
  int? repMax;
  List<SessionExerciseSetModel>? sets;

  SessionExerciseModel(
      {this.title,
      this.imageUrl,
      this.youtubeLink,
      this.orderNumber,
      this.restIntervalSec,
      this.repMax,
      this.round,
      this.groupId,
      this.sets});

  factory SessionExerciseModel.fromJson(Map<String, dynamic> json) {
    return _$SessionExerciseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SessionExerciseModelToJson(this);
}

@JsonSerializable()
class SessionExerciseSetModel {
  int? orderNumber;
  int? repeats;
  int? weight;
  String? id;

  SessionExerciseSetModel({
    this.orderNumber,
    this.repeats,
    this.weight,
    this.id,
  });

  factory SessionExerciseSetModel.fromJson(Map<String, dynamic> json) =>
      _$SessionExerciseSetModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionExerciseSetModelToJson(this);
}
