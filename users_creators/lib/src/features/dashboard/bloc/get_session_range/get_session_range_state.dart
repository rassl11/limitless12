import 'package:users_creators/src/features/dashboard/entity/model/get_hours.dart';
import 'package:users_creators/src/features/dashboard/entity/model/get_reps.dart';
import 'package:users_creators/src/features/dashboard/entity/model/get_summary_model.dart';
import 'package:users_creators/src/features/dashboard/entity/model/get_volume.dart';

class GetSessionRangeState {

}

class GotSessionRangeState extends GetSessionRangeState {
  final GetSummaryModel getSummary;
  final GetVolume getVolume;
  final GetReps getReps;
  final String range;
  final GetHours getHours;

  GotSessionRangeState(
      {required this.range,
      required this.getSummary,
      required this.getHours,
      required this.getReps,
      required this.getVolume});
}

class LoadingGetSessionRangeState extends GetSessionRangeState {}

class NotGetSessionRangeState extends GetSessionRangeState {}

class ErrorGetSessionRangeState extends GetSessionRangeState {}
