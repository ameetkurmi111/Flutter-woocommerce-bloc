import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffd0d0d0),
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
                color: Colors.black,
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
            "Checkout",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
//       actions: [
//         Container(
//           padding: EdgeInsets.only(right: 12),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 8,
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.shopping_bag_rounded,
//                     size: 27,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
// // do something
//                   },
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
    );
  }
}
