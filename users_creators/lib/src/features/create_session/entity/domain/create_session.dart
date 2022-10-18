class CreateEditSession {
  String name = '';
  String? id;
  String instructions = '';
  List<Exercise> exercises = [];

  CreateEditSession(
      {this.id,
      required this.name,
      required this.instructions,
      required this.exercises});

  CreateEditSession.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    instructions = json['instructions'];
    if (json['exercises'] != null) {
      exercises = <Exercise>[];
      json['exercises'].forEach((v) {
        exercises.add(Exercise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['instructions'] = instructions;
    data['exercises'] = exercises.map((v) => v.toJson()).toList();
    return data;
  }
}

class Exercise {
  String? id;
  String groupId = '';
  int round = 0;
  int repMax = 0;
  int restIntervalSec = 0;
  String youtubeLink = '';
  String? imageUrl;
  String exerciseDescription = '';
  List<Set> sets = [];

  Exercise({
    required this.id,
    required this.groupId,
    required this.sets,
    required this.round,
    required this.repMax,
    required this.youtubeLink,
    required this.imageUrl,
    required this.exerciseDescription,
    required this.restIntervalSec,
  });

  Exercise.fromJson(Map<String, dynamic> json) {
    round = json['round'] ?? 0;
    restIntervalSec = json['restIntervalSec'] ?? 0;
    id = json['id'];
    groupId = json['groupId'] ?? '';
    repMax = json['repMax'] ?? 0;
    youtubeLink = json['youtubeLink'] ?? '';
    exerciseDescription = json['exerciseDescription'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    if (json['sets'] != null) {
      sets = <Set>[];
      json['sets'].forEach((v) {
        sets.add(Set.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['round'] = round;
    data['id'] = id;
    data['groupId'] = groupId;
    data['repMax'] = repMax;
    data['youtubeLink'] = youtubeLink;
    data['imageUrl'] = imageUrl;
    data['exerciseDescription'] = exerciseDescription;
    data['restIntervalSec'] = restIntervalSec;
    data['sets'] = sets.map((v) => v.toJson()).toList();
    return data;
  }
}

class Set {
  String repeats = '0';
  int weight = 0;
  int orderNumber = 0;
  double percent = 0;
  String? minutes;
  String? seconds;
  bool? amrap;

  Set(
      {required this.repeats,
      required this.weight,
      required this.percent,
      required this.amrap,
      required this.minutes,
      required this.seconds});

  Set.fromJson(Map<String, dynamic> json) {
    seconds = json['seconds'] ?? '0';
    minutes = json['minutes'] ?? '0';
    amrap = json['amrap'] ?? false;
    repeats = json['repeats'] != null ? json['repeats'].toString() : '0';
    weight = json['weight'] ?? 0;
    percent = json['percent'] ?? 0.0;
    orderNumber = json['orderNumber'] >> 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seconds'] = seconds;
    data['minutes'] = minutes;
    data['amrap'] = amrap;
    data['repeats'] = repeats;
    data['weight'] = weight;
    data['percent'] = percent;
    data['orderNumber'] = orderNumber;
    return data;
  }
}
