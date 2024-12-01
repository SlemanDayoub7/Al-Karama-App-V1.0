class NextMatchModel {
  String? uuid;
  String? date;
  String? time;
  String? plan;
  String? channel;
  String? round;
  String? playGround;
  Team1? team1;
  Team1? team2;
  Player? player;

  NextMatchModel(
      {this.uuid,
      this.date,
      this.time,
      this.plan,
      this.channel,
      this.round,
      this.playGround,
      this.team1,
      this.team2,
      this.player});

  NextMatchModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    date = json['date'];
    time = json['time'];
    plan = json['plan'];
    channel = json['channel'];
    round = json['round'];
    playGround = json['play_ground'];
    team1 = json['team1'] != null ? new Team1.fromJson(json['team1']) : null;
    team2 = json['team2'] != null ? new Team1.fromJson(json['team2']) : null;
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['date'] = this.date;
    data['time'] = this.time;
    data['plan'] = this.plan;
    data['channel'] = this.channel;
    data['round'] = this.round;
    data['play_ground'] = this.playGround;
    if (this.team1 != null) {
      data['team1'] = this.team1!.toJson();
    }
    if (this.team2 != null) {
      data['team2'] = this.team2!.toJson();
    }
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}

class Team1 {
  String? uuid;
  String? name;
  String? logo;

  Team1({this.uuid, this.name, this.logo});

  Team1.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class Player {
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

  Player(
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

  Player.fromJson(Map<String, dynamic> json) {
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
