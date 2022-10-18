class RestTimerModel{
  String minutes;
  String seconds;

  RestTimerModel({
    required this.minutes,
    required this.seconds
  });
}

List<RestTimerModel> restTimerModel = [
  RestTimerModel(
    minutes: '0',
    seconds: '30'
  ),
    RestTimerModel(
    minutes: '0',
    seconds: '45'
  ),
    RestTimerModel(
    minutes: '1',
    seconds: '00'
  ),
    RestTimerModel(
    minutes: '2',
    seconds: '00'
  ),
  RestTimerModel(
    minutes: '3',
    seconds: '00'
  ),
];