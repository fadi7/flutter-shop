class ProductUnit {
  int id;
  String unitName;
  String unitCode;

  ProductUnit(this.id, this.unitName, this.unitCode);

  ProductUnit.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['unit_id'];
    this.unitCode = jsonObject['unit_code'];
    this.unitName = jsonObject['unit_name'];
  }
}
