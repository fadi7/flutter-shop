import 'dart:convert';

import 'package:http/http.dart' as http;

import '../customer/user.dart';
import 'api_util.dart';

class Authentication {
  Future<User> register(
      String firstName, String lastName, String email, String password) async {
    Map<String, String> headers = {'accept': 'application/json'};
    Map<String, String> body = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    };
    http.Response response =
        await http.post(ApiUtil.AUTH_REGISTER, headers: headers, body: body);
    if (response.statusCode == 201) {
      var body = jsonDecode(response.body);
      Map<String, dynamic> data = body['data'];
      User user = User.fromJson(data);
      return user;
    }
    return null;
  }

  Future<User> login(String email, String password) async {
    Map<String, String> headers = {'accept': 'application/json'};
    Map<String, String> body = {
      'email': email,
      'password': password,
    };
    http.Response response =
        await http.post(ApiUtil.AUTH_LOGIN, headers: headers, body: body);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Map<String, dynamic> data = body['data'];
      print(data);
      User user = User.fromJson(data);
      return user;
    }
    return null;
  }
}
