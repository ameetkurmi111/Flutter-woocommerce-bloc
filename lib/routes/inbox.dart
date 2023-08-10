import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cocoliebe/routes/unauth_widget.dart';
import 'package:cocoliebe/services/shared_service.dart';
// import "package:woocommerce/routes/checkout2.dart";
// import 'package:woocommerce/routes/unauth_widget.dart';
// import 'package:woocommerce/services/shared_service.dart';
// import 'package:woocommerce/utils/customappbar.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedService.isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> loginModel) {
          if (loginModel.data) {
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
                              "Inbox",
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
                    Expanded(
                      child: Container(
                        color: Color(0xFFEEEEEE),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Icon(
                                Icons.email,
                                color: Color(0xff000000),
                                size: 40.0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                "Your inbox is empty",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff000000),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                "Check your inbox regularly for cool discounts!",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),
                                  fontFamily: "Montserrat",
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
            );
          } else {
            return UnAuthWidget();
          }
        });
  }
}
