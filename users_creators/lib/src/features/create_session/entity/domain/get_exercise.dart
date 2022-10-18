class GetExerciseInfo {
  List<EquipmentUsed>? equipmentUsed;
  List<PrimaryMuscleGroup>? primaryMuscleGroup;
  List<OtherMuscleGroup>? otherMuscleGroup;
  List<TypeOfExercise>? typeOfExercise;

  GetExerciseInfo(
      {required this.equipmentUsed,
      required this.primaryMuscleGroup,
      required this.otherMuscleGroup,
      required this.typeOfExercise});

  factory GetExerciseInfo.fromJson(Map<String, dynamic> json) {
    return GetExerciseInfo(
      equipmentUsed: (json['equipmentUsed'] as List<dynamic>)
          .map((e) => EquipmentUsed.fromJson(e as Map<String, dynamic>))
          .toList(),
      otherMuscleGroup: (json['otherMuscleGroup'] as List<dynamic>)
          .map((e) => OtherMuscleGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeOfExercise: (json['typeOfExercise'] as List<dynamic>)
          .map((e) => TypeOfExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      primaryMuscleGroup: (json['primaryMuscleGroup'] as List<dynamic>)
          .map((e) => PrimaryMuscleGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class EquipmentUsed {
  String? id;
  String? name;
  EquipmentUsed({required this.id, required this.name});

  factory EquipmentUsed.fromJson(Map<String, dynamic> json) {
    return EquipmentUsed(id: json['id'], name: json['name']);
  }
}

class TypeOfExercise {
  String? id;
  String? name;
  String? notice;

  TypeOfExercise({required this.id, required this.name, required this.notice});

  factory TypeOfExercise.fromJson(Map<String, dynamic> json) {
    return TypeOfExercise(
      id: json['id'],
      name: json['name'],
      notice: json['notice'],
    );
  }
}

class PrimaryMuscleGroup {
  String? id;
  String? name;

  PrimaryMuscleGroup({
    required this.id,
    required this.name,
  });
  factory PrimaryMuscleGroup.fromJson(Map<String, dynamic> json) {
    return PrimaryMuscleGroup(
      id: json['id'],
      name: json['name'],
    );
  }
}

class OtherMuscleGroup {
  String? id;
  String? name;

  OtherMuscleGroup({
    required this.id,
    required this.name,
  });
  factory OtherMuscleGroup.fromJson(Map<String, dynamic> json) {
    return OtherMuscleGroup(
      id: json['id'],
      name: json['name'],
    );
  }
}
