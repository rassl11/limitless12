
import 'package:json_annotation/json_annotation.dart';
import 'package:users_creators/src/features/library/entity/domain/exercise_item.dart';
import 'package:users_creators/src/features/library/entity/domain/type_of_exercise.dart';
part 'new_exercise.g.dart';

@JsonSerializable()
class NewExercise {
  String? id;
  String? title;
  String? exerciseDescription;
  String? youtubeLink;
  String? videoUrl;
  String? tempo;
  String? notes;
  ExerciseItem? equipmentUsed;
  List<ExerciseItem>? primaryMuscleGroup;
  List<ExerciseItem>? otherMuscles;
  TypeOfExercise? typeOfExercise;

  NewExercise(
      {this.id,
      this.title,
      this.exerciseDescription,
      this.youtubeLink,
      this.videoUrl,
      this.tempo,
      this.notes,
      this.equipmentUsed,
      this.otherMuscles,
      this.primaryMuscleGroup,
      this.typeOfExercise
      });

   factory NewExercise.fromJson(Map<String, dynamic> json) =>
      _$NewExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$NewExerciseToJson(this);
}