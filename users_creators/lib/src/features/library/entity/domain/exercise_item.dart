import 'package:json_annotation/json_annotation.dart';
part 'exercise_item.g.dart';

@JsonSerializable()
class ExerciseItem {
  String? id;
  String? name;

  ExerciseItem({this.id, this.name});
   factory ExerciseItem.fromJson(Map<String, dynamic> json) =>
      _$ExerciseItemFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseItemToJson(this);
}