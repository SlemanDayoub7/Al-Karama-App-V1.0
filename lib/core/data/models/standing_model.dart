class StandingModel {
  List<Football>? football;

  StandingModel({this.football});

  StandingModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? win;
  String? lose;
  String? draw;
  String? points;
  String? play;

  Football(
      {this.uuid,
      this.name,
      this.win,
      this.lose,
      this.draw,
      this.points,
      this.play});

  Football.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    win = json['win'];
    lose = json['lose'];
    draw = json['draw'];
    points = json['points'];
    play = json['play'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['win'] = this.win;
    data['lose'] = this.lose;
    data['draw'] = this.draw;
    data['points'] = this.points;
    data['play'] = this.play;
    return data;
  }
}
