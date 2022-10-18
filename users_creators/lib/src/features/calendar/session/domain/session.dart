import 'package:users_creators/src/features/calendar/session/domain/exercise.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@CopyWith()
@JsonSerializable()
class Session {
  String? name;
  String? id;
  String? instructions;
  int? restIntervalSec;
  String? userId;
  String? userAvatarUrl;
  String? firstName;
  String? lastName;
  bool? isMine;
  bool? isExecuted;
  int? intensity;
  int? trainingDurationSec;
  bool? isArchived;
  List<Exercise>? exercises;

  Session(
      {this.name,
      this.id,
      this.instructions,
      this.restIntervalSec,
      this.userId,
      this.firstName,
      this.lastName,
      this.isMine,
      this.userAvatarUrl,
      this.isArchived,
      this.intensity,
      this.isExecuted,
      this.exercises});

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
