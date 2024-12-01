class StuffModel {
  Boss? boss;
  List<Attack>? attack;
  List<Attack>? middle;
  List<Attack>? defence;
  List<Attack>? goalKeepers;
  List<Managers>? managers;
  List<Managers>? coaches;
  Wears? wears;

  StuffModel(
      {this.boss,
      this.attack,
      this.middle,
      this.defence,
      this.goalKeepers,
      this.managers,
      this.coaches,
      this.wears});
  StuffModel.fromJson(Map<String, dynamic> json) {
    boss = json['boss'] != null ? new Boss.fromJson(json['boss']) : null;
    if (json['attack'] != null) {
      attack = <Attack>[];
      json['attack'].forEach((v) {
        attack!.add(new Attack.fromJson(v));
      });
    }

    wears = json['wears'] != null ? new Wears.fromJson(json['wears']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.boss != null) {
      data['boss'] = this.boss!.toJson();
    }
    if (this.attack != null) {
      data['attack'] = this.attack!.map((v) => v.toJson()).toList();
    }
    if (this.middle != null) {
      data['middle'] = this.middle!.map((v) => v.toJson()).toList();
    }
    if (this.defence != null) {
      data['defence'] = this.defence!.map((v) => v.toJson()).toList();
    }
    if (this.goalKeepers != null) {
      data['goal_keepers'] = this.goalKeepers!.map((v) => v.toJson()).toList();
    }
    if (this.managers != null) {
      data['managers'] = this.managers!.map((v) => v.toJson()).toList();
    }
    if (this.coaches != null) {
      data['coaches'] = this.coaches!.map((v) => v.toJson()).toList();
    }
    if (this.wears != null) {
      data['wears'] = this.wears!.toJson();
    }
    return data;
  }
}

class Boss {
  String? uuid;
  String? name;
  String? startYear;
  String? image;

  Boss({this.uuid, this.name, this.startYear, this.image});

  Boss.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    startYear = json['start_year'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['start_year'] = this.startYear;
    data['image'] = this.image;
    return data;
  }
}

class Attack {
  String? uuid;
  String? name;
  String? high;
  String? play;
  String? number;
  String? born;
  String? age;
  String? from;
  String? firstClub;
  String? career;
  String? image;

  Attack(
      {this.uuid,
      this.name,
      this.high,
      this.play,
      this.number,
      this.born,
      this.age,
      this.from,
      this.firstClub,
      this.career,
      this.image});

  Attack.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    high = json['high'];
    play = json['play'];
    number = json['number'];
    born = json['born'];
    age = json['age'];
    from = json['from'];
    firstClub = json['first_club'];
    career = json['career'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['high'] = this.high;
    data['play'] = this.play;
    data['number'] = this.number;
    data['born'] = this.born;
    data['age'] = this.age;
    data['from'] = this.from;
    data['first_club'] = this.firstClub;
    data['career'] = this.career;
    data['image'] = this.image;
    return data;
  }
}

class Managers {
  String? uuid;
  String? name;
  String? work;
  String? image;

  Managers({this.uuid, this.name, this.work, this.image});

  Managers.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    work = json['work'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['work'] = this.work;
    data['image'] = this.image;
    return data;
  }
}

class Wears {
  String? uuid;
  String? image;

  Wears({this.uuid, this.image});

  Wears.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['image'] = this.image;
    return data;
  }
}
