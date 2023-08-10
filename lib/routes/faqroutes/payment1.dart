import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment1 extends StatefulWidget {
  @override
  _Payment1State createState() => _Payment1State();
}

class _Payment1State extends State<Payment1> {
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
                    "Payment",
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
                    "How can I pay for my order: ",
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
                    "1.   Cash (exact amount or more) Select 'Cash' on the checkout page and then pay the driver at your doorstep.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    // "2.  PayPal Select 'PayPal'on the checkout page. Click on 'Place order'. You will be redirected to the secured PayPal-forms, where you can follow its instructions. Once the payment is confirmed, the order arrives in our system and is directly sent to the restaurant.",
                    "2. 'Cash On Delivery'on the checkout page. Click on 'Place order'. You will be redirected to the cash on delivery- pickup, where you can follow its instructions. Once the order is confirmed, the order arrives in our system and is directly sent to the restaurant.",
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
                    "How do I redeem my voucher?",
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
                    "You can add a discount voucher to your order when filling in the order details. Under the payment methods you can click Do you have a voucher?. A box will appear where you can fill in your voucher code.",
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
                    "How high are the order-transactions costs?",
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
                    "We want to be as trasparent as possible. The transaction cost is displayed below each payment before finalizing the order. The charges applied never exceed the costs the restaurant has to make itself to be able to provide the payment method to you.",
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
                    // "My online payment failed",
                    "My payment is Cash",
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
                    "If you think the online payment has failed, always check if you have received a confirmation email. This email will enable you to see if your order has been submitted and if the order is already paid for or not.",
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
                    "The confirmation e-mail is directly sent once the payment is complete. This may take a little longer if the payment is being processed by the bank, the credit card company or any other payment company. This can take up to 15 minutes.",
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
                    "The confirmation e-mail is directly sent once the payment is complete. This may take a little longer if the payment is being processed by the bank, the credit card company or any other payment company. This can take up to 15 minutes.",
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
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "How secure are online payments on this application?",
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
                    "When processing online payments on this application, we use secure SSL pages. This means that these pages ensure the protection of your personal and payment details. This way you can be sure that this information is only visible to you and to us, for the processing of your order.",
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
                    "What happens with my online payments after my order is cancelled",
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
                    "Before contacting our customer service, check on your email if your order has been submitted. This email will enable you too see if the order is already paid or not.",
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
                    "If after 15 minutes you still have no confirmation email in your inbox, contact our customer service. They will tell you if the order and the payment have succeeded.",
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
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Does this answer your question? If not, then contact our customer service.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF2173F5),
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.start,
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
