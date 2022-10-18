import 'package:json_annotation/json_annotation.dart';
import 'package:users_creators/src/features/create_session/entity/domain/create_session.dart';

part 'get_session_by_id.g.dart';

@JsonSerializable()
class GetSessionById {
  GetSessionById({
    this.id,
    this.name,
    this.instructions,
    this.restIntervalSec,
    this.userId,
    this.userAvatarUrl,
    this.firstName,
    this.lastName,
    this.isMine,
    this.isArchived,
    this.isExecuted,
    this.intensity,
    this.trainingDurationSec,
    this.duration,
    this.trainingLevel,
    this.exercises,
  });

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
  bool? isExecuted;
  int? intensity;
  int? trainingDurationSec;
  int? duration;
  int? trainingLevel;
  List<Exercise>? exercises;

  factory GetSessionById.fromJson(Map<String, dynamic> json) =>
      _$GetSessionByIdFromJson(json);

  Map<String, dynamic> toJson() => _$GetSessionByIdToJson(this);
}
