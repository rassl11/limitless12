class GetVolume {
  int? sum;
  int? highest;
  int? last;
  List<WeightsData>? weightsData;

  GetVolume({this.sum, this.highest, this.last, this.weightsData});

  GetVolume.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
    highest = json['highest'];
    last = json['last'];
    if (json['weightsData'] != null) {
      weightsData = <WeightsData>[];
      json['weightsData'].forEach((v) {
        weightsData!.add(WeightsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sum'] = sum;
    data['highest'] = highest;
    data['last'] = last;
    if (weightsData != null) {
      data['weightsData'] = weightsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeightsData {
  String? date;
  int? weight;

  WeightsData({this.date, this.weight});

  WeightsData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['weight'] = weight;
    return data;
  }
}
