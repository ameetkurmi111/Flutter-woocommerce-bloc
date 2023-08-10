import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Delivery1 extends StatefulWidget {
  @override
  _Delivery1State createState() => _Delivery1State();
}

class _Delivery1State extends State<Delivery1> {
  _launchURL() async {
    const url = 'https://cocoliebe.com/impressum/';
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
                    "Delivery",
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
                    "What happens after I have placed my order?",
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
                    "The order arrives in our system and is directly sent to the restaurant. After a few seconds the restaurant receives the order by fax, email or our own software Woo-Commerce",
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
                    "Once the restaurant has received all the details of your order, it is their responsibility to prepare and deliver your meal.",
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
                    "How long does a delivery take?",
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
                    "Usually it takes 45 minutes. It depends on how many orders has the restaurants to prepare. Keep in mind that on Sundays, it may take a little more.",
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
                    "It is also possible to select the time you wish to receive your order. You can select this on the checkout page. The selected time will be noted in the confirmation email.",
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
                    "How high are the delivery costs?",
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
                    "The delivery costs is fixed from our restaurant. It's possible to see the price in the basket page before accessing to the checkout page.",
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
                    "What is the delivery area for the restaurant?",
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
                    "The delivery area is defined by giving the postecode. If you have any doubt about you area you can contact directly the restaurant.",
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
                    "My order was delivered too late.",
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
                    "The order arrives in our system and is directly sent to the restaurant. After a few seconds the restaurant receives the order by fax, email or our own software Woo-Commerce.",
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
                    "Once the restaurant has received all the details of your order, it is their responsibility to prepare and deliver your meal.",
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
                    "I did not receive what I had ordered.",
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
                    "If something is wrong or missing in your order, we advise you to first contact directly the restaurant in order to give them the opportunity to resolve the problem and deliver the correct dishes.",
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
                    "In case a product is out of stock and you have already paid for your order online, contact our customer service. ",
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
                    "My order was not delivered.",
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
                    "There are two possible scenarios after the payment section: ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "1.   The restaurant received the order but did not deliver it.",
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
                padding: EdgeInsets.only(left: 26, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "In any case, the restaurant is responsible for the delivery and must contact you to inform you. You should call the restaurant on the phone number provided in the confirmation email to find out what went wrong. Anyway, our confirmation system shows that the restaurant has confirmed the receipt of your order but the restaurant unfortunately did not deliver it. It is possible that your order was lost at the restaurant or that they decided for some reason not to deliver it.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "2.   The restaurant is not responding.",
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
                padding: EdgeInsets.only(left: 26, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "We will always first try to contact you by phone as soon as possible, and if you don’t pick up we will send you a cancellation email. For this reason it is very important that you enter a valid phone number and email address when ordering.",
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
