import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cocoliebe/main.dart';
import 'package:cocoliebe/routes/restaurant_homepage.dart';

class ConfPayment extends StatefulWidget {
  bool orderDone = true;
  ConfPayment(this.orderDone);
  @override
  ConfPaymentState createState() => ConfPaymentState(this.orderDone);
}

class ConfPaymentState extends State<ConfPayment> {
  bool orderDone = true;
  ConfPaymentState(this.orderDone);
  bool condition = false;

  Widget Icon1 = Icon(
    Icons.check_circle_outline_sharp,
    color: Color(0xffa75264
),
    size: 180.0,
  );

  Widget Icon2 = Icon(
    Icons.radio_button_off_sharp,
    color: Color(0xffa75264
),
    size: 180.0,
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        child: Container(
          color: Color(0xFFEEEEEE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Center(
                  child: (condition)
                      ? Container(
                          height: 135,
                          width: 135,
                          child: CircularProgressIndicator(
                            strokeWidth: 13,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF902326)),
                          ),
                        )
                      : Icon1,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: orderDone
                    ? Text(
                        "Your order is confirmed!",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      )
                    : Text(
                        "Your order is not confirmed!",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              orderDone
                  ? Center(
                      child: Text(
                        "Thank you",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        "Sorry",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 38,
                width: 130,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffa75264
),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Homepage',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
