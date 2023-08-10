import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import "package:woocommerce/routes/checkout2.dart";
// import 'package:woocommerce/utils/customappbar.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
          "Privacy Policy",
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
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Confidential Policy for Users",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffa75264),
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "\nThis privacy protection statement refers to the individual information of the users who places an order on one of our platforms of cocoliebe.com. The information controller for preparing these individual user information is webdesign-bpo.de. CoColiebe is accountable with your confidential data collection and takes your security very seriously. Furthermore, when handling personal data, webdesign-bpo.de/en/ refers to the provisions of the General Data Protection Regulation (GDPR).\n",
                            style: TextStyle(
                              fontSize: 14,
                              //   fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text:
                                "\nWhat we deal with sensitive information and why?\n",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text:
                                "\nIf you are using our services, cocoliebe.com handles your personal information. For the reasons listed, we depend on the following personal details.\n",
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text: "\n1. Method of ordering\n",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text:
                                "\n When you place your orders, we evaluate the personal information that you trust us with. To fulfill your order, validate your request, and to determine your order, receipt, as well as a future refund, these personal details are required. The legal justification for this collection of personal information is that, as described in the GDPR, it is essential for the execution of a contract. In the ordering process, we process the following personal information:\n" +
                                    "   •	Name\n" +
                                    "   •	Address details\n" +
                                    "   •	Contact details\n" +
                                    "   •	Order\n" +
                                    "   •	Payment details\n" +
                                    "   •	Comments (if applicable)\n",
                            style: TextStyle(
                              fontSize: 14,
                              //   fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text: "\n2.	Reviews for restaurants\n",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text:
                                "\nWe handle personal information you submit when publishing a restaurant review, aside from the above processing activities. The legal justification for this personal data processing is that, as described in the GDPR, you have agreed to it (by submitting a restaurant review). By contacting us via our privacy form, you may revoke your consent. When you submit a restaurant review, we review the corresponding personal information:\n" +
                                    "   •	Name (if submitted)\n" +
                                    "   •	Review\n",
                            style: TextStyle(
                              fontSize: 14,
                              //   fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text: "\n3.	Customer Services\n",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text:
                                "\nWe will use the identifying information you provide when you call our customer relations department to answer your question or manage your complaint. The legal justification for this collection of personal data is that, as specified in the GDPR, it is necessary for the execution of a contract. For customer service purposes, we process the following personal data:\n" +
                                    "   •	Name\n" +
                                    "   •	Address details\n" +
                                    "   •	Contract details\n" +
                                    "   •	Payment details\n",
                            style: TextStyle(
                              fontSize: 14,
                              //   fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text: "\n4.	Cookies\n",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text:
                                "\n And ultimately, we also obtain data which you indirectly send to us. For practical, analytical, and marketing purposes, cocoliebe.com/ uses cookies. Functional cookies are required for the application to be used. The following personal data is obtained via cookies:n\n" +
                                    "   •	Device Type \n" +
                                    "   •	Application language\n",
                            style: TextStyle(
                              fontSize: 14,
                              //  fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                          TextSpan(
                            text:
                                "\nIf there is the possibility of entering personal or business data (email addresses, names, addresses) on the application, the input of these data takes place voluntarily. The use and payment of all offered services is permitted – as far as technically possible and reasonable – without specification of such data or under specification of anonymized data or an alias. The use of the contact data published in the imprint or comparable information such as postal addresses, telephone and fax numbers and e-mail addresses by third parties to send information that has not been expressly requested is not permitted. We expressly reserve the right to take legal steps against senders of so-called spam mails who violate this prohibition.\n",
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ],
                      ),
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
