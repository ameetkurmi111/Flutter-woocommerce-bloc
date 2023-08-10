import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cocoliebe/routes/unauth_widget.dart';
import 'package:cocoliebe/services/shared_service.dart';
// import "package:woocommerce/routes/checkout2.dart";
// import 'package:woocommerce/routes/unauth_widget.dart';
// import 'package:woocommerce/services/shared_service.dart';
// import 'package:woocommerce/utils/customappbar.dart';

// class Order extends StatefulWidget {
//   @override
//   _OrderState createState() => _OrderState();
// }

// class _OrderState extends State<Order> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: SharedService.isLoggedIn(),
//         builder: (BuildContext context, AsyncSnapshot<bool> loginModel) {
//           if (loginModel.data) {
//             return Scaffold(
//               body: SafeArea(
//                 child: Column(
//                   children: <Widget>[
//                     SingleChildScrollView(
//                       child: AppBar(
//                         backgroundColor: Color(0xFF902326),
//                         leading: SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               IconButton(
//                                 icon: Icon(
//                                   Icons.arrow_back_outlined,
//                                   size: 24,
//                                   color: Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         title: Column(
//                           children: [
//                             Text(
//                               "Order",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: "Montserrat",
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                         actions: [
//                           Container(
//                             padding: EdgeInsets.only(right: 12),
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         color: Color(0xFFEEEEEE),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Icon(
//                                 Icons.shopping_bag_rounded,
//                                 color: Color(0xff000000),
//                                 size: 40.0,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Center(
//                               child: Text(
//                                 "No orders yet",
//                                 style: TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.w800,
//                                   color: Color(0xff000000),
//                                   fontFamily: "Montserrat",
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Center(
//                               child: Text(
//                                 "You have not placed any orders yet.",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xff000000),
//                                   fontFamily: "Montserrat",
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return UnAuthWidget();
//           }
//         });
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:provider/provider.dart';
import 'package:cocoliebe/api_service.dart';
// import 'package:cocoliebe/models/orderModel.dart';

// import 'package:cocoliebe/routes/unauth_widget.dart';
import 'package:cocoliebe/routes/view_order.dart';
// import 'package:cocoliebe/services/shared_service.dart';
// import "package:woocommerce/routes/checkout2.dart";
// import 'package:woocommerce/routes/unauth_widget.dart';
// import 'package:woocommerce/services/shared_service.dart';
// import 'package:woocommerce/utils/customappbar.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

var order;
bool refreshOrderList = false;
int decimals = 2;
int fac = pow(10, decimals);
safeArea(context) {
  return SafeArea(
    child: Wrap(children: [emptyOrder(context)]),
  );
}

Container emptyOrder(context) {
  return Container(
      // color: Color(0xFFEEEEEE),
      height: MediaQuery.of(context).size.height / 1.2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.shopping_bag_rounded,
                color: Color(0xffa75264
),
                size: 40.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "No orders yet",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff000000),
                  fontFamily: "Montserrat",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "You have not placed any orders yet.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ],
        ),
      ));
}

class _OrderState extends State<Order> {
  Future<Null> _re() async {
    await new Future.delayed(new Duration(seconds: 0));
    setState(() {
      refreshOrderList = true;
    });

    fetchWpPosts(context).then((_second) {
      setState(() {
        refreshOrderList = false;
      });
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xffd0d0d0
),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: Text(
              "Orders",
              style: TextStyle(color: Colors.black),
            )),
        body: RefreshIndicator(
          onRefresh: _re,
          child: ListView(children: [
            FutureBuilder(
                future: getData(context),
                builder: (conxtet, snapshot) {
                  if (snapshot.data == null || refreshOrderList == true) {
                    return LinearProgressIndicator(
                      backgroundColor: Colors.orangeAccent,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    );
                  } else if (snapshot.data != null &&
                      snapshot.data.isNotEmpty &&
                      refreshOrderList == false) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                          child: Text(
                            "List of orders placed",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600]),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DataTable(
                                columnSpacing:
                                    MediaQuery.of(context).size.width / 12,
                                columns: <DataColumn>[
                                  DataColumn(
                                    label: Text(
                                      'Orders',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Status',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Actions',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                                rows: snapshot.data
                                    .map<DataRow>((datas) => DataRow(cells: [
                                          DataCell(
                                              Text(' ${datas.product_id} ')),
                                          DataCell(
                                              Text(' ${getDate(datas.date)} ')
                                              //Text('${datas.date}')
                                              ),
                                          DataCell(Text(' ${datas.status} ')),
                                          DataCell(Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(((double.parse(datas.total) *
                                                              fac)
                                                          .round() /
                                                      fac)
                                                  .toString()),
                                            ],
                                          )),
                                          DataCell(
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                3.0)),
                                                    color: Color(0xffa75264),
                                                    border: Border.all(
                                                      color: Color(0xffa75264),
                                                    ),
                                                  ),
                                                  child: Text('View',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.white))),
                                              onTap: () {
                                            print(
                                                '------------------here"s data----------------------');
                                            print(datas);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewOrder(datas)));
                                          }),
                                        ]))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  if (snapshot.data.isEmpty) {
                    return safeArea(context);
                  }
                  return CircularProgressIndicator();
                }),
          ]),
        ));
  }
}

getDate(String data) {
  var indexOfLetter;
  if (data.contains("T")) {
    //lastIndex=data.length-1;
    indexOfLetter = data.indexOf("T");

    return data.substring(0, indexOfLetter);
  }
}
