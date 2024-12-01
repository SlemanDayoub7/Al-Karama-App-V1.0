class MuseumModel {
  List<AboutClub>? aboutClub;
  List<Strategies>? strategies;
  List<Bosses>? bosses;
  List<Primes>? primes;
  List<BestGoals>? bestGoals;

  MuseumModel(
      {this.aboutClub,
      this.strategies,
      this.bosses,
      this.primes,
      this.bestGoals});

  MuseumModel.fromJson(Map<String, dynamic> json) {
    if (json['about_club'] != null) {
      aboutClub = <AboutClub>[];
      json['about_club'].forEach((v) {
        aboutClub!.add(new AboutClub.fromJson(v));
      });
    }

    if (json['bosses'] != null) {
      bosses = <Bosses>[];
      json['bosses'].forEach((v) {
        bosses!.add(new Bosses.fromJson(v));
      });
    }
    if (json['primes'] != null) {
      primes = <Primes>[];
      json['primes'].forEach((v) {
        primes!.add(new Primes.fromJson(v));
      });
    }
    if (json['best_goals'] != null) {
      bestGoals = <BestGoals>[];
      json['best_goals'].forEach((v) {
        bestGoals!.add(new BestGoals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aboutClub != null) {
      data['about_club'] = this.aboutClub!.map((v) => v.toJson()).toList();
    }
    if (this.strategies != null) {
      data['strategies'] = this.strategies!.map((v) => v.toJson()).toList();
    }
    if (this.bosses != null) {
      data['bosses'] = this.bosses!.map((v) => v.toJson()).toList();
    }
    if (this.primes != null) {
      data['primes'] = this.primes!.map((v) => v.toJson()).toList();
    }
    if (this.bestGoals != null) {
      data['best_goals'] = this.bestGoals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Strategies {
  String? uuid;
  String? title;
  String? content;
  String? image;
  String? type;
  String? date;
  List<Null>? statistics;
  List<Null>? videos;

  Strategies(
      {this.uuid,
      this.title,
      this.content,
      this.image,
      this.type,
      this.date,
      this.statistics,
      this.videos});

  Strategies.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['type'] = this.type;
    data['date'] = this.date;

    return data;
  }
}

class AboutClub {
  String? uuid;
  String? title;
  String? content;
  String? image;
  String? type;
  String? date;
  List<Null>? statistics;
  List<Null>? videos;

  AboutClub(
      {this.uuid,
      this.title,
      this.content,
      this.image,
      this.type,
      this.date,
      this.statistics,
      this.videos});

  AboutClub.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['type'] = this.type;
    data['date'] = this.date;

    return data;
  }
}

class Bosses {
  String? uuid;
  String? name;
  String? startYear;
  String? image;

  Bosses({this.uuid, this.name, this.startYear, this.image});

  Bosses.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    startYear = json['start_year'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['start_year'] = this.startYear;
    data['image'] = this.image;
    return data;
  }
}

class Primes {
  String? uuid;
  String? name;
  String? description;
  String? image;
  String? type;
  String? seasone;
  String? sport;

  Primes(
      {this.uuid,
      this.name,
      this.description,
      this.image,
      this.type,
      this.seasone,
      this.sport});

  Primes.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    type = json['type'];
    seasone = json['seasone'];
    sport = json['sport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['type'] = this.type;
    data['seasone'] = this.seasone;
    data['sport'] = this.sport;
    return data;
  }
}

class BestGoals {
  String? uuid;
  String? url;
  String? description;

  BestGoals({this.uuid, this.url, this.description});

  BestGoals.fromJson(Map<String, dynamic> json) {
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
