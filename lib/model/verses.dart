class versesFull {
  Book? book;
  Chapter? chapter;
  List<Verses>? verses;

  versesFull({this.book, this.chapter, this.verses});

  versesFull.fromJson(Map<String, dynamic> json) {
    book = json['book'] != null ? new Book.fromJson(json['book']) : null;
    chapter = json['chapter'] != null ? new Chapter.fromJson(json['chapter']) : null;
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) { verses!.add(new Verses.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.book != null) {
      data['book'] = this.book!.toJson();
    }
    if (this.chapter != null) {
      data['chapter'] = this.chapter!.toJson();
    }
    if (this.verses != null) {
      data['verses'] = this.verses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
  Abbrev? abbrev;
  String? name;
  String? author;
  String? group;
  String? version;

  Book({this.abbrev, this.name, this.author, this.group, this.version});

  Book.fromJson(Map<String, dynamic> json) {
    abbrev = json['abbrev'] != null ? new Abbrev.fromJson(json['abbrev']) : null;
    name = json['name'];
    author = json['author'];
    group = json['group'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abbrev != null) {
      data['abbrev'] = this.abbrev!.toJson();
    }
    data['name'] = this.name;
    data['author'] = this.author;
    data['group'] = this.group;
    data['version'] = this.version;
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

class Chapter {
  int? number;
  int? verses;

  Chapter({this.number, this.verses});

  Chapter.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    verses = json['verses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['verses'] = this.verses;
    return data;
  }
}

class Verses {
  int? number;
  String? text;

  Verses({this.number, this.text});

  Verses.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['text'] = this.text;
    return data;
  }
}