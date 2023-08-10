// import 'dart:io';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cocoliebe/models/login_model.dart';
import 'package:cocoliebe/models/orderModel.dart';
import 'package:cocoliebe/routes/confpayment.dart';
import 'package:cocoliebe/routes/maindrawerlb.dart';
// import 'package:chelany/config.dart';
import 'dart:convert';
// import 'package:flushbar/flushbar.dart';
import 'package:cocoliebe/services/config.dart';

// import 'package:chelany/routes/menu_description.dart';
// import './config.dart';
// import 'package:dio/dio.dart';
// import 'package:chelany/models/category.dart';
//Map categoryNameAndParent={};
List product = [];
Map category = {};
//List category = [];
List productItems = [];
List categorydescription = [];
List parents = [];
Future<List> fetchWpPosts(BuildContext context) async {
  product.clear();
  productItems.clear();
  var convertDatatoJson;
  var response;
  int limit = 3;
  var countBlank = 0;

//   final response = await http.get('https://aashish-liefer.de/wp-json/wc/v3/products/?per_page=100&consumer_key=ck_3b026cc7bda15b2e796a01215e3da509f402a9c9&consumer_secret=cs_b10c38760cef2e47d7e9db3dbe22f1ebe653df21');
//  convertDatatoJson = jsonDecode(response.body);
  try {
    for (int i = 1; i < limit; i++) {
      response = await http.get(
          'https://cocoliebe.com/wp-json/wc/v3/products/?per_page=100&page=$i&orderby=date&consumer_key=ck_bd2cae037b7712979971069d6d8c6cc1d39cf627&consumer_secret=cs_59911e6daedbef45153c88712b209beab10f9ba9');

      if (response.body == "[]" && response.statusCode == 200) {
        countBlank += 1;
        if (countBlank == 2) {
          break;
        }
      }
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        print("---------> $i page <-------");
        decode = decode.reversed.toList();
        // print("${decode.map(e)=>}");
        product.add(decode);
        // if (i == 5) {
        //   for (var k = 0; k < decode.length; k++) {
        //     {
        //       if (decode[k]["name"] == "302. Mojito") {
        //         print(
        //             "Its in page $i hereee!!!!! ${decode[k]["name"]}"); //its in page 5 302. Mojito
        //       }
        //     }
        //   }

        // if (k["id"] == 1901) {
        //   print("Its heree!!!!!");
        // }

        // }
      }
      limit += 1;
    }
    for (var p = 0; p < product.length - 1; p++) {
      for (var o = 0; o < product[p].length; o++) {
        productItems.add(product[p][o]);
      }
    }

//  var pd;

//   pd = json.decode(response.body);
//    for(int a=0;a<pd.length;a++){

//    productItems.add(pd[a]);

//   }
// if (response.statusCode == 200) {
// }

// var jd;
// jd=json.decode(response.body);

// for(int i=0;i<jd.length;i++){
//   // print(jd[i]["name"]);
//   // print(jd[i]["categories"][0]["name"]);
//   if(jd[i]["categories"][0]["name"] == "Chicken dishes"){
//    product.add(jd[i]["name"]);
//    print("Soup Category:----- ${jd[i]["name"]}");
//   //  print("solution ${jd[i]["price"]}");
//  }

//  else if (jd[i]["categories"][0]["name"] == "Soup"){
//    product.add(jd[i]["name"]);
//    print("Soup Category:----- ${jd[i]["name"]}");
//   //  print("solution ${jd[i]["price"]}");
//  }

//  category.add(jd[i]["categories"]);

// print(product);
// product.clear();
// }
    convertDatatoJson = jsonDecode(response.body);

    // print(product.toString());
    // product.clear();
    return convertDatatoJson;
// if ("")
  } catch (e) {
    print(e);
  }
//    on SocketException {

//     Future.delayed(const Duration(seconds: 3), () {
// // Here you can write your code
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => DisplayErrorMessage("Resturant page")),
//       );
//     });
//   }
}

Future<List> fetchWpCategoriesList() async {
  parents = [];
  category = {};
  categorydescription = [];

  try {
    final response = await http.get(
        'https://cocoliebe.com/wp-json/wc/v3/products/categories?per_page=100&consumer_key=ck_bd2cae037b7712979971069d6d8c6cc1d39cf627&consumer_secret=cs_59911e6daedbef45153c88712b209beab10f9ba9');
    var convertDatatoJson = jsonDecode(response.body);

    var dj;
    var cd;

    dj = json.decode(response.body);
    for (int i = 0; i < dj.length; i++) {
      // print(jd[i]["name"]);
      // print(jd[i]["categories"][0]["name"]);
      if (dj[i]["parent"] == 0) {
        parents.add(dj[i]["name"]);
      }

      //  if(dj[i]["name"]!="Getranke" && dj[i]["name"]!="Vorspeisekarte"  &&  dj[i]["name"]!="Speisekarte"){
      category[i] = {
        dj[i]["name"]: dj[i]["parent"],
      };
      //  }
      //  print("solution ${jd[i]["price"]}");
    }
    // print(parents.length);
    //parents.sort((a, b) => -a.toString().compareTo(b.toString()));
    // parents[2]="Getränke";   Haüptgerichte
    parents[0] = "COCOLIEBE SPECIALS";
    parents[1] = "VORSPEISEN";
    parents[2] = "SUSHI BURGER COMBO";
    parents[3] = "SUSHI BURGER";
    parents[4] = "PIZZA";
    parents[5] = "HAUPTGERICHTE";
    parents[6] = "BEILAGEN";
    parents[7] = "NACHTISCH";
    parents[8] = "ALKOHOLFREIE GETRÄNKE";
    parents[9] = "ALKOHOLISCHE GETRÄNKE";
    
    print("parents");
    parents.removeLast();
   

    // category.map((e) {
    //   if(e=="Kindergerichte"){
    //     int ind=category.indexOf("Kindergerichte");

    //   }
    // });

    // print(parents);

    cd = json.decode(response.body);
    for (int i = 0; i < cd.length; i++) {
      // print(jd[i]["name"]);
      // print(jd[i]["categories"][0]["name"]);

      categorydescription.add(cd[i]["short_description"]);

      //  print("solution ${jd[i]["price"]}");

    }
    // print(parents);
    // print(categorydescription);
    return convertDatatoJson;
  } on SocketException {
    print("socket exception");
    //   Flushbar(
    //   flushbarPosition: FlushbarPosition.TOP,
    //   title : "Hey Ninja",
    //   message :"Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    //   duration : Duration(seconds: 3),
    // );
  }
}

Future<LoginResponseModel> loginCustomer(
    String username, String password) async {
  LoginResponseModel model3;
  var result;
  try {
    var response = await http.post(
      Config.tokenURL,

      body: {
        "username": username,
        "password": password,
      },
    
    );

    if (response.statusCode == 200) {
      model3 = loginResponseModelFromJson(response.body);
      print("success");
      // print(jsonDecode(response.body));
    } else if (response.statusCode != 200) {
      print("error");
    }
  } on SocketException {
    print("socketexception e2");
    // print(e);
  }
  return model3;
}

Future<OrderModel> createOrder(
    lb,
    firstName,
    lastName,
    company,
    address,
    city,
    postCode,
    email,
    phone,
    note,
    createOrder,
    context,
    deliveryType,
    keyDate,
    deliveryDate,
    keyTime,
    deliveryTime,
    customerId,
    payPalID) async {
  Map store;
  List lineItems = [];
  var paymentMethod;
  var payMethodTitle;
  try {
    for (var i = 0; i < lb.length; i++) {
      store = {
        "product_id": lb[i].productId,
        "quantity": lb[i].itemIndexCount,
        "meta_data": [
          {
            "key": lb[i].choice == null ? "" : "BEILAGEN",
            "value": lb[i].choice == null ? "" : lb[i].choice.toString(),
          }
        ]
      };
      lineItems.add(store);
    }

    if (createOrder == 2) {
      paymentMethod = "cod";
      payMethodTitle = "Per Nachnahme";
    } else if (createOrder == 1) {
      paymentMethod = "paypal";
      payMethodTitle = "PayPal";
    }

    if (customerId == null) {
      customerId = 0;
    }

    if (payPalID == null) {
      payPalID = "Not paid through paypal";
    }

    final http.Response response = await http.post(
      'https://cocoliebe.com/wp-json/wc/v3/orders?per_page=100&consumer_key=ck_bd2cae037b7712979971069d6d8c6cc1d39cf627&consumer_secret=cs_59911e6daedbef45153c88712b209beab10f9ba9&status=processing',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'line_items': lineItems,
        'customer_id': customerId,
        'billing': {
          "first_name": firstName,
          "last_name": lastName,
          "company": company,
          "address_1": address,
          "city": city,
          "postcode": postCode.name,
          "email": email,
          "phone": phone
        },
        'shipping': {
          "first_name": firstName,
          "last_name": lastName,
          "company": company,
          "address_1": address,
          "city": city,
          "postcode": postCode.name,
          "email": email,
          "phone": phone
        },
        'customer_note': note,
        'payment_method': paymentMethod,
        'payment_method_title': payMethodTitle,
        'meta_data': [
          {'key': "delivery_type", 'value': deliveryType},
          {'key': keyDate, 'value': deliveryDate},
          {'key': keyTime, 'value': deliveryTime},
          {'key': "PaypalID", 'value': payPalID}
        ]
      }),
    );

    if (response.statusCode == 201) {
      //return OrderModel.fromJson(jsonDecode(response.body));
      //order conformed
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ConfPayment(true)),
          (Route<dynamic> route) => false);
    } else {
      //order not conformed
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConfPayment(false)),
      );
    }
  } on SocketException {
    print("socketexception e5");
  }
}

// Future<List<Category>> getCategories() async {
//   List<Category> data = new List<Category>();

//   try {
//     String url = Config.url +
//     Config.categoriesURL +
//     "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
//     var response = await Dio().get(
//       url,
//       options: new Options(
//         headers: {
//           HttpHeaders.contentTypeHeader: "application/json",
//         },
//       ),
//     );

//     if (response.statusCode == 200) {
//       data = (response.data as List)
//       .map((i) => Category.fromJson(i),).toList();
//     }
//   } on DioError catch (e) {
//     print(e.response);
//   }
//   return data;
// }

List<Ordermodel> ordermodel = [];

Future<List<Ordermodel>> getData(context) async {
  ordermodel.clear();
// print(customerid);
  var orderResponse;
  try {
    for (int i = 1; i < 6; i++) {
      orderResponse = await http.get(
          "https://cocoliebe.com/wp-json/wc/v3/orders?per_page=100&page=$i&consumer_key=ck_bd2cae037b7712979971069d6d8c6cc1d39cf627&consumer_secret=cs_59911e6daedbef45153c88712b209beab10f9ba9&customer=$customerID");
      if (orderResponse.statusCode != 400) {
        var decoded = jsonDecode(orderResponse.body);
        decoded
            .map((product) => ordermodel.add(Ordermodel.fromJson(product)))
            .toList();
        // this.orderModel = OrderModel.fromJson(decoded);
        print(ordermodel);
      } else {
        throw Exception('error');
      }
    }

    return ordermodel;
  } on SocketException {
    print("socket exceptin 4");
//       Future.delayed(const Duration(seconds: 3), () {
//           // Here you can write your code
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => DisplayErrorMessage("Order page")),
//           );
// });

  }
  // print(decoded);
  // return decoded;
}
