 import 'package:json_annotation/json_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';

part 'settings.g.dart';
@CopyWith()
@JsonSerializable()
class Settings {
  int? distance;
  int? weight;
  int? startOfWeek;
  bool? isAudioMuted;
  int? subscriptionPrice;
  bool? isSubscribed;
  String? location;
  String? timeZone;

  Settings(
      {this.distance,
      this.weight,
      this.startOfWeek,
      this.isAudioMuted,
      this.subscriptionPrice,
      this.isSubscribed,
      this.location,
      this.timeZone});

      factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}