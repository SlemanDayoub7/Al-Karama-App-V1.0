import 'dart:convert';

class EventsModel {
  String? firstTeam;
  String? secondTeam;
  String? time;
  String? date;
  String? location;
  String? live;
  String? title;
  String? imageUrl;

  EventsModel(
      {this.time,
      this.firstTeam,
      this.secondTeam,
      this.date,
      this.location,
      this.live,
      this.title,
      this.imageUrl});

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      firstTeam: json['firstTeam'],
      secondTeam: json['secondTeam'],
      time: json['time'],
      date: json['date'],
      location: json['location'],
      live: json['live'],
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstTeam': firstTeam,
      'secondTeam': secondTeam,
      'time': time,
      'date': date,
      'location': location,
      'live': live,
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}
