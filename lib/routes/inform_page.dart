import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:cocoliebe/routes/contact.dart';
import 'package:cocoliebe/routes/privacypolicy.dart';
import 'package:cocoliebe/routes/termsofcondition.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  Information({Key key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffd0d0d0),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: Text(
            'Details',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  child: Stack(
                children: [
                  PinchZoomImage(
                    image: Image(
                      image: AssetImage('images/cocoliebemap.png'),
                    ),
                    hideStatusBarWhileZooming: true,
                    onZoomStart: () {
                      print('Zoom started');
                    },
                    onZoomEnd: () {
                      print('Zoom finished');
                    },
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: EdgeInsets.all(
                          15.0,
                        ),
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 1.2,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                            left: 10,
                          ),
                          child: Column(
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Address',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(height: double.minPositive),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      'Richardstraße 107,12043 Berlin,Germany')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
            // SizedBox(height: 10.0),
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Column(
            //     children: [
            //       Container(
            //         child: Row(
            //           children: [
            //             Icon(
            //               Icons.timer,
            //               size: 20.0,
            //             ),
            //             SizedBox(
            //               width: 20.0,
            //             ),
            //             Text(
            //               'Deilvery Times',
            //               style: TextStyle(
            //                   fontSize: 18.0, fontWeight: FontWeight.bold),
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(height: 20.0),
            //       Container(
            //         padding: EdgeInsets.all(12.0),
            //         color: Colors.grey[200],
            //         child: Column(children: [
            //           Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [Text('Today:'), Text('12:00 - 21:45')]),
            //           SizedBox(height: 10.0),
            //           Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [Text('Tomorrow:'), Text('12:00 - 21:45')])
            //         ]),
            //       )
            //     ],
            //   ),
            // ),

            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.motorcycle,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Deilvery Costs',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    color: Colors.grey[200],
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Order from:'), Text('10.00 €')]),
                      SizedBox(height: 10.0),
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [Text('Deliver costs:'), Text('Free')]),
                    ]),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Payment options',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    color: Colors.grey[200],
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  width: 80.0,
                                  height: 60.0,
                                  color: Colors.white,
                                  child: Image(
                                      image: AssetImage('images/logo2.png'))),
                            ),
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(20),
                            //   child: Container(
                            //       width: 80.0,
                            //       height: 60.0,
                            //       decoration: BoxDecoration(
                            //         color: Colors.white,
                            //       ),
                            //       child: Image(
                            //           image: AssetImage('images/logo1.png'))),
                            // ),
                            // Container(
                            //     width: 80.0,
                            //     height: 60.0,
                            //     color: Colors.white,
                            //     child: Image(
                            //       image: AssetImage('images/klarna.jpg'),
                            //       fit: BoxFit.fill,
                            //     ))
                          ]),
                      // SizedBox(height: 10.0),
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [Text(''), Text('')])
                    ]),
                  )
                ],
              ),
            ),

            SizedBox(height: 10.0),
            Contact(),

            // Container(alignment: Alignment.bottomLeft,child: Text('hello'),)
          ]),
        ),
      ),
    );
  }
}
