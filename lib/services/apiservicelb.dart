import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cocoliebe/services/configlb.dart';
import 'package:cocoliebe/models/customerlb.dart';
// import 'package:cocoliebe/services/configlb.dart';

Future<bool> createCustomer2(
    String email, String password, String first_name, String last_name) async {
  bool ischeck = false;

  final http.Response response = await http.post(ConfigLB.url2, body: {
    "email": email,
    "first_name": first_name,
    "last_name": last_name,
    "password": password,
    "username": email,
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;
    customerModel2FromJson(responseString);
    ischeck = true;
    return ischeck;
  } else {
    ischeck = false;
    return ischeck;
  }
}
