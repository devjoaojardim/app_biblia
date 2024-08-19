class Book {
  Abbrev? abbrev;
  String? author;
  int? chapters;
  String? comment;
  String? group;
  String? name;
  String? testament;

  Book(
      {this.abbrev,
        this.author,
        this.chapters,
        this.comment,
        this.group,
        this.name,
        this.testament});

  Book.fromJson(Map<String, dynamic> json) {
    abbrev =
    json['abbrev'] != null ? new Abbrev.fromJson(json['abbrev']) : null;
    author = json['author'];
    chapters = json['chapters'];
    comment = json['comment'];
    group = json['group'];
    name = json['name'];
    testament = json['testament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abbrev != null) {
      data['abbrev'] = this.abbrev!.toJson();
    }
    data['author'] = this.author;
    data['chapters'] = this.chapters;
    data['comment'] = this.comment;
    data['group'] = this.group;
    data['name'] = this.name;
    data['testament'] = this.testament;
    return data;
  }
}

class Abbrev {
  String? pt;
  String? en;

  Abbrev({this.pt, this.en});

  Abbrev.fromJson(Map<String, dynamic> json) {
    pt = json['pt'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pt'] = this.pt;
    data['en'] = this.en;
    return data;
  }
}