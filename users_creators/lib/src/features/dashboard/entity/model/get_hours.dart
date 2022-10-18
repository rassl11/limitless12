class GetHours {
  int? sum;
  int? highest;
  int? last;
  List<HoursData>? hoursData;

  GetHours({this.sum, this.highest, this.last, this.hoursData});

  GetHours.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
    highest = json['highest'];
    last = json['last'];
    if (json['hoursData'] != null) {
      hoursData = <HoursData>[];
      json['hoursData'].forEach((v) {
        hoursData!.add(HoursData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sum'] = sum;
    data['highest'] = highest;
    data['last'] = last;
    if (hoursData != null) {
      data['hoursData'] = hoursData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HoursData {
  String? date;
  int? hours;

  HoursData({this.date, this.hours});

  HoursData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    hours = json['hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['hours'] = hours;
    return data;
  }
}
