import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cocoliebe/bloc/switch3.dart';
import 'package:cocoliebe/models/customerlb.dart';
import 'package:cocoliebe/utils/formhelperlb.dart';
// import 'package:woocommerce/bloc/switch3.dart';
// import 'package:woocommerce/models/customerlb.dart';
// import "package:woocommerce/routes/checkout2.dart";
// import 'package:woocommerce/utils/customappbar.dart';
// import 'package:woocommerce/utils/formhelperlb.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController emailController = TextEditingController();
  CustomerModelLB model2;
  bool big = false;

  FToast fToast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: AppBar(
                backgroundColor: Color(0xFF902326),
                leading: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          size: 24,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                title: Column(
                  children: [
                    Text(
                      "Personal data",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Container(
                    padding: EdgeInsets.only(right: 12),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 14, right: 14),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order Information",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "When placing an order, you will receive a confirmation, status messages and a request to review the restaurant via email or otherwise (such as push messages).",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Messages about news and discounts",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff000000),
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            width: 40,
                            child: Switch3()),
                      ),
                    ],
                  ),
                  Text(
                    "Receive discounts, loyalty offers and others updates.",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FormHelperLB.fieldLabel("E-mail"),
                  FormHelperLB.textInput(
                    context,
                    emailController,
                    false,
                    (value) => {
                      this.model2.email = value,
                    },
                    onValidate: (value) {},
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 60,
                    child: RaisedButton(
                      color: Color(0XFF2173F5),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg:
                                "Your preferences were submitted. An email will be sent confirming your changes. Changes can take up to 72 hours to take effect.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
