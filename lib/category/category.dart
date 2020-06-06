class Category {
  int id;
  String name;

  Category(this.id, this.name);

  Category.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['category_id'];
    this.name = jsonObject['category_name'];
  }
}
