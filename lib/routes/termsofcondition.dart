import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import "package:woocommerce/routes/checkout2.dart";
// import 'package:woocommerce/utils/customappbar.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
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
          "Terms of Conditions",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 14, right: 14),
          color: Color(0xFFEEEEEE),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "General Terms and Conditions for Customers",
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
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "1.  Introduction",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '',
                          style: new TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(
                          text:
                              'This page (together with our Privacy Policy) sets out the terms and conditions ("Terms") on which we, CoColiebe, provide access to our website, www.cocoliebe.com, and the mobile application through which you order products. Please read these Terms carefully before ordering any products through the website or the application. By ordering products through the website (whether now or in the future), you agree to be bound by these Terms. Use of the website is also subject to these Terms.'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '',
                          style: new TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(
                          text:
                              'By accessing any part of the website or any part of the application, you indicate that you accept these Terms. If you do not accept these Terms, you should leave the website immediately, and you will not be able to order any products through the website or in the application.'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'We reserve the right to change these Terms from time to time by changing them on this page. We advise you to print a copy of these Terms for future reference'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "2.  Identity of CoColiebe",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Address: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: 'Richardstraße 107, 12043 Berlin, Germany'),
                      // TextSpan(
                      //     text:
                      //         '\n                 Sommerstraße 42, 13409 Berlin, Germany '),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Phone:  ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      // TextSpan(text: '+0171 8207498 , '),
                      TextSpan(text: '+493023581336'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Order:  ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: 'cocoliebe.com'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Email:  ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' infococoliebe@gmail.com'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "3.  Applicability ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Access: ',
                        style: new TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text:
                            'You may access some areas of the website or some areas of the application without making an Order or registering your details with us. Most areas of the website and application are open to everyone.'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Acceptance of terms: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'By accessing any part of the Application, you indicate that you accept these Terms. If you do not accept these Terms, you should leave the Application immediately, and you will not be able to order any Products through the Application.'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Revision of terms: ',
                        style: new TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text:
                            'We may revise these Terms at any time. You should check the website regularly to review the current Terms, because they are binding on you. You will be subject to the policies and terms and conditions in force at the time that you place an Order through us. '),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Responsibility: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'You are responsible for making all arrangements necessary for you to have access to the Website. You are also responsible for ensuring that all persons who access the Application through your Internet connection are aware of these Website Terms and that they comply with them.'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "4.  Your Status ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Capacity and age: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'By placing an Order through the Website, you warrant that: you are legally capable of entering into binding contracts with Restaurant and you are at least 18 years old.'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Acknowledges: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'If you have a specific food allergy or intolerance, you will contact the Restaurant directly to check that the food is suitable for you, before placing your order directly with them. '),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Allergies: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'The Restaurant may use ingredients and additives of meals and drinks, that could cause allergies and intolerances. If a Customer is allergic to any foodstuffs, we advise to contact the Restaurant by telephone for current allergen information before placing an Order.'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "5.   The Agreement ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'The agreement: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'The Agreement can only be executed by the Restaurant if the Customer provides correct and complete contact and address information when placing the Order. The Customer is obliged to be available by telephone or email (as indicated when placing the Order).'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Payment authorisation: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Where any payment you make is not authorised, your Order will not be processed or communicated to the Restaurant.'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Delivery of your Order: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Estimated times for deliveries and collections are provided by our Restaurant and are only estimates. We don\'t guarantee that Orders will be delivered or will be available for collection within the estimated times. '),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "6.   Dissolution and cancellation of the Order",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Deleting your Order: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'The Restaurant is entitled to cancel the Order, e.g., if the Offer is no longer available, if the Customer has provided an incorrect or inoperative telephone number or other contact information, or in case of force majeure. '),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Amending or cancelling your Order: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Once you have submitted your Order and your payment has been authorised, you will not be entitled to change or cancel your Order, nor will you be entitled to a refund. If you wish to change or cancel your Order, you have to contact directly with the restaurant. However, there is no guarantee that we will be able to reach the Restaurant or that the Restaurant will agree to your requests as they may have already started processing your Order.'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "7.    Payment",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'VAT and delivery costs: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Prices will be as quoted on the Website. These prices include VAT but may exclude delivery costs (if you opt for delivery instead of collection) and any administration or service charge imposed by the Restaurant. These will be added to the total amount due where applicable.'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Complaints or feedback: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'In the event that you are dissatisfied with the quality of any Products or the service provided by a Restaurant, please consider providing feedback in the form of ratings, comments and reviews on the Website (together, "Reviews") to reflect your experience. The Reviews are an important part of our quality control process.'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Reimbursement: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'Complaints from the Customer about the Offer, the Order or the performance of the Agreement, are to be filed with the Restaurant. The sole responsibility for the Offer of the Restaurant and the performance of the Agreement lies with the Restaurant.'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "8.   Disclaimers: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Information: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'While we try to ensure that information on the Website is correct, we do not promise it is accurate or complete. We may make changes to the material on the Website, or to the functionality, Products and prices described on it, at any time without notice. The material on the Website may be out of date, and we make no commitment to update that material.'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Exclusion of terms: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'We provide you with access to and use of the Website on the basis that, to the maximum extent permitted by law, we exclude all representations, warranties, conditions, undertakings and other terms in relation to the Website and your use of it (including any representations, warranties, conditions, undertakings and other terms which might otherwise apply to the Website and your use of it, or be otherwise implied or incorporated into these Website Terms, by statute, common law or otherwise ).'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF004D40),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Complains: ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'If the Customer has a complaint as regards the service, the complaint is to be communicated by means of the contact form, by email or ordinary mail.'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "9.   Other ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(
                color: Color(0xFFBDBDBD),
                thickness: 2.0,
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Severability: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'If any of these Terms are determined by any competent authority to be invalid, unlawful or unenforceable to any extent, such term, condition or provision will to that extent be severed from the remaining terms, conditions and provisions which will continue to be valid to the fullest extent permitted by law.'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Entire agreement: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'The Terms and any document expressly referred to in them constitute the whole agreement between you and us and supersede all previous discussions, correspondence, negotiations, previous arrangement, understanding or agreement between us relating to the subject matter of any contract.'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'No waiver: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'Any failure or delay by you or us in enforcing (in whole or in part) any provision of these Terms will not be interpreted as a waiver of your or our rights or remedies.'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Assignment: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'You may not transfer any of your rights or obligations under these Terms without our prior written consent. We may transfer any of our rights or obligations under these Terms without your prior written consent to any of our affiliates or any business that we enter into a joint venture with, purchase or are sold to.'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Headings: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'The headings in these Terms are included for convenience only and shall not affect their interpretation.'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF004D40),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Law: ',
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            'Exclusively the law of the Federal Republic of Germany is applied.'),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
