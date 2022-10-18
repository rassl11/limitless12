class SetHistoryModel {
  String date;
  String status;

  SetHistoryModel({required this.date, required this.status});
}

List<SetHistoryModel> setHistoryList = [
  SetHistoryModel(date: 'Wednesday March 23,2022', status: 'Completed'),
  SetHistoryModel(date: 'Friday March 18,2022', status: 'Completed'),
];
