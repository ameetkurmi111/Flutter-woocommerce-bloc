import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cocoliebe/routes/restaurant_homepage.dart';

class Cirlce extends StatefulWidget {
  @override
  _CirlceState createState() => _CirlceState();
}

class _CirlceState extends State<Cirlce> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => RestaurantPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffa75264)),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
