class ProductOption {
  String optionName;
  List<String> options;

  ProductOption(this.optionName, this.options);

  ProductOption.fromJson(Map<String, dynamic> jsonOptions) {
    options=[];
    for (var options in jsonOptions){
      optionsadd
    }
  }
}
