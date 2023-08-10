import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cocoliebe/routes/privacypolicy.dart';
import 'package:cocoliebe/routes/termsofcondition.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          child: Container(
            color: Color(0xffaaaaaa),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 22.0, top: 20, right: 20, bottom: 25),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14.0),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Contact\n\n',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Cocoliebe Restaurant\n',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffc72e2e)),
                            ),
                            TextSpan(
                              text: '\nOur address\n',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text:
                                  "\nRichardstraße 107, 12043 Berlin, Germany" +
                                      "\nPhone: +493023581336",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                                text: "\n\nDo You Have Questions?",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            TextSpan(
                              text: "\nEmail:  infococoliebe@gmail.com",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text:
                                  "\n\nBy clicking Sign Up, you agree to our ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Terms of Service ',
                              style: TextStyle(
                                  color: Color(0xffa75264),
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Terms(),
                                      ));
                                },
                            ),
                            TextSpan(
                                text: ' and that you have read our ',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                  color: Color(0xffa75264),
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PrivacyPolicy(),
                                      ));
                                },
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
