
import 'dart:convert';

CustomerModelLB customerModel2FromJson(String str) => CustomerModelLB.fromJson(json.decode(str));

String customerModel2toJson(CustomerModelLB data) => json.encode(data.toJson());


class CustomerModelLB {

  String email;
  String first_name;
  String password;
  String username;

  CustomerModelLB({
    this.email,
    this.first_name,
    this.password,
    this.username
  });

  factory CustomerModelLB.fromJson(Map<String, dynamic> json) => CustomerModelLB(
      email: json["email"],
      first_name: json["first_name"],
      password: json["password"],
      username: json["email"],
    );

  Map<String, dynamic> toJson() => {
    "email": email,
    "first_name": first_name,
    "password": password,
    "username": email,

  };
}
