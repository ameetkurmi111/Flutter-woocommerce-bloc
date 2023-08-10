// import 'package:flutter/material.dart';
// import 'package:cocoliebe/api_service.dart';
// // import 'package:cocoliebe/routes/menu_description.dart';
// // import 'package:cocoliebe/screens/product_page.dart';
// import '../models/menu_categoried_model.dart';
// // import '../screens/product_page.dart';
// // import 'package:percent_indicator/percent_indicator.dart';
// // import 'dart:math' as math;
// // import 'package:';
//   Future<List<dynamic>> post;
// class MenuList extends StatefulWidget {
//   @override
//   _MenuListState createState() => _MenuListState();
// }

// // var listItems;
// int _pressed;
// // List category=[];
// class _MenuListState extends State<MenuList> {
//   ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = new ScrollController();
//     post = fetchWpCategoriesList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: 3, top: 5.0),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             color: Color(0xffa75264)[700],
//             shape: BoxShape.circle,
//           ),
//           child: IconButton(
//             color: Colors.black,
//             icon: Icon(Icons.search_rounded),
//             onPressed: () {
//               showSearch(context: context, delegate: DataSearch());
//             },
//           ),
//         ),
//                       Expanded(
//                            child: FutureBuilder(
//                           future: post,
//                           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                             if (snapshot.hasData) {
//                                 return ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             controller: _scrollController,
//                             itemCount: category.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               // for (int i = 0; i< _items.length; i++) {
//                               //   if (_items.elementAt(i).selected) {
//                               //     _scrollController.animateTo(i * _ITEM_HEIGHT, duration: new Duration(seconds: 2), curve: Curves.ease);
//                               //   }
//                               // }
                 
//                               // category.add(wppost['name']);
//                               // print(category.length);
//                               //  if (snapshot.data.length==category.length) {
//                               //     MenuDescription();
//                               //   }
//                               return Row(
//                                 children: [
//                                   Container(
//                                     padding:
//                                         const EdgeInsets.symmetric(horizontal: 5.0),
//                                     margin: EdgeInsets.only(top: 9, bottom: 9),
//                                     alignment: Alignment.center,
//                                     child: ButtonTheme(
//                                       child: RaisedButton(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(15)),
//                                         color: _pressed == index
//                                             ? Colors.orange
//                                             : Colors.grey[200],
//                                         onPressed: () {
//                                           setState(() {
//                                             _pressed = index;
//                                           });
//                                           print("${category[index]}");
//                                         },
//                                         child: Text(
//                                           category[index],
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               color: _pressed == index
//                                                   ? Colors.white
//                                                   : Colors.black),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             },
                
//                   );
//                             }
//                             return CircularProgressIndicator();
//                           }
                                            
//                         ),
//                       )

//         ,]);

        
        

//   }
// }

// // class Item {
// //   final String displayName;
// //   bool selected;

// //   Item(this.displayName, this.selected);
// // }
