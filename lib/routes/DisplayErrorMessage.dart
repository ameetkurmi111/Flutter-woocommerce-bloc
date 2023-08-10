import 'dart:async';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:cocoliebe/routes/bouncingButton.dart';
import 'package:cocoliebe/routes/order.dart';
import 'package:cocoliebe/routes/restaurant_homepage.dart';

import 'package:system_settings/system_settings.dart';

import '../main.dart';

class DisplayErrorMessage extends StatefulWidget {
  String forpage;
  DisplayErrorMessage(this.forpage);
  @override
  _DisplayErrorMessageState createState() =>
      _DisplayErrorMessageState(this.forpage);
}

class _DisplayErrorMessageState extends State<DisplayErrorMessage>
    with TickerProviderStateMixin {
  String forpage;

  _DisplayErrorMessageState(this.forpage);

  AnimationController _controller;
  AnimationController _control;
  Tween<double> _tween = Tween(begin: 1, end: 2);

  bool rotate = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controller.repeat(reverse: true);
    _control = AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                scale(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ooops!",
              style: TextStyle(fontSize: 30.0, color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text("No internet connection found.",
                style: TextStyle(fontSize: 15.0, color: Colors.grey)),
            SizedBox(
              height: 5,
            ),
            Text("Please turn on your internet.",
                style: TextStyle(fontSize: 15.0, color: Colors.grey)),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(children: [
                      BouncingButton(
                        child: Icon(
                          Icons.wifi_outlined,
                          size: 45,
                          color: Color(0xffa75264),
                        ),
                        // Container(
                        //   height: 60,
                        //   padding: EdgeInsets.all(8.5),
                        //   width: 60,
                        //   decoration: BoxDecoration(
                        //       color: Color(0xffa75264),
                        //       borderRadius: BorderRadius.circular(55.0),
                        //       border: Border.all(color: Colors.green)),
                        //   child: Center(child: Text("Wifi",style: TextStyle(fontSize: 11.0,)),)
                        // ),
                        onTap: () {
                          ///SystemSettings.system();
                          AppSettings.openWIFISettings();
                        },
                      ),
                      Text(
                        "Connect to wifi",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
                    SizedBox(width: 75),
                    Column(
                      children: [
                        BouncingButton(
                          child: AnimatedBuilder(
                              animation: _control,
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _control.value * 2 * pi,
                                  child: child,
                                );
                              },
                              child: Icon(Icons.refresh,
                                  size: 45, color: Color(0xffa75264))),
                          onTap: () {
                            setState(() {
                              _control = AnimationController(
                                  vsync: this, duration: Duration(seconds: 1))
                                ..repeat();
                            });
                            if (forpage == "Resturant page") {
                              Future.delayed(const Duration(seconds: 3), () {
                                // Here you can write your code
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                );
                                // Navigator.push(
                                // context,
                                // MaterialPageRoute(builder: (context) => RestaurantPage()),
                                // );
                              });
                            }
                          },
                        ),
                        Text("Refresh", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  scale() {
//   Timer.periodic(Duration(seconds: 5), (timer) {
//   print(DateTime.now());
// });
    return ScaleTransition(
      scale: _tween.animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
      child: Container(
        child: Icon(
          Icons.signal_wifi_off,
          size: 70,
        ),
      ),
    );
  }
}

//           Transform.scale(
//   scale: sliderVal == 20 ? 1 : sliderVal / 50,
//   origin: Offset(0.0, 0.0),
//   child: Container(
//     height: 100.0,
//     width: 100.0,
//     color: Colors.green,
//   ),
// ),

// Transform(
//             /**
//              * A widget that applies a transformation before  paintaing its child
//              */
//             transform: new Matrix4.diagonal3Values(
//               widget.animation.sizeTranslation.value * 2,
//               widget.animation.sizeTranslation.value * 2,
//               1.0,
//             ),
//             alignment: Alignment.center,
//             child: AutoSizeText(
//               'Whoops!',
//               style: Theme.of(context).textTheme.display2.copyWith(
//                   color: widget.animation._colorTween.value,
//                   fontWeight: FontWeight.w700),
//               textAlign: TextAlign.center,
//             ),
//           ),,
