class MyNote {
  int? id;
  String? title;
  String? subTitle;
  MyNote({this.id,this.title, this.subTitle});

  MyNote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['sub_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    return data;
  }
}
