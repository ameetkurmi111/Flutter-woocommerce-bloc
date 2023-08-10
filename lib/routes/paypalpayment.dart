import 'dart:core';
import 'package:flutter/material.dart';
import 'package:cocoliebe/api_service.dart';
import 'package:cocoliebe/models/tryModel.dart';
import 'package:cocoliebe/routes/confpayment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cocoliebe/services/paypal_service.dart';
import 'package:cocoliebe/services/shared_service.dart';

class PaypalPayment extends StatefulWidget {
  var totalamount;
  final Function onFinish;
  String userFirstName;
  String userLastName;
  String addressCity;
  String addressStreet;
  String addressZipCode;
  String addressPhoneNumber;

  String companyName;
  String emailAddress;
  String customerNote;
  int selectedRadio;
  String ordertype;
  String formatDate;
  String buttontext;
  int customerid;
  PaypalPayment(
      {this.onFinish,
      this.totalamount,
      this.userFirstName,
      this.userLastName,
      this.addressCity,
      this.addressStreet,
      this.addressZipCode,
      this.addressPhoneNumber,
      this.companyName,
      this.emailAddress,
      this.customerNote,
      this.selectedRadio,
      this.ordertype,
      this.formatDate,
      this.buttontext,
      this.customerid});

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState(
        this.totalamount,
        this.userFirstName,
        this.userLastName,
        this.addressCity,
        this.addressStreet,
        this.addressZipCode,
        this.addressPhoneNumber,
        this.companyName,
        this.emailAddress,
        this.customerNote,
        this.selectedRadio,
        this.ordertype,
        this.formatDate,
        this.buttontext,
        this.customerid);
  }
}

class PaypalPaymentState extends State<PaypalPayment> {
  var totalamount;
  String userFirstName;
  String userLastName;
  String addressCity;
  String addressStreet;
  String addressZipCode;
  String addressPhoneNumber;

  String companyName;
  String emailAddress;
  String customerNote;
  int selectedRadio;
  String ordertype;
  String formatDate;
  String buttontext;
  int customerid;
  PaypalPaymentState(
      this.totalamount,
      this.userFirstName,
      this.userLastName,
      this.addressCity,
      this.addressStreet,
      this.addressZipCode,
      this.addressPhoneNumber,
      this.companyName,
      this.emailAddress,
      this.customerNote,
      this.selectedRadio,
      this.ordertype,
      this.formatDate,
      this.buttontext,
      this.customerid);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String checkoutUrl;
  String executeUrl;
  String accessToken;
  PaypalServices services = PaypalServices();

  // you can change default currency according to your need
  Map<dynamic, dynamic> defaultCurrency = {
    "symbol": "EUR",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "EUR"
  };

  bool isEnableShipping = false;
  bool isEnableAddress = false;
  bool isLoading = false;
  String returnURL = 'return.example.com';
  String cancelURL = 'cancel.example.com';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      try {
        accessToken = await services.getAccessToken();

        final transactions = getOrderParams();
        final res =
            await services.createPaypalPayment(transactions, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"];
            executeUrl = res["executeUrl"];
          });
        }
      } catch (e) {
        print('exception: ' + e.toString());
        final snackBar = SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  // item name, price and quantity
  // String itemName = 'iPhone X';
  // String itemPrice = '1.99';
  // int quantity = 1;

  Map<String, dynamic> getOrderParams() {
    // List items = [
    //   {
    //     "name": itemName,
    //     "quantity": quantity,
    //     "price": itemPrice,
    //     "currency": defaultCurrency["currency"]
    //   }
    // ];

    List items = [];
    for (var i = 0; i < basketDataForSearch.length; i++) {
      items.add({
        "name": basketDataForSearch[i].productName,
        "quantity": basketDataForSearch[i].itemIndexCount,
        "price": basketDataForSearch[i].price /
            basketDataForSearch[i].itemIndexCount,
        "currency": defaultCurrency["currency"]
      });
    }

    //double totalAmount2;
    //String totalAmount = "1.99";

    //FutureBuilder<double>(
    //  future: SharedService.Read(),
    //(builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
    // switch (snapshot.connectionState) {
    //case ConnectionState.waiting:
    // return const CircularProgressIndicator();
    //default:
    //if (snapshot.hasError) {
    //return Text('Error: ${snapshot.error}');
    //} else {
    //totalAmount = snapshot.data.toString();
    //print(totalAmount);
    //}
    //}
    //});

    // from future<> to String

    // print(totalAmount);

    // String shippingCost = '0';
    // int shippingDiscountCost = 0;
    // String userFirstName = 'test';
    // String userLastName = 'test';
    // String addressCity = 'test';
    // String addressStreet = 'test';
    // String addressZipCode = '11111';
    // String addressCountry = 'Germany';
    // //String addressState = 'test';
    // String addressPhoneNumber = 'test';

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalamount,
            "currency": defaultCurrency["currency"],
            // "details": {
            //   "shipping": shippingCost,
            //   "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
            // }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            if (isEnableShipping && isEnableAddress)
              "shipping_address": {
                "recipient_name": userFirstName + " " + userLastName,
                "line1": addressStreet,
                "city": addressCity,
                "postal_code": addressZipCode,
                "phone": addressPhoneNumber,
              },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return temp;
  }
// Stack(
//               children: [
//                 WebView(
//                   initialUrl:
//                       "https://aashish-liefer.de/my-account/lost-password",
//                   javascriptMode: JavascriptMode.unrestricted,
//                   onPageFinished: (finish){

//                       setState(() {
//                         isLoading = false;
//                       });
//                   },
//                 ),
//                 isLoading ? LinearProgressIndicator(backgroundColor: Colors.orangeAccent,
//                 valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
//                // valueColor: ,
//                 )
//                     : Stack(),
//               ],
//             )
  bool isLoad = true;
  @override
  Widget build(BuildContext context) {
    print(checkoutUrl);

    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff902326),
          title: Text(
            "Paypal Payment",
            style: TextStyle(color: Colors.white),
          ),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: checkoutUrl,
              onPageFinished: (finish) {
                setState(() {
                  isLoad = false;
                });
              },
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) async {
                if (request.url.contains(returnURL)) {
                  final uri = Uri.parse(request.url);
                  final payerID = uri.queryParameters['PayerID'];

                  if (payerID != null) {
                    //await _loginn();
                    var r = await services.executePayment(
                        executeUrl, payerID, accessToken);

                    print("mylord");
                    widget.onFinish(r);

                    // createOrder(
                    //             basketDataForSearch,
                    //             userFirstName,
                    //             userLastName,
                    //             companyName,
                    //             addressStreet,
                    //             addressCity,
                    //             addressZipCode,
                    //             emailAddress,
                    //             addressPhoneNumber,
                    //             customerNote,
                    //             selectedRadio,
                    //             context,
                    //             ordertype == "Pickup"?
                    //             "pickup":"delivery",
                    //              ordertype == "Pickup"?
                    //             "pickup_date"  :  "delivery_date",
                    //             formatDate,
                    //             ordertype == "Pickup"?
                    //             "pickup_time"  :  "delivery_time",
                    //             buttontext,
                    //             customerid
                    //         );

                    //Navigator.of(context).pop();
                    //  Navigator.push(context,
                    //  MaterialPageRoute(builder: (context) => ConfPayment(true)),);

                  } else {
                    Navigator.of(context).pop();
                  }
                }
                if (request.url.contains(cancelURL)) {
                  Navigator.of(context).pop();
                }
                return NavigationDecision.navigate;
              },
            ),
            isLoad
                ? LinearProgressIndicator(
                    backgroundColor: Colors.orangeAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    // valueColor: ,
                  )
                : Stack(),
          ],
        ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(
            child: Container(
                child: CircularProgressIndicator(
          color: Color(0xff902326),
        ))),
      );
    }
  }
}
