import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http_auth/http_auth.dart';

class PaypalServices {
  //for testing
  String domain = "https://api.sandbox.paypal.com";
  // for sandbox mode

  // String domain = "https://api.paypal.com"; // for production mode

  // for testing
  String clientId =
      'AenhAGbidtWQITyKfKY0epVN1g6Q1L7IYBunCS2lVbaM-sPIScjsVp9GvbIrfiEhCYR6osP10XIMHSrE';
  String secret =
      'EEAKVuSYOsR8MLCm0A_Y_u3dmBo0dFqjNyzXBnLQXgBnrZSpzzSFeysmU9jWPjcziOE77aZ-wEkOFJ5v';

//for real
  // String clientId =
  //     'AftVSZMPUh0i1ob6rHpq6ny2EFIjf0sfZ54TfBr0IfNrvnbHntsFpYYHGqY1BdZuARAgKh33BSoysLs0';
  // String secret =
  //     'EPgwci2W7_gRI3Y7lmu09Lbz39gqhkAHYLPhPuY07gO7xaYzQlDiFxmgcG_06en4WNGR6pzlRiW93naC';

  // for getting the access token from Paypal
  Future<String> getAccessToken() async {
    try {
      var client = BasicAuthClient(clientId, secret);
      var response = await client
          .post('$domain/v1/oauth2/token?grant_type=client_credentials');
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        return body["access_token"];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // for creating the payment request with Paypal
  Future<Map<String, String>> createPaypalPayment(
      transactions, accessToken) async {
    try {
      var response = await http.post("$domain/v1/payments/payment",
          body: convert.jsonEncode(transactions),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];

          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }
        return null;
      } else {
        throw Exception(body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  // for executing the payment transaction
  Future<String> executePayment(url, payerId, accessToken) async {
    try {
      var response = await http.post(url,
          body: convert.jsonEncode({"payer_id": payerId}),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body["id"];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}



// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert' as convert;
// import 'package:http_auth/http_auth.dart';

// class PaypalServices {
//   // String domain = "https://api.sandbox.paypal.com";
//   // for sandbox mode
//   String domain = "https://api.sandbox.paypal.com"; // for production mode

//   //for real
//   String clientId =
//       'AfIAIGD6cCdvDrGqHFfVh6PvLfwXct3OYnPjcLQ2OXmq8KeCsJMJ4gsmwDnkntR5Ez9IUlGelaj06JKo';
//   String secret =
//       'EHp1ExiQUOv1GYYPLLFOzHaiGJD88d4mDHCX8mJ7LY5TkzlVZ4h6qLaXuRXmAkT749aRrndJ6YxwKX_F';

// //for testing
// //   String clientId = 'AfGETWgdLzWmcHbO5501_UypPwddfeeIha1U4boBkg3_HdmVtWFtk3Iu2vlJ-kbi5IifRiNyLXHhT-3y';
// // String secret = 'EDepGOhaeNIZc45fOcuXIF7Ki6CWh8rYDIX6BgpKXpE1aONIU5zaeL-rgTvSM0CyxWGE_h7qCk41U-QO';

//   // for getting the access token from Paypal
//   Future<String> getAccessToken() async {
//     try {
//       var client = BasicAuthClient(clientId, secret);
//       var response = await client
//           .post('$domain/v1/oauth2/token?grant_type=client_credentials');
//       if (response.statusCode == 200) {
//         final body = convert.jsonDecode(response.body);
//         return body["access_token"];
//       }
//       return null;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // for creating the payment request with Paypal
//   Future<Map<String, String>> createPaypalPayment(
//       transactions, accessToken) async {
//     try {
//       var response = await http.post("$domain/v1/payments/payment",
//           body: convert.jsonEncode(transactions),
//           headers: {
//             "content-type": "application/json",
//             'Authorization': 'Bearer ' + accessToken
//           });

//       final body = convert.jsonDecode(response.body);
//       if (response.statusCode == 201) {
//         if (body["links"] != null && body["links"].length > 0) {
//           List links = body["links"];

//           String executeUrl = "";
//           String approvalUrl = "";
//           final item = links.firstWhere((o) => o["rel"] == "approval_url",
//               orElse: () => null);
//           if (item != null) {
//             approvalUrl = item["href"];
//           }
//           final item1 = links.firstWhere((o) => o["rel"] == "execute",
//               orElse: () => null);
//           if (item1 != null) {
//             executeUrl = item1["href"];
//           }
//           return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
//         }
//         return null;
//       } else {
//         throw Exception(body["message"]);
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // for executing the payment transaction
//   Future<String> executePayment(url, payerId, accessToken) async {
//     try {
//       var response = await http.post(url,
//           body: convert.jsonEncode({"payer_id": payerId}),
//           headers: {
//             "content-type": "application/json",
//             'Authorization': 'Bearer ' + accessToken
//           });

//       final body = convert.jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         return body["id"];
//       }
//       return null;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
