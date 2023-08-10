import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cocoliebe/routes/privacypolicy.dart';
import 'package:cocoliebe/routes/termsofcondition.dart';

class Colophon extends StatefulWidget {
  @override
  _ColophonState createState() => _ColophonState();
}

class _ColophonState extends State<Colophon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: AppBar(
                backgroundColor: Color(0xffd0d0d0),
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
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                title: Text(
                  "Colophon",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Color(0xFFEEEEEE),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 30, right: 15, left: 15, bottom: 20),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF004D40),
                              fontFamily: "Montserrat",
                              // fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    "We look forward to welcoming you to the CoColiebe Berlin. CoColiebe specializes in traditional Indian and Pakistani cuisine. Enjoy our large selection of delicious gourmet curries from different regions of India and Pakistan. We attach great importance to fresh, high-quality ingredients. We especially recommend our grilled delicacies from the traditional clay oven, the so-called tandoor. We wish you a pleasant visit to the CoColiebe and a delicious meal.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  color: Color(0xff000000),
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                              TextSpan(
                                text:
                                    "\nThe CoColiebe offers a delivery service for Indian food in Berlin. So you can always enjoy your favorite food from the comfort of your own home."
                                    "You are also welcome to order your meals to be picked up.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  color: Color(0xff000000),
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                              // TextSpan(
                              //   text:
                              //       "\nWatch as your food is prepared the way you prefer, from freshly made chicken curry to different types of briyani. Enjoy as many dishes as you want and choose the ideal complement to our selection of the finest wines, beers and beverages.\n",
                              //   // style: TextStyle(fontSize: 14,fontFamily: "Montserrat",color: Colors.black87,),
                              // ),
                              TextSpan(
                                text: "\n\nOur Address\n",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    color: Color(0xFF004D40),
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "\nRichardstraße 107, 12043 Berlin, Germany" +
                                    "\n\nEmail: infococoliebe@gmail.com\n" +
                                    "\nContact Number: +493023581336" +
                                    "\n\nBy clicking Sign Up, you agree to our ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service ',
                                style: TextStyle(color: Color(0xffa75264)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Terms(),
                                        ));
                                  },
                              ),
                              TextSpan(text: ' and that you have read our '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Color(0xffa75264),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                              Duration(milliseconds: 500),
                                          pageBuilder: (context, animation,
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
                                                position: animation.drive(Tween(
                                                        begin: Offset(1, 1),
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
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 372),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
