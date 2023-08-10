import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "package:cocoliebe/routes/checkout2.dart";
import 'package:cocoliebe/utils/customappbar.dart';

class CheckOut extends StatefulWidget {
  var selectedItemPstCode;
  CheckOut(this.selectedItemPstCode);
  @override
  _CheckOutState createState() => _CheckOutState(this.selectedItemPstCode);
}

class _CheckOutState extends State<CheckOut> {
  _CheckOutState(this.selectedItemPstCode);
  var selectedItemPstCode;

  ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff902326),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: AnimatedContainer(
                color: Color(0xffd0d0d0),
                height: _showAppbar ? 68.0 : 0.0,
                duration: Duration(milliseconds: 700),
                child: PreferredSize(
                  preferredSize:
                      Size.fromHeight(68.0), // here the desired height
                  child: CustomAppBar(),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollViewController,
                child: Container(
                  color: Color(0xFFEEEEEE),
                  child: CheckOut2(selectedItemPstCode),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
