class VersosSearch {
  String? book;
  int? chapter;
  int? id;
  String? text;
  int? verse;

  VersosSearch({this.book, this.chapter, this.id, this.text, this.verse});

  VersosSearch.fromJson(Map<String, dynamic> json) {
    book = json['book'];
    chapter = json['chapter'];
    id = json['id'];
    text = json['text'];
    verse = json['verse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book'] = this.book;
    data['chapter'] = this.chapter;
    data['id'] = this.id;
    data['text'] = this.text;
    data['verse'] = this.verse;
    return data;
  }
}