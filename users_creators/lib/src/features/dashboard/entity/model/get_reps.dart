class GetReps {
  int? sum;
  int? highest;
  int? last;
  List<RepeatsDate>? repeatsDate;

  GetReps({this.sum, this.highest, this.last, this.repeatsDate});

  GetReps.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
    highest = json['highest'];
    last = json['last'];
    if (json['repeatsDate'] != null) {
      repeatsDate = <RepeatsDate>[];
      json['repeatsDate'].forEach((v) {
        repeatsDate!.add(RepeatsDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sum'] = sum;
    data['highest'] = highest;
    data['last'] = last;
    if (repeatsDate != null) {
      data['repeatsDate'] = repeatsDate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepeatsDate {
  String? date;
  int? repeats;

  RepeatsDate({this.date, this.repeats});

  RepeatsDate.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    repeats = json['repeats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['repeats'] = repeats;
    return data;
  }
}
