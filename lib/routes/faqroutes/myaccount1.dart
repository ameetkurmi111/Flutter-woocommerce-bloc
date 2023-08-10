import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAccount1 extends StatefulWidget {
  @override
  _MyAccount1State createState() => _MyAccount1State();
}

class _MyAccount1State extends State<MyAccount1> {
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
                    "My Account",
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
                    "What are the advantages of an account?",
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
                    "it is always recommended to create an Account, because the advantages that you can use are a lot; but remember that you are not obliged to register to our application. Here we have some of the adavantages that you can reach if you decide to join us: ",
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
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.brightness_1_rounded,
                          color: Color(0xff000000),
                          size: 12.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "You can use your account via web browser and our Apps.",
                                style: TextStyle(
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
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.brightness_1_rounded,
                          color: Color(0xff000000),
                          size: 12.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "You can use your account via web browser and our Apps.",
                                style: TextStyle(
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
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.brightness_1_rounded,
                          color: Color(0xff000000),
                          size: 12.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Add several addresses so that you can rapidly select your desired delivery location.",
                                style: TextStyle(
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
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.brightness_1_rounded,
                          color: Color(0xff000000),
                          size: 12.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "If an order did please you very much, you can reorder it directly (only available via the App)",
                                style: TextStyle(
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
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.brightness_1_rounded,
                          color: Color(0xff000000),
                          size: 12.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "A complete list of all your favorite categories and dishes. This helps you order even faster your best dish.",
                                style: TextStyle(
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
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.brightness_1_rounded,
                          color: Color(0xff000000),
                          size: 12.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "You can always alter your personal details in your account.",
                                style: TextStyle(
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
                  SizedBox(
                    height: 4,
                  ),
                ],
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
                    "How do I create an account?",
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
                    "On the Homepage, on the top left there is a menu button, which allows the User to access to the drawer. Pressing Create Account you will be redirected to registration page.",
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
                    "It is not obligatory to create an account. You can always order without having an account or without logging in.",
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
                    "How do I use my account?",
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
                    "There is the possibility to do a lot of thing if you decide to create an account:  for example you can change your details and password and find your favorite dishes. Your address details and all your previous orders will also be saved in your account. You can choose to add different addresses to your account. This is very handy if you often order from different locations!.",
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
                    "There is also the possibility to not waste time, finding in the checkout page all the details given for the last order.",
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
                    "I forgot my password.",
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
                    "If you have already an account, but you don't remember your password, you can easyly change if from the login page, pressing the orange field \"Forgot your Password\" .",
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
                    "Do I need an account to place an order?",
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
                    "No, our main aim for this application is to do an order as quicker and faster as possible.",
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
                    "How do I delete my account?",
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
                    "To remove your account, we need the following information: your first and last name, and the email address which is connected to your account. The only way to delete your account is to contact our customer service.",
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
