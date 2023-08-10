import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cocoliebe/routes/login.dart';
//import 'package:woocommerce/routes/login.dart';

class UnAuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF902326).withOpacity(1),
                            Color(0xFF902326).withOpacity(0.2),
                          ]),
                    ),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 90,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Opacity(
                opacity: 0.6,
                child: Text(
                  "You must Sign in to access to this section",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF902326),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 38,
                width: 130,
                child: RaisedButton(
                  color: Color(0xFF902326),
                  onPressed: () {
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Login(),
                    //   ),
                    //   ModalRoute.withName("/Login"),
                    // );
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text('Go Back',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
