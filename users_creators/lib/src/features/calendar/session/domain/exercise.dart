// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:users_creators/src/features/calendar/session/domain/set.dart';

part 'exercise.g.dart';

@CopyWith()
@JsonSerializable()
class Exercise {
  String? title;
  String? imageUrl;
  int? orderNumber;
  int? restIntervalSec;
  String? groupId;
  List<Set>? sets;

  Exercise(
      {this.title, this.imageUrl, this.orderNumber, this.sets, this.groupId, this.restIntervalSec});

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
