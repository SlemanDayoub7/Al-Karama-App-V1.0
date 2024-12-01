class FansModel {
  String? uuid;
  String? boss;
  String? image;
  String? description;
  String? country;
  List<Members>? members;
  List<Videos>? videos;

  FansModel(
      {this.uuid,
      this.boss,
      this.image,
      this.description,
      this.country,
      this.members,
      this.videos});

  FansModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    boss = json['boss'];
    image = json['image'];
    description = json['description'];
    country = json['country'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
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
    data['boss'] = this.boss;
    data['image'] = this.image;
    data['description'] = this.description;
    data['country'] = this.country;
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  String? uuid;
  String? name;

  Members({this.uuid, this.name});

  Members.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
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
