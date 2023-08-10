import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cocoliebe/routes/faqroutes/delivery1.dart';
import 'package:cocoliebe/routes/faqroutes/myaccount1.dart';
import 'package:cocoliebe/routes/faqroutes/quality1.dart';
import 'package:cocoliebe/routes/faqroutes/tip1.dart';
// import 'package:woocommerce/routes/faqroutes/delivery1.dart';
// import 'package:woocommerce/routes/faqroutes/myaccount1.dart';
// import 'package:woocommerce/routes/faqroutes/quality1.dart';
// import 'package:woocommerce/routes/faqroutes/tip1.dart';
import 'faqroutes/faqorder1.dart';
import 'faqroutes/payment1.dart';

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
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
          padding: EdgeInsets.only(left: 12, right: 12),
          color: Color(0xFFEEEEEE),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "How can we help you?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffa75264),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "I would like to get in contact with the restaurant.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Contact us.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "If you have an urgent question concerning an order you placed, we advise you to directly contact the restaurant. You can find the number of the restaurant in the colophon. For less urgent matters and general questions, please send us a mail at  infococoliebe@gmail.com. We will be happy to answer to any type of questions in a few working days.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Other topics that might interest you",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 52,
                        color: Color(0xff000000),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Placing an order",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FaqOrder1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How do I order?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FaqOrder1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How do I change my order?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FaqOrder1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How do I cancel my order?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FaqOrder1()),
                              );
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "More question about placing an order >>",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.payments,
                        size: 52,
                        color: Color(0xff000000),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Payment",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Payment1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How can I pay for my order",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Payment1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How do I redeem my voucher?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Payment1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How high are the transaction costs?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payment1()),
                              );
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "More question about payment >>",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.local_restaurant_outlined,
                        size: 52,
                        color: Color(0xff000000),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Quality",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Quality1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Who is responsible for the food quality?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Quality1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How do I rate my order?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Quality1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "The restaurant did not receive my order.",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Quality1()),
                              );
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "More question about Quality >>",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.delivery_dining,
                        size: 52,
                        color: Color(0xff000000),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Delivery",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Delivery1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "What happens after I have placed my order?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Delivery1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How long does a delivery take?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Delivery1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How high are the delivery costs?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Delivery1()),
                              );
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "More question about Delivery >>",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 52,
                        color: Color(0xff000000),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "My account",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyAccount1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "What are the advantages of an account?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyAccount1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How do I create an account?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyAccount1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How do I use my account?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyAccount1()),
                              );
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "More question about My account >>",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 52,
                        color: Color(0xff000000),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Tip the courier",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tip1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Do I have to tip?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tip1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "What if I want to tip my courier in cash?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lens,
                              size: 7,
                              color: Color(0xff000000),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tip1()),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "How much should I tip?",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Tip1()),
                              );
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "More question about tipping the courier >>",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
