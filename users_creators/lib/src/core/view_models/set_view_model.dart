import 'package:json_annotation/json_annotation.dart';



class SetViewModel {
  int orderNumber;
  String repeats;
  int weight;
  double percentage;

  SetViewModel(
      {required this.orderNumber,
      required this.repeats,
      required this.weight,
      required this.percentage});

}
