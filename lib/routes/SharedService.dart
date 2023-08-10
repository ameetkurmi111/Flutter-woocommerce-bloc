import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:cocoliebe/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:cocoliebe/models/login_model.dart';
// import 'package:cocoliebe/routes/login.dart';

class Sharedservice {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("login_details") != null ? true : false;
  }

  static Future<LoginResponseModel> loginDetails() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("login_details") != null
        ? LoginResponseModel.fromJson(
            jsonDecode(prefs.getString("login_details")))
        : null;
  }

  static Future<void> setLoginDetails(
    LoginResponseModel loginResponse,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString(
      "login_details",
      loginResponse != null
          ? jsonEncode(
              loginResponse.toJson(),
            )
          : null,
    );
  }

  static Future<void> logout() async {
    await setLoginDetails(null);
  }

  static Future<void> Save(
    double totalprice,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble("price", totalprice);
  }

  static Future<double> Read() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble("price");
  }

  static Future<void> SaveData(List<String> customerdata) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList("data1", customerdata);
  }

  static Future<List<String>> ReadData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("data1");
  }

  static Future<List<String>> DeleteData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("data1");
  }
}
