import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'date_session.g.dart';

@CopyWith()
@JsonSerializable()
class DateSession {
  String? date;
  int? mySessionsCount;
  int? creatorSessionsCount;

  DateSession({this.date, this.mySessionsCount, this.creatorSessionsCount});
  factory DateSession.fromJson(Map<String, dynamic> json) => _$DateSessionFromJson(json);
  Map<String, dynamic> toJson() => _$DateSessionToJson(this);
  }