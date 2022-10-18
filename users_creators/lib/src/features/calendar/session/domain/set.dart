// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set.g.dart';

@CopyWith()
@JsonSerializable()
class Set {
  int? orderNumber;
  String? repeats;
  String? minutes;
  String? seconds;
  int? weight;

  Set({this.orderNumber, this.repeats, this.minutes, this.seconds, this.weight});

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);
  Map<String, dynamic> toJson() => _$SetToJson(this);
}
