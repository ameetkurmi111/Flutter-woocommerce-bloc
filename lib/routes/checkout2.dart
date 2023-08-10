import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cocoliebe/api_service.dart';
import 'package:cocoliebe/routes/basket_page.dart';
import 'package:cocoliebe/models/tryModel.dart';
import 'package:cocoliebe/routes/SharedService.dart';
import 'package:cocoliebe/routes/confpayment.dart';
import 'package:cocoliebe/routes/login.dart';
import 'package:cocoliebe/routes/maindrawerlb.dart';
import 'package:cocoliebe/routes/paypalpayment.dart';
import 'package:cocoliebe/routes/privacypolicy.dart';
import 'package:cocoliebe/routes/restaurant_homepage.dart';
import 'package:cocoliebe/routes/signuppagelb.dart';
import 'package:cocoliebe/routes/termsofcondition.dart';
import "package:cocoliebe/utils/validatorservicelb.dart";
import "package:cocoliebe/utils/validatorpostalcode.dart";
import "package:cocoliebe/utils/validatorstreet.dart";
import "package:cocoliebe/utils/validator2.dart";
import 'package:cocoliebe/services/shared_service.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CheckOut2 extends StatefulWidget {
  var selectedItemPstCode;
  CheckOut2(this.selectedItemPstCode);
  @override
  _Checkout2State createState() => _Checkout2State(this.selectedItemPstCode);
}

class _Checkout2State extends State<CheckOut2> {
  var selectedItemPstCode;

  int initialIndex;
  _Checkout2State(this.selectedItemPstCode);
  bool validateAndSav2() {
    final form = globalKey2.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      setState(() => validate2 = true);
    }
  }

  int selectedRadioTile;
  bool payment,
      validate2 = false,
      isSwitched = false,
      paypalpay = false,
      plotdata = false;

  GlobalKey<FormState> globalKey2 = GlobalKey<FormState>();

  final _street = TextEditingController();
  final _city = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _company = TextEditingController();
  final _note = TextEditingController();
  final _coupon = TextEditingController();
  String time = "",
      buttonText = "Please select time",
      time2 = "Please select time",
      orderType = "Pickup",
      formatDate = "";
  String formattedDate;
  int selectedValue;
  int selectedValue2 = 0;
  DateTime currentDate = DateTime.now();
  var totalAmount;
  @override
  void initState() {
    super.initState();
    selectedRadioTile = 2;
    asyncMethod();
  }

  void asyncMethod() async {
    List<String> info = await Sharedservice.ReadData();
    if (info == null) {
      print("empty info");
    } else {
      print(info);
      _street.text = info[0];
      _city.text = info[1];
      _firstName.text = info[2];
      _lastName.text = info[3];
      _email.text = info[4];
      _phone.text = info[5];
      _note.text = info[6];
    }
  }

  SetselectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    formatDate = DateFormat.yMMMd().format(currentDate);
    return FutureBuilder(
        future: SharedService.isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> loginModel) {
          if (loginModel.data) {
            return WillPopScope(
              onWillPop: () async => false,
              child: SingleChildScrollView(
                child: Form(
                  key: globalKey2,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 18, left: 18, top: 10),
                        padding: EdgeInsets.only(top: 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text("Order type",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "Montserrat",
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ToggleSwitch(
                                    initialLabelIndex: selectedValue2,
                                    activeBgColors: [
                                      [Color(0xff010101
                                      )],
                                      [Color(0xff010101
                                      )]
                                    ],
                                    totalSwitches: 1,
                                    labels: ['Pickup'],
                                    onToggle: (int value2) {
                                      setState(() {
                                        selectedValue2 = value2;
                                        if (value2 == 0) {
                                          orderType = 'Pickup';
                                        }
                                        // else if (value2 == 1) {
                                        //   orderType = 'Delivery';
                                        // }
                                      });
                                      initialIndex = value2;
                                    },
                                  ),
                                ],
                              ),
                              // Container(
                              //   width: double.infinity,
                              //   height: 55,
                              //   child: ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //       primary: Colors.white,
                              //     ),
                              //     // color: Colors.white,
                              //     onPressed: () {
                              //       showModalBottomSheet(
                              //           context: context,
                              //           builder: (BuildContext context) {
                              //             return CupertinoPicker(
                              //               backgroundColor: Color(0xFFEEEEEE),
                              //               onSelectedItemChanged:
                              //                   ( int value2 ) {
                              //                 setState(() {
                              //                   selectedValue2 = value2;
                              //                   if (value2 == 0) {
                              //                     orderType = 'Pickup';
                              //                   } else if (value2 == 1) {
                              //                     orderType = 'Delivery';
                              //                   }
                              //                 });
                              //               },
                              //               itemExtent: 35.0,
                              //               children: const [
                              //                 Text('Pickup'),
                              //                 Text('Delivery'),
                              //               ],
                              //             );
                              //           });
                              //     },
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Align(
                              //           alignment: Alignment.centerLeft,
                              //           child: Text(
                              //             orderType,
                              //             style: TextStyle(
                              //               fontSize: 15,
                              //               color: Color(0xff000000),
                              //               fontWeight: FontWeight.w600,
                              //               fontFamily: "Montserrat",
                              //             ),
                              //           ),
                              //         ),
                              //         Align(
                              //             alignment: Alignment.centerRight,
                              //             child: Icon(Icons
                              //                 .arrow_forward_ios_outlined)),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              SizedBox(
                                height: 20,
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  orderType == "Pickup"
                                      ? "Pickup date"
                                      : "Delivery date",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 55,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white),
                                    // color: Colors.white,
                                    onPressed: () {
                                      CupertinoRoundedDatePicker.show(
                                        context,
                                        fontFamily: "Montserrat",
                                        initialDatePickerMode:
                                            CupertinoDatePickerMode.date,
                                        minimumYear: 2021,
                                        maximumYear: 2055,
                                        onDateTimeChanged: (dateTime) {
                                          setState(() {
                                            currentDate = dateTime;
                                            print(currentDate.toString());
                                          });
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            formatDate,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat",
                                            ),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(Icons.date_range)),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  orderType == "Pickup"
                                      ? "Pickup time"
                                      : "Delivery time",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white),
                                  // color: Colors.white,
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CupertinoPicker(
                                            backgroundColor: Color(0xFFEEEEEE),
                                            onSelectedItemChanged: (int value) {
                                              setState(() {
                                                selectedValue = value;
                                                if (value == 0) {
                                                  buttonText =
                                                      'Please select time ';
                                                }
                                                // else if (value == 1) {
                                                //   buttonText = '10:30';
                                                // } else if (value == 2) {
                                                //   buttonText = '10:45';
                                                // } else if (value == 3) {
                                                //   buttonText = '11:00';
                                                // } else if (value == 4) {
                                                //   buttonText = '11:15';
                                                // }
                                                else if (value == 1) {
                                                  buttonText = '11:30';
                                                } else if (value == 2) {
                                                  buttonText = '11:45';
                                                } else if (value == 3) {
                                                  buttonText = '12:00';
                                                } else if (value == 4) {
                                                  buttonText = '12:15';
                                                } else if (value == 5) {
                                                  buttonText = '12:30';
                                                } else if (value == 6) {
                                                  buttonText = '12:45';
                                                } else if (value == 7) {
                                                  buttonText = '13:00';
                                                } else if (value == 8) {
                                                  buttonText = '13:15';
                                                } else if (value == 9) {
                                                  buttonText = '13:30';
                                                } else if (value == 10) {
                                                  buttonText = '13:45';
                                                } else if (value == 11) {
                                                  buttonText = '14:00';
                                                } else if (value == 12) {
                                                  buttonText = '14:15';
                                                } else if (value == 13) {
                                                  buttonText = '14:30';
                                                } else if (value == 14) {
                                                  buttonText = '14:45';
                                                } else if (value == 15) {
                                                  buttonText = '15:00';
                                                } else if (value == 16) {
                                                  buttonText = '15:15';
                                                } else if (value == 17) {
                                                  buttonText = '15:30';
                                                } else if (value == 18) {
                                                  buttonText = '15:45';
                                                } else if (value == 19) {
                                                  buttonText = '16:00';
                                                } else if (value == 20) {
                                                  buttonText = '16:15';
                                                } else if (value == 21) {
                                                  buttonText = '16:30';
                                                } else if (value == 22) {
                                                  buttonText = '16:45';
                                                } else if (value == 23) {
                                                  buttonText = '17:00';
                                                } else if (value == 24) {
                                                  buttonText = '17:15';
                                                } else if (value == 25) {
                                                  buttonText = '17:30';
                                                } else if (value == 26) {
                                                  buttonText = '15:45';
                                                } else if (value == 27) {
                                                  buttonText = '18:00';
                                                } else if (value == 28) {
                                                  buttonText = '18:15';
                                                } else if (value == 29) {
                                                  buttonText = '18:30';
                                                } else if (value == 30) {
                                                  buttonText = '18:45';
                                                } else if (value == 31) {
                                                  buttonText = '19:00';
                                                } else if (value == 32) {
                                                  buttonText = '19:15';
                                                } else if (value == 33) {
                                                  buttonText = '19:30';
                                                } else if (value == 34) {
                                                  buttonText = '19:45';
                                                } else if (value == 35) {
                                                  buttonText = '20:00';
                                                } else if (value == 36) {
                                                  buttonText = '20:15';
                                                } else if (value == 37) {
                                                  buttonText = '20:30';
                                                } else if (value == 38) {
                                                  buttonText = '20:45';
                                                } else if (value == 39) {
                                                  buttonText = '20:00';
                                                } else if (value == 40) {
                                                  buttonText = '20:15';
                                                } else if (value == 41) {
                                                  buttonText = '20:30';
                                                } else if (value == 42) {
                                                  buttonText = '20:45';
                                                } else if (value == 43) {
                                                  buttonText = '21:00';
                                                } else if (value == 44) {
                                                  buttonText = '21:15';
                                                } else if (value == 45) {
                                                  buttonText = '21:30';
                                                  // } else if (value == 46) {
                                                  //   buttonText = '21:45';
                                                  // } else if (value == 47) {
                                                  //   buttonText = '22:00';
                                                  // } else if (value == 48) {
                                                  //   buttonText = '22:15';
                                                  // } else if (value == 49) {
                                                  //   buttonText = '22:30';
                                                  // }
                                                  // else if (value == 50) {
                                                  //   buttonText = '22:45';
                                                  // } else if (value == 51) {
                                                  //   buttonText = '23:00';
                                                }
                                              });
                                            },
                                            itemExtent: 48.0,
                                            children: const [
                                              Text('Please select time'),
                                              // Text('10:30'),
                                              // Text('10:45'),
                                              // Text('11:00'),
                                              // Text('11:15'),
                                              // Text('11:30'),
                                              // Text('11:45'),
                                              Text('12:00'),
                                              Text('12:15'),
                                              Text('12:30'),
                                              Text('12:45'),
                                              Text('13:00'),
                                              Text('12:15'),
                                              Text('13:30'),
                                              Text('13:45'),
                                              Text('14:00'),
                                              Text('14:15'),
                                              Text('14:30'),
                                              Text('14:45'),
                                              Text('15:00'),
                                              Text('15:15'),
                                              Text('15:30'),
                                              Text('15:45'),
                                              Text('16:00'),
                                              Text('16:15'),
                                              Text('16:30'),
                                              Text('16:45'),
                                              Text('17:00'),
                                              Text('17:15'),
                                              Text('17:30'),
                                              Text('17:45'),
                                              Text('18:00'),
                                              Text('18:15'),
                                              Text('18:30'),
                                              Text('18:45'),
                                              Text('19:00'),
                                              Text('19:15'),
                                              Text('19:30'),
                                              Text('19:45'),
                                              Text('20:00'),
                                              Text('20:15'),
                                              Text('20:30'),
                                              Text('20:45'),
                                              Text('21:00'),
                                              Text('21:15'),
                                              Text('21:30'),
                                              // Text('21:45'),
                                              // Text('22:00'),
                                              // Text('22:15'),
                                              // Text('22:30'),
                                              // Text('22:45'),
                                              // Text('23:00'),
                                            ],
                                          );
                                        });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          buttonText,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(Icons.timer)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Delivery address",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Street and house number",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                // validator: (value) {
                                //   if (value.toString().isEmpty) {
                                //     return "Please enter your street and your house number.";
                                //   }
                                //   if (!value.toString().isValidStreet()) {
                                //     return "Please enter your number.";
                                //   }
                                //   return null;
                                // },
                                autovalidate: validate2,
                                controller: _street,
                                decoration: InputDecoration(
                                  // hintText: "kirchstraße 29",
                                  hintStyle:
                                      TextStyle(color: Color(0xFFB5B5B5)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffa75264),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "City",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Please enter your city.";
                                  }
                                  return null;
                                },
                                autovalidate: validate2,
                                controller: _city,
                                decoration: InputDecoration(
                                  //  hintText: "Berlin",
                                  hintStyle:
                                      TextStyle(color: Color(0xFFB5B5B5)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffa75264),
                                      // color: Color(0XFF2173F5),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 20),
                              // Container(
                              //   padding: EdgeInsets.only(left: 2),
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     "Company name",
                              //     style: TextStyle(
                              //       fontSize: 15,
                              //       color: Color(0xff000000),
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: "Montserrat",
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 10),
                              // TextFormField(
                              //   validator: (value) {
                              //     return null;
                              //   },

                              //   autovalidate: validate2,
                              //   decoration: InputDecoration(
                              //     hintText: "Helps the courier to find you please.",
                              //     hintStyle:
                              //     TextStyle(color: Color(0xFFB5B5B5)),
                              //     filled: true,
                              //     fillColor: Colors.white,
                              //     focusedBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: Color(0XFF2173F5),
                              //         width: 1,
                              //       ),
                              //     ),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: Colors.black12,
                              //         width: 1,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 20),
                              // Container(
                              //   padding: EdgeInsets.only(left: 2),
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     "Add note for delivery",
                              //     style: TextStyle(
                              //       fontSize: 15,
                              //       color: Color(0xff000000),
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: "Montserrat",
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Container(
                              //   child: TextFormField(
                              //     controller: _note,
                              //     decoration: InputDecoration(
                              //       hintText: "e.g. I live on 3rd floor, straight up the hall. ",
                              //       hintStyle:
                              //       TextStyle(color: Color(0xFFB5B5B5)),
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //           color: Color(0XFF2173F5),
                              //           width: 1,
                              //         ),
                              //       ),
                              //       enabledBorder: OutlineInputBorder(
                              //         borderSide: BorderSide(
                              //           color: Colors.black12,
                              
                              //           width: 1,
                              //         ),
                              //       ),
                              //     ),
                              //     maxLines: 5,
                              //     minLines: 3,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         alignment: Alignment.topLeft,
                              //         child: Text(
                              //           "Save this remarks for your next order",
                              //           maxLines: 1,
                              //           style: TextStyle(
                              //             fontSize: 11,
                              //             color: Color(0xff000000),
                              //             fontWeight: FontWeight.w600,
                              //             fontFamily: "Montserrat",
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     Expanded(
                              //       child: Container(
                              //         alignment: Alignment.topRight,
                              //         width: 40,
                              //         child: SwitchAddress(),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 25,
                              // ),
                              Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Personal details",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "First name",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Please enter your first name.";
                                  }
                                  return null;
                                },
                                autovalidate: validate2,
                                controller: _firstName,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffa75264),
                                      // color: Color(0XFF2173F5),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Last name",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Please enter your last name.";
                                  }
                                  return null;
                                },
                                autovalidate: validate2,
                                controller: _lastName,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffa75264),
                                      // color: Color(0XFF2173F5),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Email address",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Please enter your Email address.";
                                  }
                                  if (value.isNotEmpty &&
                                      !value.toString().isValidEmail()) {
                                    return "Please enter valid email.";
                                  }
                                  return null;
                                },
                                autovalidate: validate2,
                                controller: _email,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffa75264),
                                      // color: Color(0XFF2173F5),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Phone number",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Please enter your phone number.";
                                  }
                                  if (value.isNotEmpty &&
                                      !value.toString().isValidNumber()) {
                                    return "Please enter a valid number.";
                                  }
                                  return null;
                                },
                                autovalidate: validate2,
                                controller: _phone,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffa75264),
                                      // color: Color(0XFF2173F5),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              //  SizedBox(height: 10),
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     "When placing an order, you will receive a confirmation, Food",
                              //     style: TextStyle(
                              //       fontSize: 10,
                              //       color: Color(0xFF9C9897),
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: "Montserrat",
                              //     ),
                              //   ),
                              // ),
                              //  SizedBox(height: 3),
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     "Tracker status messages and a request to review the",
                              //     style: TextStyle(
                              //       fontSize: 10,
                              //       color: Color(0xFF9C9897),
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: "Montserrat",
                              //     ),
                              //   ),
                              // ),
                              //  SizedBox(height: 3),
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     "restaurant via email or otherwise (such as push messages).",
                              //     style: TextStyle(
                              //       fontSize: 10,
                              //       color: Color(0xFF9C9897),
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: "Montserrat",
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 14),
                              // Row(
                              //   children: [
                              //     Column(
                              //       children: [
                              //         Container(
                              //           alignment: Alignment.topLeft,
                              //           padding: EdgeInsets.only(right: 27),
                              //           child: Text(
                              //             "Receive discounts, loyalty offers and other",
                              //             style: TextStyle(
                              //               fontSize: 11,
                              //               color: Color(0xff000000),
                              //               fontWeight: FontWeight.w600,
                              //               fontFamily: "Montserrat",
                              //             ),
                              //           ),
                              //         ),
                              //         SizedBox(height: 3),
                              //         Container(
                              //           padding: EdgeInsets.only(right: 210),
                              //           child: Text(
                              //             "updates.",
                              //             style: TextStyle(
                              //               fontSize: 11,
                              //               color: Color(0xff000000),
                              //               fontWeight: FontWeight.w600,
                              //               fontFamily: "Montserrat",
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     Expanded(
                              //       child: Container(
                              //           alignment: Alignment.topRight,
                              //           width: 40,
                              //           child: Switch2()),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Company name",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _company,
                                decoration: InputDecoration(
                                  //   hintText: "optional",
                                  hintStyle:
                                      TextStyle(color: Color(0xFFB5B5B5)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffa75264),
                                      // color: Color(0XFF2173F5),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              // Container(
                              //   padding: EdgeInsets.only(left: 2),
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     "Order type",
                              //     style: TextStyle(
                              //       fontSize: 17,
                              //       color: Color(0xff000000),
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: "Montserrat",
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),

                              // Container(
                              //   width: double.infinity,
                              //   height: 55,
                              //   child: ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //       primary: Colors.white,
                              //     ),
                              //     // color: Colors.white,
                              //     onPressed: () {
                              //       showModalBottomSheet(
                              //           context: context,
                              //           builder: (BuildContext context) {
                              //             return CupertinoPicker(
                              //               backgroundColor: Color(0xFFEEEEEE),
                              //               onSelectedItemChanged:
                              //                   (int value2) {
                              //                 setState(() {
                              //                   selectedValue2 = value2;
                              //                   if (value2 == 0) {
                              //                     orderType = 'Pickup';
                              //                   } else if (value2 == 1) {
                              //                     orderType = 'Delivery';
                              //                   }
                              //                 });
                              //               },
                              //               itemExtent: 35.0,
                              //               children: const [
                              //                 Text('Pickup'),
                              //                 Text('Delivery'),
                              //               ],
                              //             );
                              //           });
                              //     },
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Align(
                              //           alignment: Alignment.centerLeft,
                              //           child: Text(
                              //             orderType,
                              //             style: TextStyle(
                              //               fontSize: 15,
                              //               color: Color(0xff000000),
                              //               fontWeight: FontWeight.w600,
                              //               fontFamily: "Montserrat",
                              //             ),
                              //           ),
                              //         ),
                              //         Align(
                              //             alignment: Alignment.centerRight,
                              //             child: Icon(Icons
                              //                 .arrow_forward_ios_outlined)),
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              // SizedBox(
                              //   height: 20,
                              // ),

                              // Container(
                              //   padding: EdgeInsets.only(left: 2),
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     orderType == "Pickup"
                              //         ? "Pickup date"
                              //         : "Delivery date",
                              //     style: TextStyle(
                              //       fontSize: 17,
                              //       color: Color(0xff000000),
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: "Montserrat",
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Container(
                              //     width: double.infinity,
                              //     height: 55,
                              //     child: ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //           primary: Colors.white),
                              //       // color: Colors.white,
                              //       onPressed: () {
                              //         CupertinoRoundedDatePicker.show(
                              //           context,
                              //           fontFamily: "Montserrat",
                              //           initialDatePickerMode:
                              //               CupertinoDatePickerMode.date,
                              //           minimumYear: 2021,
                              //           maximumYear: 2055,
                              //           onDateTimeChanged: (dateTime) {
                              //             setState(() {
                              //               currentDate = dateTime;
                              //               print(currentDate.toString());
                              //             });
                              //           },
                              //         );
                              //       },
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Align(
                              //             alignment: Alignment.centerLeft,
                              //             child: Text(
                              //               formatDate,
                              //               style: TextStyle(
                              //                 fontSize: 15,
                              //                 color: Color(0xff000000),
                              //                 fontWeight: FontWeight.w600,
                              //                 fontFamily: "Montserrat",
                              //               ),
                              //             ),
                              //           ),
                              //           Align(
                              //               alignment: Alignment.centerRight,
                              //               child: Icon(Icons.date_range)),
                              //         ],
                              //       ),
                              //     )),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Container(
                              //   padding: EdgeInsets.only(left: 2),
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     orderType == "Pickup"
                              //         ? "Pickup time"
                              //         : "Delivery time",
                              //     style: TextStyle(
                              //       fontSize: 17,
                              //       color: Color(0xff000000),
                              //       fontWeight: FontWeight.w900,
                              //       fontFamily: "Montserrat",
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Container(
                              //   width: double.infinity,
                              //   height: 55,
                              //   child: ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //         primary: Colors.white),
                              //     // color: Colors.white,
                              //     onPressed: () {
                              //       showModalBottomSheet(
                              //           context: context,
                              //           builder: (BuildContext context) {
                              //             return CupertinoPicker(
                              //               backgroundColor: Color(0xFFEEEEEE),
                              //               onSelectedItemChanged: (int value) {
                              //                 setState(() {
                              //                   selectedValue = value;
                              //                   if (value == 0) {
                              //                     buttonText =
                              //                         'Please select time ';
                              //                   }
                              //                   // else if (value == 1) {
                              //                   //   buttonText = '10:30';
                              //                   // } else if (value == 2) {
                              //                   //   buttonText = '10:45';
                              //                   // } else if (value == 3) {
                              //                   //   buttonText = '11:00';
                              //                   // } else if (value == 4) {
                              //                   //   buttonText = '11:15';
                              //                   // }
                              //                   else if (value == 1) {
                              //                     buttonText = '11:30';
                              //                   } else if (value == 2) {
                              //                     buttonText = '11:45';
                              //                   } else if (value == 3) {
                              //                     buttonText = '12:00';
                              //                   } else if (value == 4) {
                              //                     buttonText = '12:15';
                              //                   } else if (value == 5) {
                              //                     buttonText = '12:30';
                              //                   } else if (value == 6) {
                              //                     buttonText = '12:45';
                              //                   } else if (value == 7) {
                              //                     buttonText = '13:00';
                              //                   } else if (value == 8) {
                              //                     buttonText = '13:15';
                              //                   } else if (value == 9) {
                              //                     buttonText = '13:30';
                              //                   } else if (value == 10) {
                              //                     buttonText = '13:45';
                              //                   } else if (value == 11) {
                              //                     buttonText = '14:00';
                              //                   } else if (value == 12) {
                              //                     buttonText = '14:15';
                              //                   } else if (value == 13) {
                              //                     buttonText = '14:30';
                              //                   } else if (value == 14) {
                              //                     buttonText = '14:45';
                              //                   } else if (value == 15) {
                              //                     buttonText = '15:00';
                              //                   } else if (value == 16) {
                              //                     buttonText = '15:15';
                              //                   } else if (value == 17) {
                              //                     buttonText = '15:30';
                              //                   } else if (value == 18) {
                              //                     buttonText = '15:45';
                              //                   } else if (value == 19) {
                              //                     buttonText = '16:00';
                              //                   } else if (value == 20) {
                              //                     buttonText = '16:15';
                              //                   } else if (value == 21) {
                              //                     buttonText = '16:30';
                              //                   } else if (value == 22) {
                              //                     buttonText = '16:45';
                              //                   } else if (value == 23) {
                              //                     buttonText = '17:00';
                              //                   } else if (value == 24) {
                              //                     buttonText = '17:15';
                              //                   } else if (value == 25) {
                              //                     buttonText = '17:30';
                              //                   } else if (value == 26) {
                              //                     buttonText = '15:45';
                              //                   } else if (value == 27) {
                              //                     buttonText = '18:00';
                              //                   } else if (value == 28) {
                              //                     buttonText = '18:15';
                              //                   } else if (value == 29) {
                              //                     buttonText = '18:30';
                              //                   } else if (value == 30) {
                              //                     buttonText = '18:45';
                              //                   } else if (value == 31) {
                              //                     buttonText = '19:00';
                              //                   } else if (value == 32) {
                              //                     buttonText = '19:15';
                              //                   } else if (value == 33) {
                              //                     buttonText = '19:30';
                              //                   } else if (value == 34) {
                              //                     buttonText = '19:45';
                              //                   } else if (value == 35) {
                              //                     buttonText = '20:00';
                              //                   } else if (value == 36) {
                              //                     buttonText = '20:15';
                              //                   } else if (value == 37) {
                              //                     buttonText = '20:30';
                              //                   } else if (value == 38) {
                              //                     buttonText = '20:45';
                              //                   } else if (value == 39) {
                              //                     buttonText = '20:00';
                              //                   } else if (value == 40) {
                              //                     buttonText = '20:15';
                              //                   } else if (value == 41) {
                              //                     buttonText = '20:30';
                              //                   } else if (value == 42) {
                              //                     buttonText = '20:45';
                              //                   } else if (value == 43) {
                              //                     buttonText = '21:00';
                              //                   } else if (value == 44) {
                              //                     buttonText = '21:15';
                              //                   } else if (value == 45) {
                              //                     buttonText = '21:30';
                              //                   // } else if (value == 46) {
                              //                   //   buttonText = '21:45';
                              //                   // } else if (value == 47) {
                              //                   //   buttonText = '22:00';
                              //                   // } else if (value == 48) {
                              //                   //   buttonText = '22:15';
                              //                   // } else if (value == 49) {
                              //                   //   buttonText = '22:30';
                              //                   // }
                              //                   // else if (value == 50) {
                              //                   //   buttonText = '22:45';
                              //                   // } else if (value == 51) {
                              //                   //   buttonText = '23:00';
                              //                   }
                              //                 });
                              //               },
                              //               itemExtent: 48.0,
                              //               children: const [
                              //                 Text('Please select time'),
                              //                 // Text('10:30'),
                              //                 // Text('10:45'),
                              //                 // Text('11:00'),
                              //                 // Text('11:15'),
                              //                 // Text('11:30'),
                              //                 // Text('11:45'),
                              //                 Text('12:00'),
                              //                 Text('12:15'),
                              //                 Text('12:30'),
                              //                 Text('12:45'),
                              //                 Text('13:00'),
                              //                 Text('12:15'),
                              //                 Text('13:30'),
                              //                 Text('13:45'),
                              //                 Text('14:00'),
                              //                 Text('14:15'),
                              //                 Text('14:30'),
                              //                 Text('14:45'),
                              //                 Text('15:00'),
                              //                 Text('15:15'),
                              //                 Text('15:30'),
                              //                 Text('15:45'),
                              //                 Text('16:00'),
                              //                 Text('16:15'),
                              //                 Text('16:30'),
                              //                 Text('16:45'),
                              //                 Text('17:00'),
                              //                 Text('17:15'),
                              //                 Text('17:30'),
                              //                 Text('17:45'),
                              //                 Text('18:00'),
                              //                 Text('18:15'),
                              //                 Text('18:30'),
                              //                 Text('18:45'),
                              //                 Text('19:00'),
                              //                 Text('19:15'),
                              //                 Text('19:30'),
                              //                 Text('19:45'),
                              //                 Text('20:00'),
                              //                 Text('20:15'),
                              //                 Text('20:30'),
                              //                 Text('20:45'),
                              //                 Text('21:00'),
                              //                 Text('21:15'),
                              //                 Text('21:30'),
                              //                 // Text('21:45'),
                              //                 // Text('22:00'),
                              //                 // Text('22:15'),
                              //                 // Text('22:30'),
                              //                 // Text('22:45'),
                              //                 // Text('23:00'),
                              //               ],
                              //             );
                              //           });
                              //     },
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Align(
                              //           alignment: Alignment.centerLeft,
                              //           child: Text(
                              //             buttonText,
                              //             style: TextStyle(
                              //               fontSize: 15,
                              //               color: Color(0xff000000),
                              //               fontWeight: FontWeight.w600,
                              //               fontFamily: "Montserrat",
                              //             ),
                              //           ),
                              //         ),
                              //         Align(
                              //             alignment: Alignment.centerRight,
                              //             child: Icon(Icons.timer)),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Add note",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: TextFormField(
                                  controller: _note,
                                  decoration: InputDecoration(
                                    // hintText: "optional",
                                    hintStyle:
                                        TextStyle(color: Color(0xFFB5B5B5)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffa75264),
                                        // color: Color(0XFF2173F5),
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black12,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  maxLines: 5,
                                  minLines: 3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Save this remarks for your next order",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      width: 40,
                                      child: Switch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                            plotdata = !plotdata;
                                          });
                                        },
                                        activeTrackColor: Color(0xFFdd3333),
                                        activeColor: Color(0xFFdd3333),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         alignment: Alignment.topLeft,
                              //         child: Text(
                              //           "Save this note for your next order",
                              //           maxLines: 1,
                              //           style: TextStyle(
                              //             fontSize: 11,
                              //             color: Color(0xff000000),
                              //             fontWeight: FontWeight.w600,
                              //             fontFamily: "Montserrat",
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     Expanded(
                              //       child: Container(
                              //         alignment: Alignment.topRight,
                              //         width: 40,
                              //         child: Switch1(),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 30,
                              // ),
                              Container(
                                padding: EdgeInsets.only(left: 2),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Pay with",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
//                       RadioListTile(
//                         value: 1,
//                         groupValue: selectedRadioTile,
//                         title: Text(
//                           "Paypal",
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Color(0xff000000),
//                             fontWeight: FontWeight.w600,
//                             fontFamily: "Montserrat",
//                           ),
//                         ),
//                         onChanged: (value) {
//                           SetselectedRadioTile(value);
//                           payment = false;
//                           paypalpay = true;
//                         },
//                         activeColor: Color(0xffa75264
// ),
//                         secondary: Container(
//                           child: Image.asset(
//                             "images/logo1.png",
//                             width: 60,
//                             height: 60,
//                           ),
//                         ),
//                       ),
                      RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile,
                        title: Text(
                          "Cash",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        onChanged: (value) {
                          SetselectedRadioTile(value);
                          payment = true;
                          paypalpay = false;
                        },
                        secondary: Container(
                          child: Image.asset(
                            "images/logo2.png",
                            width: 56,
                            height: 56,
                          ),
                        ),
                        activeColor: Color(0xffa75264
),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 18, left: 18, top: 10),
                        width: double.infinity,
                        height: 72,
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 12),
                                child: Text(
                                  // "Paying with Paypal is free. You will be redirected to the",
                                  "This restaurant aims to impress you with quality food, ",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF616161),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(left: 12),
                                child: Text(
                                  "fresh ingredients, authentic recipes, a motivated team and impeccable service.",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF616161),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   margin: EdgeInsets.only(left: 12),
                              //   child: Text(
                              //     "complete the Paypal payment for your order.",
                              //     style: TextStyle(
                              //       fontSize: 11,
                              //       color: Color(0xFF616161),
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: "Montserrat",
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 18, left: 18, top: 24),
                        child: TextFormField(
                          controller: _coupon,
                          decoration: InputDecoration(
                            hintText: "Do you have a voucher or a coupon?",
                            hintStyle: TextStyle(color: Color(0xFFB5B5B5)),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0XFF2173F5),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black12,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 18, left: 18, top: 20),
                        width: double.infinity,
                        height: 70,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "By clicking on ORDER and PAY you agree with the contents of",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF616161),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        "the payment method, the data you filled out, our ",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF616161),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat",
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'privacy policy',
                                        style: TextStyle(
                                          color: Color(0xffa75264
),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PrivacyPolicy(),
                                                ));
                                          },
                                      ),
                                      TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                          color: Color(0xFF616161),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'terms of service ',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xffa75264
),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat",
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Terms(),
                                            ));
                                      },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      paypalpay
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 8),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xffa75264)),
                                      // color: Color(0xffa75264),
                                      onPressed: () {
                                        print("hello");

                                        String street = _street.text;
                                        String city = _city.text;

                                        String firstName = _firstName.text;
                                        String lastName = _lastName.text;
                                        String email = _email.text;
                                        String phone = _phone.text;
                                        String note = _note.text;

                                        String paymentsss = "Cash";

                                        if (plotdata == true) {
                                          List<String> data22 = [
                                            street,
                                            city,
                                            firstName,
                                            lastName,
                                            email,
                                            phone,
                                            note
                                          ];
                                          Sharedservice.SaveData(data22);
                                        }
                                        if (firstName == "" ||
                                            lastName == "" ||
                                            email == "" ||
                                            phone == "" ||
                                            street == "" ||
                                            city == "") {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Add your personal data before order.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor:
                                                  Color(0xFF424242),
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }

                                        if (validateAndSav2() == true) {
                                          if (payment == false) {
                                            print("Payment method is Paypal");
                                            paymentsss = "Paypal";
                                          } else if (payment == true) {
                                            print("Payment method is cash");
                                            paymentsss = "Cash";
                                          }

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext
                                                contextshowDialog) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.8),
                                                      spreadRadius: 5,
                                                      blurRadius: 10,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: AlertDialog(
                                                  title: Text(
                                                    "Summary",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily: "Montserrat",
                                                    ),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Color(0xFFEEEEEE),
                                                  content: Text(
                                                    "Street: " +
                                                        street +
                                                        " \nCity: " +
                                                        city +
                                                        " \nPostcode: " +
                                                        selectedItemPstCode
                                                            .name +
                                                        "\nName: " +
                                                        firstName +
                                                        " \nEmail: " +
                                                        email +
                                                        " \nPhone: " +
                                                        phone +
                                                        " \nNote: " +
                                                        note +
                                                        " \nCoupon: " +
                                                        paymentsss +
                                                        "\nDelivery time: " +
                                                        buttonText,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Montserrat",
                                                    ),
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                      child: Text(
                                                        "Modify",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(
                                                                contextshowDialog)
                                                            .pop();
                                                      },
                                                    ),
                                                    ElevatedButton(
                                                      child: Text(
                                                        "Yes",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                        // Scaffold.of(context)
                                                        //     .showSnackBar(snackBar);
                                                        Navigator.pop(
                                                            contextshowDialog);
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                PaypalPayment(
                                                              totalamount:
                                                                  totalAmount,
                                                              userFirstName:
                                                                  _firstName
                                                                      .text,
                                                              userLastName:
                                                                  _lastName
                                                                      .text,
                                                              addressCity: city,
                                                              addressStreet:
                                                                  street,
                                                              addressZipCode:
                                                                  selectedItemPstCode
                                                                      .name,
                                                              addressPhoneNumber:
                                                                  phone,
                                                              companyName:
                                                                  _company.text,
                                                              emailAddress:
                                                                  _email.text,
                                                              customerNote:
                                                                  _note.text,
                                                              selectedRadio:
                                                                  selectedRadioTile,
                                                              ordertype:
                                                                  orderType,
                                                              formatDate: DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(
                                                                      currentDate),
                                                              buttontext:
                                                                  buttonText,
                                                              customerid:
                                                                  customerID,
                                                              onFinish:
                                                                  (number) async {
                                                                // payment done
                                                                print(
                                                                    'order id: ' +
                                                                        number);

                                                                createOrder(
                                                                    basketDataForSearch,
                                                                    _firstName
                                                                        .text,
                                                                    _lastName
                                                                        .text,
                                                                    _company
                                                                        .text,
                                                                    _street
                                                                        .text,
                                                                    _city.text,
                                                                    selectedItemPstCode,
                                                                    _email.text,
                                                                    _phone.text,
                                                                    _note.text,
                                                                    selectedRadioTile,
                                                                    context,
                                                                    // orderType ==
                                                                    //         "Pickup"
                                                                    //     ? "pickup"
                                                                    //     : "delivery",
                                                                    // orderType ==
                                                                    //         "Pickup"
                                                                    //     ? "pickup_date"
                                                                    //     : "delivery_date",
                                                                    // formattedDate = DateFormat(
                                                                    //         'dd-MM-yyyy')
                                                                    //     .format(
                                                                    //         currentDate),
                                                                    // orderType ==
                                                                    //         "Pickup"
                                                                    //     ? "pickup_time"
                                                                    //     : "delivery_time",
                                                                    // buttonText,
                                                                    // customerID,
                                                                    // number);

                                                                    orderType ==
                                                                            "Pickup"
                                                                        "pickup",
                                                                        // : "delivery",
                                                                    orderType ==
                                                                            "Pickup"
                                                                        "pickup_date",
                                                                        // : "delivery_date",
                                                                    formattedDate = DateFormat(
                                                                            'dd-MM-yyyy')
                                                                        .format(
                                                                            currentDate),
                                                                    orderType ==
                                                                            "Pickup"
                                                                         "pickup_time",
                                                                        // : "delivery_time",
                                                                    buttonText,
                                                                    customerID,
                                                                    number);
                                                                countDataForSearch[
                                                                        0]
                                                                    .itemCount = 0;
                                                                basketDataForSearch
                                                                    .clear();
                                                                productItem =
                                                                    null;
                                                                myList = null;
                                                                count = 0;
                                                                countList = 0;
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: FutureBuilder<double>(
                                          future: SharedService.Read(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<double> snapshot) {
                                            switch (snapshot.connectionState) {
                                              case ConnectionState.waiting:
                                                return const CircularProgressIndicator();
                                              default:
                                                if (snapshot.hasError) {
                                                  return Text(
                                                      'Error: ${snapshot.error}');
                                                } else {
                                                  totalAmount = snapshot.data;
                                                  return Container(
                                                    //color: Color(0xffa75264),
                                                    child: Text(
                                                      "Order and pay ${snapshot.data} €",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18.0),
                                                    ),
                                                  );
                                                }
                                            }
                                          })),
                                ),
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xff010101
)),
                                    onPressed: () {
                                      //if login
                                      for (int i = 0;
                                          i < basketDataForSearch.length;
                                          i++) {
                                        print(
                                            basketDataForSearch[i].productName);
                                        print(basketDataForSearch[i]
                                            .itemIndexCount);
                                        print(basketDataForSearch[i].productId);
                                      }

                                      //print(data.basketData);
                                      print("hello 1");

                                      String street = _street.text;
                                      String city = _city.text;

                                      String firstName = _firstName.text;
                                      String lastName = _lastName.text;

                                      String email = _email.text;
                                      String phone = _phone.text;
                                      String note = _note.text;

                                      String paymentsss = "Cash";

                                      if (plotdata == true) {
                                        List<String> data22 = [
                                          street,
                                          city,
                                          firstName,
                                          lastName,
                                          email,
                                          phone,
                                          note
                                        ];
                                        Sharedservice.SaveData(data22);
                                      }
                                      if (firstName == "" ||
                                          lastName == "" ||
                                          email == "" ||
                                          phone == "" ||
                                          street == "" ||
                                          city == "") {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Add your personal data before order.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Color(0xFF424242),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }

                                      if (validateAndSav2() == true) {
                                        if (payment == false) {
                                          print("Payment method is Paypal");
                                          paymentsss = "Paypal";
                                        } else if (payment == true) {
                                          print("Payment method is cash");
                                          paymentsss = "Cash";
                                        }

                                        showDialog(
                                          context: context,
                                          builder:
                                              (BuildContext contextshowDialog) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.8),
                                                    spreadRadius: 5,
                                                    blurRadius: 10,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: AlertDialog(
                                                title: Text(
                                                  "Summary",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily: "Montserrat",
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                elevation: 0,
                                                backgroundColor: Colors.white,
                                                content: Text(
                                                  "Street: " +
                                                      street +
                                                      " \nCity: " +
                                                      city +
                                                      " \nPostcode: " +
                                                      selectedItemPstCode.name +
                                                      "\nName: " +
                                                      firstName +
                                                      " \nEmail: " +
                                                      email +
                                                      " \nPhone: " +
                                                      phone +
                                                      " \nNote: " +
                                                      note +
                                                      "\nPayment method: " +
                                                      paymentsss +
                                                      "\nDelivery time: " +
                                                      buttonText,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Montserrat",
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: Color(
                                                                0xff010101
)),
                                                    child: Text(
                                                      "Modify",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(
                                                              contextshowDialog)
                                                          .pop();
                                                    },
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: Color(
                                                                0xff010101
)),
                                                    child: Text(
                                                      "Yes",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      //     var splitName = name.split(" ");
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);

                                                      Navigator.pop(
                                                          contextshowDialog);
                                                      createOrder(
                                                          basketDataForSearch,
                                                          _firstName.text,
                                                          _lastName.text,
                                                          _company.text,
                                                          _street.text,
                                                          _city.text,
                                                          selectedItemPstCode,
                                                          _email.text,
                                                          _phone.text,
                                                          _note.text,
                                                          selectedRadioTile,
                                                          context,
                                                          orderType == "Pickup"
                                                              ? "pickup"
                                                              : "delivery",
                                                          orderType == "Pickup"
                                                              ? "pickup_date"
                                                              : "delivery_date",
                                                          formattedDate = DateFormat(
                                                                  'dd-MM-yyyy')
                                                              .format(
                                                                  currentDate),
                                                          orderType == "Pickup"
                                                              ? "pickup_time"
                                                              : "delivery_time",
                                                          buttonText,
                                                          customerID,
                                                          null);
                                                      countDataForSearch[0]
                                                          .itemCount = 0;
                                                      basketDataForSearch
                                                          .clear();
                                                      productItem = null;
                                                      myList = null;
                                                      count = 0;
                                                      countList = 0;
                                                      // Navigator.push(
                                                      //   context,
                                                      //   MaterialPageRoute(
                                                      //       builder: (context) => ConfPayment()),
                                                      // );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: FutureBuilder<double>(
                                        future: SharedService.Read(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<double> snapshot) {
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.waiting:
                                              return const CircularProgressIndicator();
                                            default:
                                              if (snapshot.hasError) {
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else {
                                                totalAmount = snapshot.data;
                                                return Container(
                                                  child: Text(
                                                    "Order and pay ${snapshot.data} €",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.0),
                                                  ),
                                                );
                                              }
                                          }
                                        })),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Form(
                key: globalKey2,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 18, left: 18, top: 10),
                      padding: EdgeInsets.only(top: 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: Text(
                                    "Do you have an account?",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat",
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 37,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      padding: const EdgeInsets.all(0.0),
                                    ),

                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Login(),
                                        ),
                                      );
                                    },
                                    // color: Colors.white,
                                    // padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      height: 55,
                                      width: 145,
                                      decoration: const BoxDecoration(),
                                      child: Center(
                                        child: Text('Sign In',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xffa75264
),
                                              fontWeight: FontWeight.w700,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 40,
                              color: Colors.grey,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Order type",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ToggleSwitch(
                                  initialLabelIndex: selectedValue2,
                                  inactiveBgColor: Colors.white,
                                  totalSwitches: 1,
                                  // labels: ['Pickup', 'Delivery'],
                                  labels: ['Pickup'],
                                  activeBgColors: [
                                    [Color(0xff010101
)],
                                    [Color(0xff010101
)]
                                  ],
                                  onToggle: (int value2) {
                                    setState(() {
                                      selectedValue2 = value2;
                                      if (value2 == 0) {
                                        orderType = 'Pickup';
                                      } else if (value2 == 1) {
                                        orderType = 'Delivery';
                                      }
                                    });
                                    initialIndex = value2;
                                  },
                                ),
                              ],
                            ),
                            // Container(
                            //   width: double.infinity,
                            //   height: 55,
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       primary: Colors.white,
                            //     ),
                            //     onPressed: () {
                            //       showModalBottomSheet(
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return CupertinoPicker(
                            //               backgroundColor: Color(0xFFEEEEEE),
                            //               onSelectedItemChanged: (int value2) {
                            //                 setState(() {
                            //                   selectedValue2 = value2;
                            //                   if (value2 == 0) {
                            //                     orderType = 'Pickup';
                            //                   } else if (value2 == 1) {
                            //                     orderType = 'Delivery';
                            //                   }
                            //                 });
                            //               },
                            //               itemExtent: 35.0,
                            //               children: const [
                            //                Text('Pickup'),
                            //                 Text('Delivery'),
                            //               ],
                            //             );
                            //           });
                            //     },
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Align(
                            //           alignment: Alignment.centerLeft,
                            //           child: Text(
                            //             orderType,
                            //             style: TextStyle(
                            //               fontSize: 15,
                            //               color: Color(0xff000000),
                            //               fontWeight: FontWeight.w600,
                            //               fontFamily: "Montserrat",
                            //             ),
                            //           ),
                            //         ),
                            //         Align(
                            //             alignment: Alignment.centerRight,
                            //             child: Icon(
                            //                 Icons.arrow_forward_ios_outlined)),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                orderType == "Pickup"
                                    ? "Pickup date"
                                    : "Delivery date",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                  // color: Colors.white,
                                  onPressed: () {
                                    CupertinoRoundedDatePicker.show(
                                      context,
                                      fontFamily: "Montserrat",
                                      initialDatePickerMode:
                                          CupertinoDatePickerMode.date,
                                      minimumYear: 2021,
                                      maximumYear: 2045,
                                      onDateTimeChanged: (dateTime) {
                                        setState(() {
                                          currentDate = dateTime;
                                        });
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          formatDate,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(Icons.date_range)),
                                    ],
                                  ),
                                )),

                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                orderType == "Pickup"
                                    ? "Pickup time"
                                    : "Delivery time",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                ),
                                // color: Colors.white,
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CupertinoPicker(
                                          backgroundColor: Color(0xFFEEEEEE),
                                          onSelectedItemChanged: (int value) {
                                            setState(() {
                                              selectedValue = value;
                                              if (value == 0) {
                                                buttonText =
                                                    'Please select time';
                                                // } else if (value == 1) {
                                                //   buttonText = '10:30';
                                                // } else if (value == 2) {
                                                //   buttonText = '10:45';
                                                // } else if (value == 3) {
                                                //   buttonText = '11:00';
                                                // } else if (value == 4) {
                                                //   buttonText = '11:15';
                                                // } else if (value == 5) {
                                                //   buttonText = '11:30';
                                                // } else if (value == 6) {
                                                //   buttonText = '11:45';
                                              } else if (value == 7) {
                                                buttonText = '12:00';
                                              } else if (value == 8) {
                                                buttonText = '12:15';
                                              } else if (value == 9) {
                                                buttonText = '12:30';
                                              } else if (value == 10) {
                                                buttonText = '12:45';
                                              } else if (value == 11) {
                                                buttonText = '13:00';
                                              } else if (value == 12) {
                                                buttonText = '13:15';
                                              } else if (value == 13) {
                                                buttonText = '13:30';
                                              } else if (value == 14) {
                                                buttonText = '13:45';
                                              } else if (value == 15) {
                                                buttonText = '14:00';
                                              } else if (value == 16) {
                                                buttonText = '14:15';
                                              } else if (value == 17) {
                                                buttonText = '14:30';
                                              } else if (value == 18) {
                                                buttonText = '14:45';
                                              } else if (value == 19) {
                                                buttonText = '15:00';
                                              } else if (value == 20) {
                                                buttonText = '15:15';
                                              } else if (value == 21) {
                                                buttonText = '15:30';
                                              } else if (value == 22) {
                                                buttonText = '15:45';
                                              } else if (value == 23) {
                                                buttonText = '16:00';
                                              } else if (value == 24) {
                                                buttonText = '16:15';
                                              } else if (value == 25) {
                                                buttonText = '16:30';
                                              } else if (value == 26) {
                                                buttonText = '16:45';
                                              } else if (value == 27) {
                                                buttonText = '17:00';
                                              } else if (value == 28) {
                                                buttonText = '17:15';
                                              } else if (value == 29) {
                                                buttonText = '17:30';
                                              } else if (value == 30) {
                                                buttonText = '15:45';
                                              } else if (value == 31) {
                                                buttonText = '18:00';
                                              } else if (value == 32) {
                                                buttonText = '18:15';
                                              } else if (value == 33) {
                                                buttonText = '18:30';
                                              } else if (value == 34) {
                                                buttonText = '18:45';
                                              } else if (value == 35) {
                                                buttonText = '19:00';
                                              } else if (value == 36) {
                                                buttonText = '19:15';
                                              } else if (value == 37) {
                                                buttonText = '19:30';
                                              } else if (value == 38) {
                                                buttonText = '19:45';
                                              } else if (value == 39) {
                                                buttonText = '20:00';
                                              } else if (value == 40) {
                                                buttonText = '20:15';
                                              } else if (value == 41) {
                                                buttonText = '20:30';
                                              } else if (value == 42) {
                                                buttonText = '20:45';
                                              } else if (value == 39) {
                                                buttonText = '20:00';
                                              } else if (value == 40) {
                                                buttonText = '20:15';
                                              } else if (value == 41) {
                                                buttonText = '20:30';
                                              } else if (value == 42) {
                                                buttonText = '20:45';
                                              } else if (value == 43) {
                                                buttonText = '21:00';
                                              } else if (value == 44) {
                                                buttonText = '21:15';
                                              } else if (value == 45) {
                                                buttonText = '21:30';
                                                // } else if (value == 46) {
                                                //   buttonText = '21:45';
                                                // } else if (value == 47) {
                                                //   buttonText = '22:00';
                                                // } else if (value == 48) {
                                                //   buttonText = '22:15';
                                                // } else if (value == 49) {
                                                //   buttonText = '22:30';
                                                // } else if (value == 50) {
                                                //   buttonText = '22:45';
                                                // } else if (value == 51) {
                                                //   buttonText = '23:00';
                                              }
                                            });
                                          },
                                          itemExtent: 48.0,
                                          children: const [
                                            Text(' Please select time'),
                                            // Text('10:30'),
                                            // Text('10:45'),
                                            // Text('11:00'),
                                            // Text('11:15'),
                                            // Text('11:30'),
                                            // Text('11:45'),
                                            Text('12:00'),
                                            Text('12:15'),
                                            Text('12:30'),
                                            Text('12:45'),
                                            Text('13:00'),
                                            Text('12:15'),
                                            Text('13:30'),
                                            Text('13:45'),
                                            Text('14:00'),
                                            Text('14:15'),
                                            Text('14:30'),
                                            Text('14:45'),
                                            Text('15:00'),
                                            Text('15:15'),
                                            Text('15:30'),
                                            Text('15:45'),
                                            Text('16:00'),
                                            Text('16:15'),
                                            Text('16:30'),
                                            Text('16:45'),
                                            Text('17:00'),
                                            Text('17:15'),
                                            Text('17:30'),
                                            Text('17:45'),
                                            Text('18:00'),
                                            Text('18:15'),
                                            Text('18:30'),
                                            Text('18:45'),
                                            Text('19:00'),
                                            Text('19:15'),
                                            Text('19:30'),
                                            Text('19:45'),
                                            Text('20:00'),
                                            Text('20:15'),
                                            Text('20:30'),
                                            Text('20:45'),
                                            Text('21:00'),
                                            Text('21:15'),
                                            Text('21:30'),
                                            // Text('21:45'),
                                            // Text('22:00'),
                                            // Text('22:15'),
                                            // Text('22:30'),
                                            // Text('22:45'),
                                            // Text('23:00'),
                                          ],
                                        );
                                      });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        buttonText,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff000000),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Montserrat",
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.timer))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                // "Delivery address",
                                 "Address",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Street and house number",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              // validator: (value) {
                              //   if (value.toString().isEmpty) {
                              //     return "Please enter your street and your house number.";
                              //   }
                              //   if (!value.toString().isValidStreet()) {
                              //     return "Please enter your number.";
                              //   }
                              //   return null;
                              // },
                              autovalidate: validate2,
                              controller: _street,
                              decoration: InputDecoration(
                                //  hintText: "kirchstraße 29",
                                hintStyle: TextStyle(color: Color(0xFFB5B5B5)),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    // color: Color(0XFF2173F5),
                                    color: Color(0xffa75264),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "City",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Please enter your city.";
                                }
                                return null;
                              },
                              autovalidate: validate2,
                              controller: _city,
                              decoration: InputDecoration(
                                //  hintText: "Berlin",
                                hintStyle: TextStyle(color: Color(0xFFB5B5B5)),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffa75264),
                                    // color: Color(0XFF2173F5),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            // Container(
                            //   padding: EdgeInsets.only(left: 2),
                            //   alignment: Alignment.topLeft,
                            //   child: Text(
                            //     "Company name",
                            //     style: TextStyle(
                            //       fontSize: 15,
                            //       color: Color(0xff000000),
                            //       fontWeight: FontWeight.w600,
                            //       fontFamily: "Montserrat",
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(height: 10),
                            // TextFormField(
                            //   validator: (value) {
                            //     return null;
                            //   },

                            //   autovalidate: validate2,
                            //   decoration: InputDecoration(
                            //     hintText: "Helps the courier to find you please.",
                            //     hintStyle:
                            //     TextStyle(color: Color(0xFFB5B5B5)),
                            //     filled: true,
                            //     fillColor: Colors.white,
                            //     focusedBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Color(0XFF2173F5),
                            //         width: 1,
                            //       ),
                            //     ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: Colors.black12,
                            //         width: 1,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(height: 20),
                            // Container(
                            //   padding: EdgeInsets.only(left: 2),
                            //   alignment: Alignment.topLeft,
                            //   child: Text(
                            //     "Add note for delivery",
                            //     style: TextStyle(
                            //       fontSize: 15,
                            //       color: Color(0xff000000),
                            //       fontWeight: FontWeight.w600,
                            //       fontFamily: "Montserrat",
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //   child: TextFormField(
                            //     controller: _note,
                            //     decoration: InputDecoration(
                            //       hintText: "e.g. I live on 3rd floor, straight up the hall. ",
                            //       hintStyle:
                            //       TextStyle(color: Color(0xFFB5B5B5)),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //       focusedBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //           color: Color(0XFF2173F5),
                            //           width: 1,
                            //         ),
                            //       ),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //           color: Colors.black12,
                            //           width: 1,
                            //         ),
                            //       ),
                            //     ),
                            //     maxLines: 5,
                            //     minLines: 3,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Container(
                            //         alignment: Alignment.topLeft,
                            //         child: Text(
                            //           "Save this remarks for your next order",
                            //           maxLines: 1,
                            //           style: TextStyle(
                            //             fontSize: 11,
                            //             color: Color(0xff000000),
                            //             fontWeight: FontWeight.w600,
                            //             fontFamily: "Montserrat",
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         alignment: Alignment.topRight,
                            //         width: 40,
                            //         child: SwitchAddress(),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 25,
                            // ),
                            Divider(
                              height: 40,
                              color: Colors.grey,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Personal details",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "First name",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Please enter your first name.";
                                }
                                return null;
                              },
                              autovalidate: validate2,
                              controller: _firstName,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffa75264),
                                    // color: Color(0XFF2173F5),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Last name",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Please enter your last name.";
                                }
                                return null;
                              },
                              autovalidate: validate2,
                              controller: _lastName,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffa75264),
                                    // color: Color(0XFF2173F5),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email address",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Please enter your Email address.";
                                }
                                if (value.isNotEmpty &&
                                    !value.toString().isValidEmail()) {
                                  return "Please enter valid email.";
                                }
                                return null;
                              },
                              autovalidate: validate2,
                              controller: _email,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffa75264),
                                    // color: Color(0XFF2173F5),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Phone number",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Please enter your phone number.";
                                }
                                if (value.isNotEmpty &&
                                    !value.toString().isValidNumber()) {
                                  return "Please enter a valid number.";
                                }
                                return null;
                              },
                              autovalidate: validate2,
                              controller: _phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffa75264),
                                    // color: Color(0XFF2173F5),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "When placing an order, you will receive a confirmation, Food",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF9C9897),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Tracker status messages and a request to review the",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF9C9897),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "restaurant via email or otherwise (such as push messages).",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF9C9897),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            // SizedBox(height: 14),
                            // Row(
                            //   children: [
                            //     Column(
                            //       children: [
                            //         Container(
                            //           alignment: Alignment.topLeft,
                            //           padding: EdgeInsets.only(right: 27),
                            //           child: Text(
                            //             "Receive discounts, loyalty offers and other",
                            //             style: TextStyle(
                            //               fontSize: 11,
                            //               color: Color(0xff000000),
                            //               fontWeight: FontWeight.w600,
                            //               fontFamily: "Montserrat",
                            //             ),
                            //           ),
                            //         ),
                            //         SizedBox(height: 3),
                            //         Container(
                            //           padding: EdgeInsets.only(right: 210),
                            //           child: Text(
                            //             "updates.",
                            //             style: TextStyle(
                            //               fontSize: 11,
                            //               color: Color(0xff000000),
                            //               fontWeight: FontWeight.w600,
                            //               fontFamily: "Montserrat",
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //           alignment: Alignment.topRight,
                            //           width: 40,
                            //           child: Switch2()),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Company name",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _company,
                              decoration: InputDecoration(
                                // hintText: "optional",
                                // hintStyle: TextStyle(color: Color(0xFFB5B5B5)),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffa75264),
                                    // color: Color(0XFF2173F5),
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(left: 2),
                            //   alignment: Alignment.topLeft,
                            //   child: Text(
                            //     "Order type",
                            //     style: TextStyle(
                            //       fontSize: 15,
                            //       color: Color(0xff000000),
                            //       fontWeight: FontWeight.w600,
                            //       fontFamily: "Montserrat",
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),

                            // Container(
                            //   width: double.infinity,
                            //   height: 55,
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       primary: Colors.white,
                            //     ),
                            //     onPressed: () {
                            //       showModalBottomSheet(
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return CupertinoPicker(
                            //               backgroundColor: Color(0xFFEEEEEE),
                            //               onSelectedItemChanged: (int value2) {
                            //                 setState(() {
                            //                   selectedValue2 = value2;
                            //                   if (value2 == 0) {
                            //                     orderType = 'Pickup';
                            //                   } else if (value2 == 1) {
                            //                     orderType = 'Delivery';
                            //                   }
                            //                 });
                            //               },
                            //               itemExtent: 35.0,
                            //               children: const [
                            //                 Text('Pickup'),
                            //                 Text('Delivery'),
                            //               ],
                            //             );
                            //           });
                            //     },
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Align(
                            //           alignment: Alignment.centerLeft,
                            //           child: Text(
                            //             orderType,
                            //             style: TextStyle(
                            //               fontSize: 15,
                            //               color: Color(0xff000000),
                            //               fontWeight: FontWeight.w600,
                            //               fontFamily: "Montserrat",
                            //             ),
                            //           ),
                            //         ),
                            //         Align(
                            //             alignment: Alignment.centerRight,
                            //             child: Icon(
                            //                 Icons.arrow_forward_ios_outlined)),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            // SizedBox(
                            //   height: 20,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(left: 2),
                            //   alignment: Alignment.topLeft,
                            //   child: Text(
                            //     orderType == "Pickup"
                            //         ? "Pickup date"
                            //         : "Delivery date",
                            //     style: TextStyle(
                            //       fontSize: 15,
                            //       color: Color(0xff000000),
                            //       fontWeight: FontWeight.w600,
                            //       fontFamily: "Montserrat",
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //     width: double.infinity,
                            //     height: 55,
                            //     child: ElevatedButton(
                            //       style: ElevatedButton.styleFrom(
                            //         primary: Colors.white,
                            //       ),
                            //       // color: Colors.white,
                            //       onPressed: () {
                            //         CupertinoRoundedDatePicker.show(
                            //           context,
                            //           fontFamily: "Montserrat",
                            //           initialDatePickerMode:
                            //               CupertinoDatePickerMode.date,
                            //           minimumYear: 2021,
                            //           maximumYear: 2045,
                            //           onDateTimeChanged: (dateTime) {
                            //             setState(() {
                            //               currentDate = dateTime;
                            //             });
                            //           },
                            //         );
                            //       },
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Align(
                            //             alignment: Alignment.centerLeft,
                            //             child: Text(
                            //               formatDate,
                            //               style: TextStyle(
                            //                 fontSize: 15,
                            //                 color: Color(0xff000000),
                            //                 fontWeight: FontWeight.w600,
                            //                 fontFamily: "Montserrat",
                            //               ),
                            //             ),
                            //           ),
                            //           Align(
                            //               alignment: Alignment.centerRight,
                            //               child: Icon(Icons.date_range)),
                            //         ],
                            //       ),
                            //     )),

                            // SizedBox(
                            //   height: 20,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(left: 2),
                            //   alignment: Alignment.topLeft,
                            //   child: Text(
                            //     orderType == "Pickup"
                            //         ? "Pickup time"
                            //         : "Delivery time",
                            //     style: TextStyle(
                            //       fontSize: 15,
                            //       color: Color(0xff000000),
                            //       fontWeight: FontWeight.w600,
                            //       fontFamily: "Montserrat",
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //   width: double.infinity,
                            //   height: 55,
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       primary: Colors.white,
                            //     ),
                            //     // color: Colors.white,
                            //     onPressed: () {
                            //       showModalBottomSheet(
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return CupertinoPicker(
                            //               backgroundColor: Color(0xFFEEEEEE),
                            //               onSelectedItemChanged: (int value) {
                            //                 setState(() {
                            //                   selectedValue = value;
                            //                   if (value == 0) {
                            //                     buttonText =
                            //                         'As soon as possible';
                            //                   } else if (value == 1) {
                            //                     buttonText = '10:30';
                            //                   } else if (value == 2) {
                            //                     buttonText = '10:45';
                            //                   } else if (value == 3) {
                            //                     buttonText = '11:00';
                            //                   } else if (value == 4) {
                            //                     buttonText = '11:15';
                            //                   } else if (value == 5) {
                            //                     buttonText = '11:30';
                            //                   } else if (value == 6) {
                            //                     buttonText = '11:45';
                            //                   } else if (value == 7) {
                            //                     buttonText = '12:00';
                            //                   } else if (value == 8) {
                            //                     buttonText = '12:15';
                            //                   } else if (value == 9) {
                            //                     buttonText = '12:30';
                            //                   } else if (value == 10) {
                            //                     buttonText = '12:45';
                            //                   } else if (value == 11) {
                            //                     buttonText = '13:00';
                            //                   } else if (value == 12) {
                            //                     buttonText = '13:15';
                            //                   } else if (value == 13) {
                            //                     buttonText = '13:30';
                            //                   } else if (value == 14) {
                            //                     buttonText = '13:45';
                            //                   } else if (value == 15) {
                            //                     buttonText = '14:00';
                            //                   } else if (value == 16) {
                            //                     buttonText = '14:15';
                            //                   } else if (value == 17) {
                            //                     buttonText = '14:30';
                            //                   } else if (value == 18) {
                            //                     buttonText = '14:45';
                            //                   } else if (value == 19) {
                            //                     buttonText = '15:00';
                            //                   } else if (value == 20) {
                            //                     buttonText = '15:15';
                            //                   } else if (value == 21) {
                            //                     buttonText = '15:30';
                            //                   } else if (value == 22) {
                            //                     buttonText = '15:45';
                            //                   } else if (value == 23) {
                            //                     buttonText = '16:00';
                            //                   } else if (value == 24) {
                            //                     buttonText = '16:15';
                            //                   } else if (value == 25) {
                            //                     buttonText = '16:30';
                            //                   } else if (value == 26) {
                            //                     buttonText = '16:45';
                            //                   } else if (value == 27) {
                            //                     buttonText = '17:00';
                            //                   } else if (value == 28) {
                            //                     buttonText = '17:15';
                            //                   } else if (value == 29) {
                            //                     buttonText = '17:30';
                            //                   } else if (value == 30) {
                            //                     buttonText = '15:45';
                            //                   } else if (value == 31) {
                            //                     buttonText = '18:00';
                            //                   } else if (value == 32) {
                            //                     buttonText = '18:15';
                            //                   } else if (value == 33) {
                            //                     buttonText = '18:30';
                            //                   } else if (value == 34) {
                            //                     buttonText = '18:45';
                            //                   } else if (value == 35) {
                            //                     buttonText = '19:00';
                            //                   } else if (value == 36) {
                            //                     buttonText = '19:15';
                            //                   } else if (value == 37) {
                            //                     buttonText = '19:30';
                            //                   } else if (value == 38) {
                            //                     buttonText = '19:45';
                            //                   } else if (value == 39) {
                            //                     buttonText = '20:00';
                            //                   } else if (value == 40) {
                            //                     buttonText = '20:15';
                            //                   } else if (value == 41) {
                            //                     buttonText = '20:30';
                            //                   } else if (value == 42) {
                            //                     buttonText = '20:45';
                            //                   } else if (value == 39) {
                            //                     buttonText = '20:00';
                            //                   } else if (value == 40) {
                            //                     buttonText = '20:15';
                            //                   } else if (value == 41) {
                            //                     buttonText = '20:30';
                            //                   } else if (value == 42) {
                            //                     buttonText = '20:45';
                            //                   } else if (value == 43) {
                            //                     buttonText = '21:00';
                            //                   } else if (value == 44) {
                            //                     buttonText = '21:15';
                            //                   } else if (value == 45) {
                            //                     buttonText = '21:30';
                            //                   } else if (value == 46) {
                            //                     buttonText = '21:45';
                            //                   } else if (value == 47) {
                            //                     buttonText = '22:00';
                            //                   } else if (value == 48) {
                            //                     buttonText = '22:15';
                            //                   } else if (value == 49) {
                            //                     buttonText = '22:30';
                            //                   } else if (value == 50) {
                            //                     buttonText = '22:45';
                            //                   } else if (value == 51) {
                            //                     buttonText = '23:00';
                            //                   }
                            //                 });
                            //               },
                            //               itemExtent: 48.0,
                            //               children: const [
                            //                 Text('As soon as possible'),
                            //                 Text('10:30'),
                            //                 Text('10:45'),
                            //                 Text('11:00'),
                            //                 Text('11:15'),
                            //                 Text('11:30'),
                            //                 Text('11:45'),
                            //                 Text('12:00'),
                            //                 Text('12:15'),
                            //                 Text('12:30'),
                            //                 Text('12:45'),
                            //                 Text('13:00'),
                            //                 Text('12:15'),
                            //                 Text('13:30'),
                            //                 Text('13:45'),
                            //                 Text('14:00'),
                            //                 Text('14:15'),
                            //                 Text('14:30'),
                            //                 Text('14:45'),
                            //                 Text('15:00'),
                            //                 Text('15:15'),
                            //                 Text('15:30'),
                            //                 Text('15:45'),
                            //                 Text('16:00'),
                            //                 Text('16:15'),
                            //                 Text('16:30'),
                            //                 Text('16:45'),
                            //                 Text('17:00'),
                            //                 Text('17:15'),
                            //                 Text('17:30'),
                            //                 Text('17:45'),
                            //                 Text('18:00'),
                            //                 Text('18:15'),
                            //                 Text('18:30'),
                            //                 Text('18:45'),
                            //                 Text('19:00'),
                            //                 Text('19:15'),
                            //                 Text('19:30'),
                            //                 Text('19:45'),
                            //                 Text('20:00'),
                            //                 Text('20:15'),
                            //                 Text('20:30'),
                            //                 Text('20:45'),
                            //                 Text('21:00'),
                            //                 Text('21:15'),
                            //                 Text('21:30'),
                            //                 Text('21:45'),
                            //                 Text('22:00'),
                            //                 Text('22:15'),
                            //                 Text('22:30'),
                            //                 Text('22:45'),
                            //                 Text('23:00'),
                            //               ],
                            //             );
                            //           });
                            //     },
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Align(
                            //           alignment: Alignment.centerLeft,
                            //           child: Text(
                            //             buttonText,
                            //             style: TextStyle(
                            //               fontSize: 15,
                            //               color: Color(0xff000000),
                            //               fontWeight: FontWeight.w600,
                            //               fontFamily: "Montserrat",
                            //             ),
                            //           ),
                            //         ),
                            //         Align(
                            //             alignment: Alignment.centerRight,
                            //             child: Icon(Icons.timer))
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                // "Add note for delivery",
                                 "Add note",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: TextFormField(
                                controller: _note,
                                decoration: InputDecoration(
                                  //  hintText: "optional",
                                  hintStyle:
                                      TextStyle(color: Color(0xFFB5B5B5)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffa75264),
                                      // color: Color(0XFF2173F5),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                maxLines: 5,
                                minLines: 3,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Save this remarks for your next order",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    width: 40,
                                    child: Switch(
                                      value: isSwitched,
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitched = value;
                                          plotdata = !plotdata;
                                        });
                                      },
                                      activeTrackColor: Color(0xffa75264
),
                                      activeColor: Color(0xffa75264
),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Container(
                            //         alignment: Alignment.topLeft,
                            //         child: Text(
                            //           "Save this note for your next order",
                            //           maxLines: 1,
                            //           style: TextStyle(
                            //             fontSize: 11,
                            //             color: Color(0xff000000),
                            //             fontWeight: FontWeight.w600,
                            //             fontFamily: "Montserrat",
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         alignment: Alignment.topRight,
                            //         width: 40,
                            //         child: Switch1(),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 30,
                            // ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Pay with",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // RadioListTile(
                    //   value: 1,
                    //   groupValue: selectedRadioTile,
                    //   title: Text(
                    //     "Paypal",
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //       color: Color(0xff000000),
                    //       fontWeight: FontWeight.w600,
                    //       fontFamily: "Montserrat",
                    //     ),
                    //   ),
                    //   onChanged: (value) {
                    //     SetselectedRadioTile(value);
                    //     payment = false;
                    //     paypalpay = true;
                    //   },
                    //   activeColor: Color(0xffa75264),
                    //   secondary: Container(
                    //     child: Image.asset(
                    //       "images/logo1.png",
                    //       width: 60,
                    //       height: 60,
                    //     ),
                    //   ),
                    // ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile,
                      title: Text(
                        "Cash",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      onChanged: (value) {
                        SetselectedRadioTile(value);
                        payment = true;
                        paypalpay = false;
                      },
                      secondary: Container(
                        child: Image.asset(
                          "images/logo2.png",
                          width: 56,
                          height: 56,
                        ),
                      ),
                      activeColor: Color(0xffa75264),
                    ),
                    // SizedBox(
                    //   height: 18,
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(right: 18, left: 18, top: 10),
                    //   width: double.infinity,
                    //   height: 72,
                    //   color: Colors.white,
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    //       children: [
                    //         // SizedBox(
                    //         //   height: 10,
                    //         // ),
                    //         // Container(
                    //         //   alignment: Alignment.topLeft,
                    //         //   margin: EdgeInsets.only(left: 12),
                    //         //   child: Text(
                    //         //     "Paying with Paypal is free. You will be redirected to the",
                    //         //     style: TextStyle(
                    //         //       fontSize: 11,
                    //         //       color: Color(0xFF616161),
                    //         //       fontWeight: FontWeight.w600,
                    //         //       fontFamily: "Montserrat",
                    //         //     ),
                    //         //   ),
                    //         // ),
                    //         // SizedBox(
                    //         //   height: 3,
                    //         // ),
                    //         // Container(
                    //         //   alignment: Alignment.topLeft,
                    //         //   margin: EdgeInsets.only(left: 12),
                    //         //   child: Text(
                    //         //     "secure (SSL) pages of Paypal. Here you will be able to",
                    //         //     style: TextStyle(
                    //         //       fontSize: 11,
                    //         //       color: Color(0xFF616161),
                    //         //       fontWeight: FontWeight.w600,
                    //         //       fontFamily: "Montserrat",
                    //         //     ),
                    //         //   ),
                    //         // ),
                    //         // SizedBox(
                    //         //   height: 3,
                    //         // ),
                    //         // Container(
                    //         //   alignment: Alignment.topLeft,
                    //         //   margin: EdgeInsets.only(left: 12),
                    //         //   child: Text(
                    //         //     "complete the Paypal payment for your order.",
                    //         //     style: TextStyle(
                    //         //       fontSize: 11,
                    //         //       color: Color(0xFF616161),
                    //         //       fontWeight: FontWeight.w600,
                    //         //       fontFamily: "Montserrat",
                    //         //     ),
                    //         //   ),
                    //         // ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(right: 18, left: 18, top: 24),
                    //   child: TextFormField(
                    //     controller: _coupon,
                    //     decoration: InputDecoration(
                    //       hintText: "Do you have a voucher or a coupon?",
                    //       hintStyle: TextStyle(color: Color(0xFFB5B5B5)),
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: Color(0XFF2173F5),
                    //           width: 1,
                    //         ),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: Colors.black12,
                    //           width: 1,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(right: 18, left: 18, top: 20),
                      width: double.infinity,
                      height: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "By clicking on ORDER and PAY you agree with the contents of",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF616161),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      "the payment method, the data you filled out, our ",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF616161),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'privacy policy',
                                      style: TextStyle(
                                        color: Color(0xffa75264),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PrivacyPolicy(),
                                              ));
                                        },
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: TextStyle(
                                        color: Color(0xFF616161),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: 'terms of service ',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xffa75264),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Terms(),
                                          ));
                                    },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    paypalpay
                        ? Container(
                            width: double.infinity,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffa75264
),
                                  ),
                                  // color: Color(0XFF2173F5),
                                  onPressed: () {
                                    print("hello 3");
                                    String street = _street.text;
                                    String city = _city.text;

                                    String firstName = _firstName.text;
                                    String lastName = _lastName.text;
                                    String email = _email.text;
                                    String phone = _phone.text;
                                    String note = _note.text;

                                    String paymentsss = "Cash";
                                    if (plotdata == true) {
                                      List<String> data22 = [
                                        street,
                                        city,
                                        firstName,
                                        lastName,
                                        email,
                                        phone,
                                        note
                                      ];
                                      Sharedservice.SaveData(data22);
                                    }
                                    if (firstName == "" ||
                                        lastName == "" ||
                                        email == "" ||
                                        phone == "" ||
                                        street == "" ||
                                        city == "") {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Add your personal data before order.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Color(0xFF424242),
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }

                                    if (validateAndSav2() == true) {
                                      if (payment == false) {
                                        print("Payment method is Paypal");
                                        paymentsss = "Paypal";
                                      } else if (payment == true) {
                                        print("Payment method is cash");
                                        paymentsss = "Cash";
                                      }

                                      showDialog(
                                        context: context,
                                        builder:
                                            (BuildContext contextshowDialog) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.8),
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: AlertDialog(
                                              title: Text(
                                                "Summary",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: "Montserrat",
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              elevation: 0,
                                              backgroundColor:
                                                  Color(0xFFEEEEEE),
                                              content: Text(
                                                "Street: " +
                                                    street +
                                                    " \nCity: " +
                                                    city +
                                                    " \nPostcode: " +
                                                    selectedItemPstCode.name +
                                                    "\nName: " +
                                                    firstName +
                                                    " \nEmail: " +
                                                    email +
                                                    " \nPhone: " +
                                                    phone +
                                                    " \nNote: " +
                                                    note +
                                                    "\nPayment method: " +
                                                    paymentsss +
                                                    "\nDelivery time: " +
                                                    buttonText,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Montserrat",
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Color(
                                                              0xff902326)),
                                                  child: Text(
                                                    "Modify",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(
                                                            contextshowDialog)
                                                        .pop();
                                                  },
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Color(
                                                              0xff902326)),
                                                  child: Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    //    var splitName = name.split(" ");
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                    Navigator.pop(
                                                        contextshowDialog);
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            PaypalPayment(
                                                          totalamount:
                                                              totalAmount,
                                                          userFirstName:
                                                              _firstName.text,
                                                          userLastName:
                                                              _lastName.text,
                                                          addressCity: city,
                                                          addressStreet: street,
                                                          addressZipCode:
                                                              selectedItemPstCode
                                                                  .name,
                                                          addressPhoneNumber:
                                                              phone,
                                                          companyName:
                                                              _company.text,
                                                          emailAddress:
                                                              _email.text,
                                                          customerNote:
                                                              _note.text,
                                                          selectedRadio:
                                                              selectedRadioTile,
                                                          ordertype: orderType,
                                                          formatDate: DateFormat(
                                                                  'dd-MM-yyyy')
                                                              .format(
                                                                  currentDate),
                                                          buttontext:
                                                              buttonText,
                                                          customerid:
                                                              customerID,
                                                          onFinish:
                                                              (number) async {
                                                            // payment done
                                                            print('order id: ' +
                                                                number);

                                                            createOrder(
                                                                basketDataForSearch,
                                                                _firstName.text,
                                                                _lastName.text,
                                                                _company.text,
                                                                _street.text,
                                                                _city.text,
                                                                selectedItemPstCode,
                                                                _email.text,
                                                                _phone.text,
                                                                _note.text,
                                                                selectedRadioTile,
                                                                context,
                                                                orderType ==
                                                                        "Pickup"
                                                                    ? "pickup"
                                                                    : "delivery",
                                                                orderType ==
                                                                        "Pickup"
                                                                    ? "pickup_date"
                                                                    : "delivery_date",
                                                                formattedDate =
                                                                    DateFormat(
                                                                            'dd-MM-yyyy')
                                                                        .format(
                                                                            currentDate),
                                                                orderType ==
                                                                        "Pickup"
                                                                    ? "pickup_time"
                                                                    : "delivery_time",
                                                                buttonText,
                                                                customerID,
                                                                number);
                                                            countDataForSearch[
                                                                    0]
                                                                .itemCount = 0;
                                                            basketDataForSearch
                                                                .clear();
                                                            productItem = null;
                                                            myList = null;
                                                            count = 0;
                                                            countList = 0;
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: FutureBuilder<double>(
                                      future: SharedService.Read(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<double> snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return const CircularProgressIndicator();
                                          default:
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              totalAmount = snapshot.data;
                                              return Container(
                                                child: Text(
                                                  "Order and pay ${snapshot.data} €",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0),
                                                ),
                                              );
                                            }
                                        }
                                      })),
                            ),
                          )
                        : Container(
                            width: double.infinity,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff010101
),
                                  ),
                                  // color: ,
                                  onPressed: () {
                                    //if not login

                                    print("hello 2");
                                    String street = _street.text;
                                    String city = _city.text;
                                    String firstName = _firstName.text;
                                    String lastName = _lastName.text;
                                    String email = _email.text;
                                    String phone = _phone.text;
                                    String note = _note.text;

                                    String paymentsss = "Cash";

                                    // var splitName=_name.text.split(" ");
                                    //       createOrder(basketDataForSearch,splitName[0],splitName[1], _company.text,_street.text,_city.text,selectedItemPstCode,_email.text,_phone.text,_note.text);
                                    if (plotdata == true) {
                                      List<String> data22 = [
                                        street,
                                        city,
                                        firstName,
                                        lastName,
                                        email,
                                        phone,
                                        note
                                      ];
                                      Sharedservice.SaveData(data22);
                                    }

                                    if (firstName == "" ||
                                            lastName == "" ||
                                            email == "" ||
                                            phone == "" ||
                                            street == "" ||
                                            city == ""
                                        //|| postcode == ""

                                        ) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Add your personal data before order.",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Color(0xFF424242),
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }

                                    if (validateAndSav2() == true) {
                                      if (payment == false) {
                                        print("Payment method is Paypal");
                                        paymentsss = "Paypal";
                                      } else if (payment == true) {
                                        print("Payment method is cash");
                                        paymentsss = "Cash";
                                      }

                                      showDialog(
                                        context: context,
                                        builder:
                                            (BuildContext contextshowDialog) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.8),
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: AlertDialog(
                                              title: Text(
                                                "Summary",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: "Montserrat",
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              elevation: 0,
                                              backgroundColor:
                                                  Color(0xFFEEEEEE),
                                              content: Text(
                                                "Street: " +
                                                    street +
                                                    " \nCity: " +
                                                    city +
                                                    " \nPostcode: " +
                                                    selectedItemPstCode.name +
                                                    "\nName: " +
                                                    firstName +
                                                    " \nEmail: " +
                                                    email +
                                                    " \nPhone: " +
                                                    phone +
                                                    " \nNote: " +
                                                    note +
                                                    " \nCoupon: " +
                                                    paymentsss +
                                                    // "\nPickup time: " +
                                                    "\nDelivery time: " +
                                                    buttonText,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "Montserrat",
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xff010101
),
                                                  ),
                                                  child: Text(
                                                    "Modify",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(
                                                            contextshowDialog)
                                                        .pop();
                                                  },
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xff010101
),
                                                  ),
                                                  child: Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                    Navigator.pop(
                                                        contextshowDialog);
                                                    createOrder(
                                                        basketDataForSearch,
                                                        _firstName.text,
                                                        _lastName.text,
                                                        _company.text,
                                                        _street.text,
                                                        _city.text,
                                                        selectedItemPstCode,
                                                        _email.text,
                                                        _phone.text,
                                                        _note.text,
                                                        selectedRadioTile,
                                                        context,
                                                        orderType == "Pickup"
                                                            ? "pickup"
                                                            : "delivery",
                                                        orderType == "Pickup"
                                                            ? "pickup_date"
                                                            : "delivery_date",
                                                        formattedDate =
                                                            DateFormat(
                                                                    'dd-MM-yyyy')
                                                                .format(
                                                                    currentDate),
                                                        orderType == "Pickup"
                                                            ? "pickup_time"
                                                            : "delivery_time",
                                                        buttonText,
                                                        customerID,
                                                        null);
                                                    countDataForSearch[0]
                                                        .itemCount = 0;
                                                    basketDataForSearch.clear();
                                                    productItem = null;
                                                    myList = null;
                                                    count = 0;
                                                    countList = 0;
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) => ConfPayment()),
                                                    // );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: FutureBuilder<double>(
                                      future: SharedService.Read(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<double> snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return const CircularProgressIndicator();
                                          default:
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else {
                                              totalAmount = snapshot.data;
                                              return Container(
                                                child: Text(
                                                  "Order and pay ${snapshot.data} €",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0),
                                                ),
                                              );
                                            }
                                        }
                                      })),
                            ),
                          ),
                  ],
                ),
              ),
            );
          }
        });
  }
}

final snackBar = SnackBar(
  duration: Duration(seconds: 12),
  content: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Ordering please wait'),
      SizedBox(
        width: 20,
      ),
      Container(
        height: 35,
        width: 35,
        child: CircularProgressIndicator(
          backgroundColor: Color(0xffa75264
),
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      )
    ],
  ),
);
