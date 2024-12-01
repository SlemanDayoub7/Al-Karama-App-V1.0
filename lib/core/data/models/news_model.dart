class NewsModel {
  String? uuid;
  String? title;
  String? content;
  String? image;
  String? type;
  String? date;
  List<Statistics>? statistics;
  Club1? club1;
  Club1? club2;
  List<Videos>? videos;

  NewsModel(
      {this.uuid,
      this.title,
      this.content,
      this.image,
      this.type,
      this.date,
      this.statistics,
      this.club1,
      this.club2,
      this.videos});

  NewsModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    type = json['type'];
    date = json['date'];
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(new Statistics.fromJson(v));
      });
    }
    club1 = json['club1'] != null ? new Club1.fromJson(json['club1']) : null;
    club2 = json['club2'] != null ? new Club1.fromJson(json['club2']) : null;
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['type'] = this.type;
    data['date'] = this.date;
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.map((v) => v.toJson()).toList();
    }
    if (this.club1 != null) {
      data['club1'] = this.club1!.toJson();
    }
    if (this.club2 != null) {
      data['club2'] = this.club2!.toJson();
    }
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Statistics {
  String? name;
  Value? value;

  Statistics({this.name, this.value});

  Statistics.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  String? team1;
  String? team2;

  Value({this.team1, this.team2});

  Value.fromJson(Map<String, dynamic> json) {
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

class Club1 {
  String? uuid;
  String? name;
  String? logo;

  Club1({this.uuid, this.name, this.logo});

  Club1.fromJson(Map<String, dynamic> json) {
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

class Videos {
  String? uuid;
  String? url;
  String? description;

  Videos({this.uuid, this.url, this.description});

  Videos.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    url = json['url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['url'] = this.url;
    data['description'] = this.description;
    return data;
  }
}
