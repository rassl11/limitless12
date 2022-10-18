class PersonalRecords {
  String set;
  String reps;
  String weight;
  String date;

  PersonalRecords(
      {required this.set,
      required this.reps,
      required this.weight,
      required this.date});
}

List<PersonalRecords> personalRecordsList = [
  PersonalRecords(set: '3', reps: '12', weight: '20', date: 'Mar 10,2022'),
  PersonalRecords(set: '3', reps: '12', weight: '20', date: 'Mar 8,2022')
];
