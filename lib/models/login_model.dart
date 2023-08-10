import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  bool success;
  int statusCode;
  String code;
  String message;
  // Data data;
  String token;
  String id;
  String email;
  String nicename;
  String firstName;
  String lastName;
  String displayName;

  LoginResponseModel({
    this.success,
    this.statusCode,
    this.code,
    this.message,
    // this.data,
    this.token,
    this.id,
    this.email,
    this.nicename,
    this.firstName,
    this.lastName,
    this.displayName,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    // success = json["success"];
    // statusCode = json["statusCode"];
    // code = json["code"];
    // message = json["message"];

    // data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    token = json["token"];
     id = json["user_id"];
    email = json["user_email"];
    nicename = json["user_nicename"];
    // firstName = json["firstName"];
    displayName = json["user_display_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["success"] = this.success;
    data["statusCode"] = this.statusCode;
    data["code"] = this.code;
    data["message"] = this.message;

    // if (this.data != null) {
    //   data["data"] = this.data.toJson();
    // }

    data["token"] = this.token;
     data["user_id"] = this.id;
    data["user_email"] = this.email;
    data["user_nicename"] = this.nicename;
    // data["firstName"] = this.firstName;
    data["user_display_name"] = this.displayName;

    return data;
  }
}

// class Data {
//   Data({
//     this.token,
//     this.id,
//     this.email,
//     this.nicename,
//     this.firstName,
//     this.lastName,
//     this.displayName,
//   });

//   String token;
//   int id;
//   String email;
//   String nicename;
//   String firstName;
//   String lastName;
//   String displayName;

//   Data.fromJson(Map<String, dynamic> json) {
//     token = json["token"];
//     id = json["id"];
//     email = json["email"];
//     nicename = json["nicename"];
//     firstName = json["firstName"];
//     displayName = json["displayName"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["token"] = this.token;
//     data["id"] = this.id;
//     data["email"] = this.email;
//     data["nicename"] = this.nicename;
//     data["firstName"] = this.firstName;
//     data["displayName"] = this.displayName;

//     return data;
//   }
//}