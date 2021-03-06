class Country {
  String name = '';
  String code = '';
  bool? isVisited = false;

  Country({required this.name, required this.code, required this.isVisited});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
