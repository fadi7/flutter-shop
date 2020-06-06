import 'dart:convert';

import 'package:generalshop/api/api_util.dart';

import '../product/product.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  Future<List<Product>> fetchProducts(int page) async {
    Map<String, String> headers = {'accept': 'application/json'};
    String url = ApiUtil.PRODUCTS + '/?page=' + page.toString();
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];
      List<Product> products = [];
      for (Map<String, dynamic> product in data) {
        products.add(Product.fromJson(product));
      }
      return products;
    }
    return null;
  }
}
