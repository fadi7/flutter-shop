class Tag {
  int id;
  String name;

  Tag(this.id, this.name);

  Tag.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['tag_id'];
    this.name = jsonObject['tag_name'];
  }
}
