class MockData{
  DateTime getDateTime() => DateTime.now();
  int getMonthDays() => DateTime(getDateTime().year, getDateTime().month + 1, 0).day;
  static const sessions = <int>[1,1,2,1,3,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,1,2,3,1,2,3,1,2,1,2,1,2];
}