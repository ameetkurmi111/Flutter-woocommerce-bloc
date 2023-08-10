import 'package:cocoliebe/routes/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
          "About Us",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.only(left: 16, right: 16),
                      //   child: Align(
                      //     alignment: Alignment.topLeft,
                      //     child: Text(
                      //       "Opening Hours",
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.w600,
                      //         color: Colors.green[700],
                      //         fontFamily: "Montserrat",
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: [
                            // Align(
                            //   alignment: Alignment.topLeft,
                            //   child: RichText(
                            //     text: TextSpan(
                            //       style: TextStyle(
                            //         fontFamily: "Montserrat",
                            //       ),
                            //       children: <TextSpan>[
                            //         TextSpan(
                            //           text:
                            //               // "\n • Sunday - Thursday: 11:30 a.m. - 3:30 a.m.\n • Friday - Saturday: 5 p.m - 12 a.m.\n" +
                            //               " • Phone: +493381333626\n",
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontFamily: "Montserrat",
                            //               color: Color(0xff000000),
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            Divider(
                              // height: 4.0,
                              thickness: 2.0,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Welcome to CocoLiebe",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffa75264)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              // height: 4.0,
                              thickness: 2.0,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "\nCocoliebe is a restaurant based on the idea of ​​a synergy between science and nature. In our kitchen we use the latest technology and fresh ingredients from the farm. Cocoliebe loves to surprise its guests with artful, lively and unexpected tastings, where centuries-old recipes and regional quality meet a taste that knows no bounds."
                                        "The purest components and the best sauces are represented by the most appropriate culinary skills. "
                                        "Every dish is prepared with love and care. Not only do we offer you the finest gastronomic delights, we also take you on a journey. Our decor reflects the same attention to detail and sophistication that we put into our kitchen."
                                        "We cook our hearty dishes from fresh ingredients and pay attention to a healthy diet."
                                        "Our recipes are designed to retain most of the vitamins and other nutritional values."
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
                                  // ),
                                  // TextSpan(
                                  //   text:
                                  //       "\nWhether you are looking for a casual evening with mixed drinks, a business lunch, a romantic dinner for two or a late night party, we are behind you.",
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              // height: 4.0,
                              thickness: 2.0,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // RichText(
                            //   text: TextSpan(
                            //     style: TextStyle(
                            //       fontFamily: "Montserrat",
                            //     ),
                            //     children: <TextSpan>[
                            //       TextSpan(
                            //         text:
                            //             "Life is too short for boring food, more taste and less drama - ",
                            //         style: TextStyle(
                            //             fontSize: 16, color: Colors.black),
                            //       ),
                            //       TextSpan(
                            //         text: "MIRCH",
                            //         style: TextStyle(
                            //             fontSize: 17,
                            //             fontWeight: FontWeight.bold,
                            //             color: Color(0xff902326)),
                            //       ),
                            //       TextSpan(
                            //         text: " MASALA",
                            //         style: TextStyle(
                            //             fontSize: 17,
                            //             fontWeight: FontWeight.bold,
                            //             color: Color(0xff902326)),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: 5,
                            ),
                            // Divider(
                            //   // height: 4.0,
                            //   thickness: 2.0,
                            // ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Wrap(children: [
              Contact(),
            ]),
          ],
        ),
      ),
    );
  }
}
