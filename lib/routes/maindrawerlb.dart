import 'dart:ui';
import 'package:aws_translate/aws_translate.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cocoliebe/models/tryModel.dart';
import 'package:cocoliebe/routes/SharedService.dart';
import 'package:cocoliebe/routes/aboutus.dart';
import 'package:cocoliebe/routes/colophon.dart';
import 'package:cocoliebe/routes/faq.dart';
import 'package:cocoliebe/routes/login.dart';
import 'package:cocoliebe/routes/order.dart';
import 'package:cocoliebe/routes/privacypolicy.dart';
import 'package:cocoliebe/routes/restaurant_homepage.dart';
import 'package:cocoliebe/routes/selectLanguage.dart';
import 'package:cocoliebe/routes/signuppagelb.dart';
import 'package:cocoliebe/routes/progressScreen.dart';
import 'package:cocoliebe/routes/termsofcondition.dart';
import 'package:cocoliebe/services/shared_service.dart';
import 'package:flag/flag.dart';

// import 'package:woocommerce/models/login_model.dart';
// import 'package:woocommerce/routes/faq.dart';
// import 'package:woocommerce/routes/inbox.dart';
// import 'package:woocommerce/routes/login.dart';
// import 'package:woocommerce/routes/order.dart';
// import 'package:woocommerce/routes/personalinfo.dart';
// import 'package:woocommerce/routes/restaurant_homepage.dart';
// import 'package:woocommerce/routes/signuppagelb.dart';
// import 'package:woocommerce/routes/termsofcondition.dart';
// import 'package:woocommerce/routes/unauth_widget.dart';
// import 'package:woocommerce/services/shared_service.dart';
// import 'package:woocommerce/routes/privacypolicy.dart';
// import 'package:woocommerce/routes/colophon.dart';

int customerID;
int counting = 1;
var storeLastValueForLanguage;

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool help = true;
  //String title='Hi there';

  bool isToggle = false;

  @override
  void initState() {
    super.initState();
    // awsTranslate = AwsTranslate();
    //readEnv();
  }

  // void readEnv() async {

  //   awsTranslate = AwsTranslate(
  //       poolId: poolId,
  //       region: Regions.US_WEST_2);
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedService.isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> loginModel) {
          if (loginModel.data) {
            return Drawer(
              elevation: 500,
              child: loginModel.data == null
                  ? Container()
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Container(
                          height: 151,
                          decoration: BoxDecoration(
                            color: Color(0xffc72e2e),
                          ),
                          child: Row(
                            children: [
                              Container(
                                //  color: ,
                                margin: EdgeInsets.only(
                                  left: 23,
                                ),
                                child: Icon(
                                  Icons.account_circle,
                                  size: 70,
                                  color: Color(0xffc72e2e),
                                ),
                                //padding: EdgeInsets.symmetric(vertical: 33),
                                width: 85,
                                height: 85,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              FutureBuilder(
                                future: SharedService.loginDetails(),
                                builder: (context, snapshot) {
                                  if (snapshot.data != null) {
                                    customerID = int.parse(snapshot.data.id);
                                    return Container(
                                      child: snapshot.data == null
                                          ? Container()
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 37,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 14, top: 4),
                                                  child: Text(
                                                    "Welcome!",
                                                    style: TextStyle(
                                                      fontSize: 28.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Montserrat",
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 4.0),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 14, top: 4),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Text(
                                                      //   "${snapshot.data.displayName} ${snapshot.data.id}",
                                                      //   style: TextStyle(
                                                      //     fontSize: 14.0,
                                                      //     color: Colors.white,
                                                      //     fontWeight: FontWeight.w600,
                                                      //     fontFamily: "Montserrat",
                                                      //   ),
                                                      // ),
                                                      SizedBox(height: 2.0),
                                                      Text(
                                                        "${snapshot.data.email}",
                                                        style: TextStyle(
                                                          fontSize: 10.0,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily:
                                                              "Montserrat",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Expanded(
                                                //   child: FlatButton(
                                                //     onPressed: () {
                                                //       Navigator.push(
                                                //         context,
                                                //         MaterialPageRoute(
                                                //             builder: (context) =>
                                                //                 PersonalInfo()),
                                                //       );
                                                //     },
                                                //     child: Text(
                                                //       "View Personal Information",
                                                //       textAlign: TextAlign.left,
                                                //       style: TextStyle(
                                                //         fontSize: 12.0,
                                                //         decoration:
                                                //             TextDecoration.underline,
                                                //         fontFamily: "Montserrat",
                                                //         fontWeight: FontWeight.w600,
                                                //         color: Colors.white,
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                    );
                                  } else if (snapshot.data == null) {
                                    return Container();
                                  }
                                  return Container();
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Color(0xFFEEEEEE),
                          padding: EdgeInsets.only(left: 14, right: 14),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 14,
                              ),
                              // Container(
                              //   height: 58,
                              //   width: double.infinity,
                              //   child: RaisedButton(
                              //     color: Colors.white,
                              //     onPressed: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => Inbox()),
                              //       );
                              //     },
                              //     child: Center(
                              //       child: Row(
                              //         children: [
                              //           Container(
                              //               padding: EdgeInsets.only(left: 5),
                              //               alignment: Alignment.centerLeft,
                              //               child: Container(
                              //                 child: Icon(
                              //                   Icons.email,
                              //                   color: Color(0xff000000),
                              //                   size: 20.0,
                              //                 ),
                              //               )),
                              //           SizedBox(
                              //             width: 20,
                              //           ),
                              //           Text(
                              //             "Inbox",
                              //             style: TextStyle(
                              //               fontSize: 14,
                              //               fontWeight: FontWeight.w600,
                              //               color: Color(0xff000000),
                              //               fontFamily: "Montserrat",
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              SizedBox(
                                height: 0.5,
                              ),
                              Container(
                                height: 58,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    // onPrimary: Colors.white,
                                    primary: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                              Duration(milliseconds: 500),
                                          pageBuilder: (context, animation,
                                              secondAnimation) {
                                            return Order();
                                          },
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return Material(
                                              elevation: 12,
                                              child: SlideTransition(
                                                position: animation.drive(Tween(
                                                        begin: Offset(-5, -9),
                                                        end: Offset(0, 0))
                                                    .chain(CurveTween(
                                                        curve: Curves
                                                            .easeOutCubic))),
                                                child: ScaleTransition(
                                                  scale: animation,
                                                  child: child,
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  },
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(left: 5),
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: Icon(
                                                Icons.shopping_bag_rounded,
                                                color: Color(0xff000000),
                                                size: 20.0,
                                              ),
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Orders",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000),
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 14),
                              Container(
                                height: 58,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(left: 5),
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: Icon(
                                                Icons.place,
                                                color: Color(0xff000000),
                                                size: 20.0,
                                              ),
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Country",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000),
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "Germany",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF616161),
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 14,
                              ),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      help = !help;
                                    });
                                  },
                                  child: help
                                      ? Column(
                                          children: [
                                            Container(
                                              height: 58,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Container(
                                                      child: Icon(
                                                        Icons
                                                            .announcement_rounded,
                                                        color:
                                                            Color(0xff000000),
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "Need help?",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff000000),
                                                      fontFamily: "Montserrat",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 75,
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: IconButton(
                                                        icon: Icon(Icons
                                                            .arrow_drop_down_sharp),
                                                        color:
                                                            Color(0xff000000),
                                                        onPressed: () {
                                                          setState(() {
                                                            help = !help;
                                                          });
                                                        },
                                                        iconSize: 28.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Container(
                                                      child: Icon(
                                                        Icons
                                                            .announcement_rounded,
                                                        color:
                                                            Color(0xff000000),
                                                        size: 20.0,
                                                      ),
                                                    )),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "Need help?",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff000000),
                                                    fontFamily: "Montserrat",
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 75,
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: IconButton(
                                                      icon: Icon(Icons
                                                          .arrow_drop_up_sharp),
                                                      color: Color(0xff000000),
                                                      onPressed: () {
                                                        setState(() {
                                                          help = !help;
                                                        });
                                                      },
                                                      iconSize: 28.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 48,
                                              width: double.infinity,
                                              child: FlatButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                        transitionDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        pageBuilder: (context,
                                                            animation,
                                                            secondAnimation) {
                                                          return Faq();
                                                        },
                                                        transitionsBuilder:
                                                            (context,
                                                                animation,
                                                                secondaryAnimation,
                                                                child) {
                                                          return Material(
                                                            elevation: 12,
                                                            child:
                                                                SlideTransition(
                                                              position: animation.drive(Tween(
                                                                      begin:
                                                                          Offset(
                                                                              1,
                                                                              0),
                                                                      end: Offset(
                                                                          0, 0))
                                                                  .chain(CurveTween(
                                                                      curve: Curves
                                                                          .easeOutCubic))),
                                                              child:
                                                                  ScaleTransition(
                                                                scale:
                                                                    animation,
                                                                child: child,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  );
                                                },
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        "Frequently asked questions",
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xff000000),
                                                          fontFamily:
                                                              "Montserrat",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              // color: Color(0xFFEEEEEE),
                                              thickness: 1.0,
                                            ),
                                            Container(
                                              height: 48,
                                              width: double.infinity,
                                              child: FlatButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                        transitionDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        pageBuilder: (context,
                                                            animation,
                                                            secondAnimation) {
                                                          return Terms();
                                                        },
                                                        transitionsBuilder:
                                                            (context,
                                                                animation,
                                                                secondaryAnimation,
                                                                child) {
                                                          return Material(
                                                            elevation: 12,
                                                            child:
                                                                SlideTransition(
                                                              position: animation.drive(Tween(
                                                                      begin:
                                                                          Offset(
                                                                              -5,
                                                                              0),
                                                                      end: Offset(
                                                                          0, 0))
                                                                  .chain(CurveTween(
                                                                      curve: Curves
                                                                          .easeOutCubic))),
                                                              child:
                                                                  ScaleTransition(
                                                                scale:
                                                                    animation,
                                                                child: child,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  );
                                                },
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        "Terms and conditions",
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xff000000),
                                                          fontFamily:
                                                              "Montserrat",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              // color: Color(0xFFEEEEEE),
                                              thickness: 1.0,
                                            ),
                                            Container(
                                              height: 48,
                                              width: double.infinity,
                                              child: FlatButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                        transitionDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        pageBuilder: (context,
                                                            animation,
                                                            secondAnimation) {
                                                          return PrivacyPolicy();
                                                        },
                                                        transitionsBuilder:
                                                            (context,
                                                                animation,
                                                                secondaryAnimation,
                                                                child) {
                                                          return Material(
                                                            elevation: 12,
                                                            child:
                                                                SlideTransition(
                                                              position: animation.drive(Tween(
                                                                      begin:
                                                                          Offset(
                                                                              -5,
                                                                              0),
                                                                      end: Offset(
                                                                          0, 0))
                                                                  .chain(CurveTween(
                                                                      curve: Curves
                                                                          .easeOutCubic))),
                                                              child:
                                                                  ScaleTransition(
                                                                scale:
                                                                    animation,
                                                                child: child,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  );
                                                },
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        "Privacy policy",
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xff000000),
                                                          fontFamily:
                                                              "Montserrat",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              // color: Color(0xFFEEEEEE),
                                              thickness: 1.0,
                                            ),
                                            Container(
                                              height: 48,
                                              width: double.infinity,
                                              child: FlatButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                        transitionDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        pageBuilder: (context,
                                                            animation,
                                                            secondAnimation) {
                                                          return Colophon();
                                                        },
                                                        transitionsBuilder:
                                                            (context,
                                                                animation,
                                                                secondaryAnimation,
                                                                child) {
                                                          return Material(
                                                            elevation: 12,
                                                            child:
                                                                SlideTransition(
                                                              position: animation.drive(Tween(
                                                                      begin:
                                                                          Offset(
                                                                              -5,
                                                                              0),
                                                                      end: Offset(
                                                                          0, 0))
                                                                  .chain(CurveTween(
                                                                      curve: Curves
                                                                          .easeOutCubic))),
                                                              child:
                                                                  ScaleTransition(
                                                                scale:
                                                                    animation,
                                                                child: child,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  );
                                                },
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        "Colophon",
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xff000000),
                                                          fontFamily:
                                                              "Montserrat",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8)
                                          ],
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),

                              Container(
                                height: 58,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                              Duration(milliseconds: 500),
                                          pageBuilder: (context, animation,
                                              secondAnimation) {
                                            return AboutUs();
                                          },
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return Material(
                                              elevation: 12,
                                              child: SlideTransition(
                                                position: animation.drive(Tween(
                                                        begin: Offset(-5, 3),
                                                        end: Offset(0, 0))
                                                    .chain(CurveTween(
                                                        curve: Curves
                                                            .easeOutCubic))),
                                                child: ScaleTransition(
                                                  scale: animation,
                                                  child: child,
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  },
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(left: 5),
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: Icon(
                                                Icons.group,
                                                color: Color(0xff000000),
                                                size: 20.0,
                                              ),
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "About Us",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000),
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              //SizedBox(height: 0.5),
                              // uiOfSelectLanguage(),
                              // SizedBox(
                              //   height: 14,
                              // ),
                              Container(
                                height: 58,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                  onPressed: () async {
                                    SharedService.logout();
                                    if (Sharedservice.DeleteData() != null) {
                                      Sharedservice.DeleteData();
                                    }

                                    Fluttertoast.showToast(
                                        msg: "Logout successful",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        // backgroundColor: Color(0xFF424242),
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    print("logoutsuccess");
                                    basketDataForSearch.clear();
                                    countDataForSearch[0].itemCount = 0;
                                    basketDataForSearch.clear();
                                    productItem = null;
                                    myList = null;
                                    count = 0;
                                    countList = 0;
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                    );
                                  },
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 5),
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            child: Icon(
                                              Icons.logout,
                                              color: Color(0xff000000),
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Logout",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff000000),
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
            );
          } else {
            return Drawer(
              elevation: 500,
              child: ListView(
                // physics: PageScrollPhysics(),
                children: [
                  Container(
                    height: 151,
                    decoration: BoxDecoration(
                      color: Color(0xffc72e2e),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.account_circle,
                            size: 70,
                            color: Color(0xffc72e2e),
                          ),
                          margin: EdgeInsets.only(
                            left: 23,
                          ),
                          //padding: EdgeInsets.symmetric(vertical: 33),
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 37,
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 14, top: 20),
                                child: Text(
                                  'Hi There',
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              // Align(
                              //   alignment: Alignment.topLeft,
                              //   child: FlatButton(
                              //     onPressed: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => PersonalInfo()),
                              //       );
                              //     },
                              //     child: Text(
                              //       "View Personal Information",
                              //       textAlign: TextAlign.left,
                              //       style: TextStyle(
                              //         fontSize: 12.0,
                              //         decoration: TextDecoration.underline,
                              //         fontFamily: "Montserrat",
                              //         fontWeight: FontWeight.w600,
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Color(0xFFEEEEEE),
                    padding: EdgeInsets.only(left: 14, right: 14),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   count=0;
                                    // });
                                    count = 0;
                                    countList = 0;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white),
                                  child: Container(
                                    height: 45,
                                    width: 90,
                                    decoration: BoxDecoration(),
                                    child: Center(
                                      child: Text('Sign In',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffa75264),
                                            fontWeight: FontWeight.w800,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPageLB()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white),
                                  child: Container(
                                    height: 45,
                                    width: 98,
                                    decoration: BoxDecoration(),
                                    child: Center(
                                      child: Text('Create Account',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffa75264))),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        // Container(
                        //   height: 58,
                        //   width: double.infinity,
                        //   child: RaisedButton(
                        //     color: Colors.white,
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Inbox()),
                        //       );
                        //     },
                        //     child: Center(
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //               padding: EdgeInsets.only(left: 5),
                        //               alignment: Alignment.centerLeft,
                        //               child: Container(
                        //                 child: Icon(
                        //                   Icons.email,
                        //                   color: Color(0xff000000),
                        //                   size: 20.0,
                        //                 ),
                        //               )),
                        //           SizedBox(
                        //             width: 20,
                        //           ),
                        //           Text(
                        //             "Inbox",
                        //             style: TextStyle(
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.w600,
                        //               color: Color(0xff000000),
                        //               fontFamily: "Montserrat",
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 0.5,
                        // ),
                        // Container(
                        //   height: 58,
                        //   width: double.infinity,
                        //   child: RaisedButton(
                        //     color: Colors.white,
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Order()),
                        //       );
                        //     },
                        //     child: Center(
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //               padding: EdgeInsets.only(left: 5),
                        //               alignment: Alignment.centerLeft,
                        //               child: Container(
                        //                 child: Icon(
                        //                   Icons.shopping_bag_rounded,
                        //                   color: Color(0xff000000),
                        //                   size: 20.0,
                        //                 ),
                        //               )),
                        //           SizedBox(
                        //             width: 20,
                        //           ),
                        //           Text(
                        //             "Orders",
                        //             style: TextStyle(
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.w600,
                        //               color: Color(0xff000000),
                        //               fontFamily: "Montserrat",
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 0.5),
                        Container(
                          height: 58,
                          width: double.infinity,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {},
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(left: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Icon(
                                          Icons.place,
                                          color: Color(0xff000000),
                                          size: 20.0,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Country",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Germany",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF616161),
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),

                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, onPrimary: Colors.white),
                            onPressed: () {
                              setState(() {
                                help = !help;
                              });
                            },
                            child: help
                                ? Column(
                                    children: [
                                      Container(
                                        height: 58,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(left: 5),
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: Icon(
                                                  Icons.announcement_rounded,
                                                  color: Color(0xff000000),
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Need help?",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000),
                                                fontFamily: "Montserrat",
                                              ),
                                            ),
                                            SizedBox(
                                              width: 75,
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: IconButton(
                                                  icon: Icon(Icons
                                                      .arrow_drop_down_sharp),
                                                  color: Color(0xff000000),
                                                  onPressed: () {
                                                    setState(() {
                                                      help = !help;
                                                    });
                                                  },
                                                  iconSize: 28.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(left: 5),
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: Icon(
                                                  Icons.announcement_rounded,
                                                  color: Color(0xff000000),
                                                  size: 20.0,
                                                ),
                                              )),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Need help?",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff000000),
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                          SizedBox(
                                            width: 75,
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                icon: Icon(
                                                    Icons.arrow_drop_up_sharp),
                                                color: Color(0xff000000),
                                                onPressed: () {
                                                  setState(() {
                                                    help = !help;
                                                  });
                                                },
                                                iconSize: 28.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 48,
                                        width: double.infinity,
                                        child: FlatButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                  transitionDuration: Duration(
                                                      milliseconds: 500),
                                                  pageBuilder: (context,
                                                      animation,
                                                      secondAnimation) {
                                                    return Faq();
                                                  },
                                                  transitionsBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    return Material(
                                                      elevation: 12,
                                                      child: SlideTransition(
                                                        position: animation
                                                            .drive(Tween(
                                                                    begin:
                                                                        Offset(
                                                                            -5,
                                                                            0),
                                                                    end: Offset(
                                                                        0, 0))
                                                                .chain(CurveTween(
                                                                    curve: Curves
                                                                        .easeOutCubic))),
                                                        child: ScaleTransition(
                                                          scale: animation,
                                                          child: child,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            );
                                          },
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  "Frequently asked questions",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff000000),
                                                    fontFamily: "Montserrat",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        // color: Color(0xFFEEEEEE),
                                        thickness: 1.0,
                                      ),
                                      Container(
                                        height: 48,
                                        width: double.infinity,
                                        child: FlatButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                  transitionDuration: Duration(
                                                      milliseconds: 500),
                                                  pageBuilder: (context,
                                                      animation,
                                                      secondAnimation) {
                                                    return Terms();
                                                  },
                                                  transitionsBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    return Material(
                                                      elevation: 12,
                                                      child: SlideTransition(
                                                        position: animation
                                                            .drive(Tween(
                                                                    begin:
                                                                        Offset(
                                                                            -5,
                                                                            0),
                                                                    end: Offset(
                                                                        0, 0))
                                                                .chain(CurveTween(
                                                                    curve: Curves
                                                                        .easeOutCubic))),
                                                        child: ScaleTransition(
                                                          scale: animation,
                                                          child: child,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            );
                                          },
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  "Terms and conditions",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff000000),
                                                    fontFamily: "Montserrat",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        // color: Color(0xFFEEEEEE),
                                        thickness: 1.0,
                                      ),
                                      Container(
                                        height: 48,
                                        width: double.infinity,
                                        child: FlatButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                  transitionDuration: Duration(
                                                      milliseconds: 500),
                                                  pageBuilder: (context,
                                                      animation,
                                                      secondAnimation) {
                                                    return PrivacyPolicy();
                                                  },
                                                  transitionsBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    return Material(
                                                      elevation: 12,
                                                      child: SlideTransition(
                                                        position: animation
                                                            .drive(Tween(
                                                                    begin:
                                                                        Offset(
                                                                            -5,
                                                                            0),
                                                                    end: Offset(
                                                                        0, 0))
                                                                .chain(CurveTween(
                                                                    curve: Curves
                                                                        .easeOutCubic))),
                                                        child: ScaleTransition(
                                                          scale: animation,
                                                          child: child,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            );
                                          },
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  "Privacy policy",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff000000),
                                                    fontFamily: "Montserrat",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        // color: Color(0xFFEEEEEE),
                                        thickness: 1.0,
                                      ),
                                      Container(
                                        height: 48,
                                        width: double.infinity,
                                        child: FlatButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                  transitionDuration: Duration(
                                                      milliseconds: 500),
                                                  pageBuilder: (context,
                                                      animation,
                                                      secondAnimation) {
                                                    return Colophon();
                                                  },
                                                  transitionsBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    return Material(
                                                      elevation: 12,
                                                      child: SlideTransition(
                                                        position: animation
                                                            .drive(Tween(
                                                                    begin:
                                                                        Offset(
                                                                            -5,
                                                                            0),
                                                                    end: Offset(
                                                                        0, 0))
                                                                .chain(CurveTween(
                                                                    curve: Curves
                                                                        .easeOutCubic))),
                                                        child: ScaleTransition(
                                                          scale: animation,
                                                          child: child,
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            );
                                          },
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  "Colophon",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff000000),
                                                    fontFamily: "Montserrat",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                    ],
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),

                        Container(
                          height: 58,
                          width: double.infinity,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    pageBuilder:
                                        (context, animation, secondAnimation) {
                                      return AboutUs();
                                    },
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return Material(
                                        elevation: 12,
                                        child: SlideTransition(
                                          position: animation.drive(Tween(
                                                  begin: Offset(-5, 0),
                                                  end: Offset(0, 0))
                                              .chain(CurveTween(
                                                  curve: Curves.easeOutCubic))),
                                          child: ScaleTransition(
                                            scale: animation,
                                            child: child,
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            },
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(left: 5),
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Icon(
                                          Icons.group,
                                          color: Color(0xff000000),
                                          size: 20.0,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "About Us",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // uiOfSelectLanguage(),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }

  var r;
  // uiOfSelectLanguage() {

  //   if(counting==1){
  //     r = "English";
  //   }else if(r==null){
  //     r=storeLastValueForLanguage;
  //   }
  //   var reply;

  //   return Container(
  //     height: 58,
  //     width: double.infinity,
  //     child: RaisedButton(
  //       color: Colors.white,
  //       onPressed: () async {
  //         reply = await Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => SelectLanguage(r)),
  //         );
  //         counting++;
  //         setState(() {
  //           r = reply;
  //           storeLastValueForLanguage = reply;
  //         });
  //       },
  //       child: Center(
  //         child: Row(
  //           children: [
  //             Container(
  //                 padding: EdgeInsets.only(left: 5),
  //                 alignment: Alignment.centerLeft,
  //                 child: Container(
  //                   child: Icon(
  //                     Icons.translate,
  //                     color: Color(0xff000000),
  //                     size: 20.0,
  //                   ),
  //                 )),
  //             SizedBox(
  //               width: 20,
  //             ),
  //             Text(
  //               "Language",
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w600,
  //                 color: Color(0xff000000),
  //                 fontFamily: "Montserrat",
  //               ),
  //             ),
  //             SizedBox(
  //               width: 40,
  //             ),
  //             language(r)
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // language(r) {
  //   if (r == "English") {
  //     return Row(children: [
  //       Container(
  //           padding: EdgeInsets.only(left: 5),
  //           alignment: Alignment.centerLeft,
  //           child: Container(
  //             child: CircleAvatar(
  //               radius: 8.0,
  //               backgroundColor: Colors.black,
  //               child: CircleAvatar(
  //                   radius: 7.5,
  //                   backgroundColor: Colors.white,
  //                   child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(50.0),
  //                       child: Container(
  //                           child: Flag(
  //                         'gb',
  //                         height: 15,
  //                         width: 15,
  //                         fit: BoxFit.fill,
  //                       )))),
  //             ),
  //           )),
  //       SizedBox(
  //         width: 7,
  //       ),
  //       Align(
  //         alignment: Alignment.centerRight,
  //         child: Text(
  //           "English",
  //           style: TextStyle(
  //             fontSize: 13,
  //             fontWeight: FontWeight.w600,
  //             color: Color(0xFF616161),
  //             fontFamily: "Montserrat",
  //           ),
  //         ),
  //       ),
  //     ]);
  //   } else if (r == "German") {
  //     return Row(children: [
  //       Container(
  //           padding: EdgeInsets.only(left: 5),
  //           alignment: Alignment.centerLeft,
  //           child: Container(
  //             child: CircleAvatar(
  //               radius: 8.0,
  //               backgroundColor: Colors.black,
  //               child: CircleAvatar(
  //                   radius: 7.5,
  //                   backgroundColor: Colors.white,
  //                   child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(50.0),
  //                       child: Container(
  //                           child: Flag(
  //                         'de',
  //                         height: 15,
  //                         width: 15,
  //                         fit: BoxFit.fill,
  //                       )))),
  //             ),
  //           )),
  //       SizedBox(
  //         width: 7,
  //       ),
  //       Align(
  //         alignment: Alignment.centerRight,
  //         child: Text(
  //           "German",
  //           style: TextStyle(
  //             fontSize: 13,
  //             fontWeight: FontWeight.w600,
  //             color: Color(0xFF616161),
  //             fontFamily: "Montserrat",
  //           ),
  //         ),
  //       ),
  //     ]);
  //   }
  // }

  // changeLanguage(text) async{
  //   if(counting==1){
  //     r = "English";
  //   }else if(r==null){
  //     r=storeLastValueForLanguage;
  //   }

  //   if(r=="English"){
  //    dynamic translated = await awsTranslate.translateText(text, to: 'es');
  //   // print(translated);
  //   }else if(r=="German"){
  //     dynamic translated = await awsTranslate.translateText(text, to: 'de');
  //    // print(translated);
  //   }
  //   return text;
  // }

}
