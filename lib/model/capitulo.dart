class Capitulo {
  int? chapter;
  List<Verses>? verses;

  Capitulo({this.chapter, this.verses});

  Capitulo.fromJson(Map<String, dynamic> json) {
    chapter = json['chapter'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(new Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapter'] = this.chapter;
    if (this.verses != null) {
      data['verses'] = this.verses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Verses {
  String? text;
  int? verse;

  Verses({this.text, this.verse});

  Verses.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    verse = json['verse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['verse'] = this.verse;
    return data;
  }
}


