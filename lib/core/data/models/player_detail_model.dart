class PlayerDetailModel {
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

  PlayerDetailModel(
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

  PlayerDetailModel.fromJson(Map<String, dynamic> json) {
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