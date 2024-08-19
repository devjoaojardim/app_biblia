class Books {
  String? abbrev;
  int? id;
  String? name;
  String? testament;

  Books({this.abbrev, this.id, this.name, this.testament});

  Books.fromJson(Map<String, dynamic> json) {
    abbrev = json['abbrev'];
    id = json['id'];
    name = json['name'];
    testament = json['testament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abbrev'] = this.abbrev;
    data['id'] = this.id;
    data['name'] = this.name;
    data['testament'] = this.testament;
    return data;
  }
}