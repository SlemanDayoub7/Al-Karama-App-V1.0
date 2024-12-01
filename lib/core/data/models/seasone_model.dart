class SeasoneModel {
  String? uuid;
  String? name;
  String? startDate;
  String? endDate;

  SeasoneModel({this.uuid, this.name, this.startDate, this.endDate});

  SeasoneModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
