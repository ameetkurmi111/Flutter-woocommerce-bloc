import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tip1 extends StatefulWidget {
  @override
  _Tip1State createState() => _Tip1State();
}

class _Tip1State extends State<Tip1> {
  _launchURL() async {
    const url = 'https://cocoliebe.com//impressum/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "Frequently asked questions",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFEEEEEE),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tip the courier",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffa75264),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Divider(
                  color: Color(0xFFBDBDBD),
                  thickness: 2.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Do I have to tip?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "The truth is, tipping is expected in Germany. It is common practice to leave between 5 and 10 percent for tip. Fifteen percent is downright lavish and more than that is only for tourists.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "It is typical to \"round up\" the amount to some more-or-less round figure. A rule of thumb is to add 5-10%, generally ending with a full Euro amount.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              FlatButton(
                onPressed: _launchURL,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Does this answer your question? If not, then contact our customer service.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF2173F5),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Divider(
                  color: Color(0xFFBDBDBD),
                  thickness: 2.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "What if I want to tip my courier in cash?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "The best way to ensure that your tip goes into your driver’s pocket is to give them a tip that they can literally put in their pocket—namely, cash.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "When you tip with a credit card, a delivery person doesn’t immediately receive that gratuity. Credit card also involve fees.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              FlatButton(
                onPressed: _launchURL,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Does this answer your question? If not, then contact our customer service.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF2173F5),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Divider(
                  color: Color(0xFFBDBDBD),
                  thickness: 2.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Does the entire tip go directly to the courier?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "The entire tip goes to the courier and is paid out as part of their salary payment. Tips may be subject to taxes where legally required",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "We strongly encourage all customers to tip directly to their couriers. Then we have informed them about the online tipping feature in which we are working on.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              FlatButton(
                onPressed: _launchURL,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Does this answer your question? If not, then contact our customer service.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF2173F5),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Divider(
                  color: Color(0xFFBDBDBD),
                  thickness: 2.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Why do I need to make a separate payment if I want to leave a tip?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "This process gives to the customers a greater flexibility in deciding when and how much to tip your driver. We are working to improve the tipping payment process to make it even easier in the future.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              FlatButton(
                onPressed: _launchURL,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Does this answer your question? If not, then contact our customer service.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF2173F5),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Divider(
                  color: Color(0xFFBDBDBD),
                  thickness: 2.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Can I add a tip online when ordering for pickup?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "For this period, it's not possible to add an online tip for pickup orders.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              FlatButton(
                onPressed: _launchURL,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Does this answer your question? If not, then contact our customer service.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF2173F5),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
