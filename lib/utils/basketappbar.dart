import 'package:flutter/material.dart';

class BasketAppBar extends StatefulWidget {
  @override
  _BasketAppBarState createState() => _BasketAppBarState();
}

class _BasketAppBarState extends State<BasketAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      
     backgroundColor: Color(0xFF902326),
      leading: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                size: 27,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      title: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Basket",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      
      actions: [
        Container(
          padding: EdgeInsets.only(right: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
             ],
            ),
          ),
        )
      ],
    );
  }
}
