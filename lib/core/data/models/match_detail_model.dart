class MatchDetailModel {
  List<Beanched>? beanched;
  List<Replacments>? replacments;

  MatchDetailModel({this.beanched, this.replacments});

  MatchDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['beanched'] != null) {
      beanched = <Beanched>[];
      json['beanched'].forEach((v) {
        beanched!.add(new Beanched.fromJson(v));
      });
    }
    if (json['replacments'] != null) {
      replacments = <Replacments>[];
      json['replacments'].forEach((v) {
        replacments!.add(new Replacments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.beanched != null) {
      data['beanched'] = this.beanched!.map((v) => v.toJson()).toList();
    }
    if (this.replacments != null) {
      data['replacments'] = this.replacments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Beanched {
  String? uuid;
  String? name;
  String? image;

  Beanched({this.uuid, this.name, this.image});

  Beanched.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Replacments {
  String? uuid;
  Inplayer? inplayer;
  Inplayer? outplayer;

  Replacments({this.uuid, this.inplayer, this.outplayer});

  Replacments.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    inplayer = json['inplayer'] != null
        ? new Inplayer.fromJson(json['inplayer'])
        : null;
    outplayer = json['outplayer'] != null
        ? new Inplayer.fromJson(json['outplayer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    if (this.inplayer != null) {
      data['inplayer'] = this.inplayer!.toJson();
    }
    if (this.outplayer != null) {
      data['outplayer'] = this.outplayer!.toJson();
    }
    return data;
  }
}

class Inplayer {
  String? uuid;
  String? name;
  String? high;
  String? play;
  String? number;
  String? born;
  String? from;
  String? firstClub;
  String? career;
  String? image;

  Inplayer(
      {this.uuid,
      this.name,
      this.high,
      this.play,
      this.number,
      this.born,
      this.from,
      this.firstClub,
      this.career,
      this.image});

  Inplayer.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    high = json['high'];
    play = json['play'];
    number = json['number'];
    born = json['born'];
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
    data['from'] = this.from;
    data['first_club'] = this.firstClub;
    data['career'] = this.career;
    data['image'] = this.image;
    return data;
  }
}
