class MatchModel {
  List<Football>? football;

  MatchModel({this.football});

  MatchModel.fromJson(Map<String, dynamic> json) {
    if (json['football'] != null) {
      football = <Football>[];
      json['football'].forEach((v) {
        football!.add(new Football.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.football != null) {
      data['football'] = this.football!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Football {
  String? uuid;
  String? date;
  String? time;
  String? plan;
  String? channel;
  String? round;
  String? playGround;
  Team1? team1;
  Team1? team2;
  Result? result;
  Null? player;

  Football(
      {this.uuid,
      this.date,
      this.time,
      this.plan,
      this.channel,
      this.round,
      this.playGround,
      this.team1,
      this.team2,
      this.result,
      this.player});

  Football.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    date = json['date'];
    time = json['time'];
    plan = json['plan'];
    channel = json['channel'];
    round = json['round'];
    playGround = json['play_ground'];
    team1 = json['team1'] != null ? new Team1.fromJson(json['team1']) : null;
    team2 = json['team2'] != null ? new Team1.fromJson(json['team2']) : null;
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    player = json['player'];
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
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['player'] = this.player;
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

class Result {
  String? team1;
  String? team2;

  Result({this.team1, this.team2});

  Result.fromJson(Map<String, dynamic> json) {
    team1 = json['team1'];
    team2 = json['team2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team1'] = this.team1;
    data['team2'] = this.team2;
    return data;
  }
}
