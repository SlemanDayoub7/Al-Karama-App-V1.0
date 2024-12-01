class SportsModel {
  String? uuid;
  String? name;
  String? image;

  SportsModel({this.uuid, this.name, this.image});

  SportsModel.fromJson(Map<String, dynamic> json) {
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
