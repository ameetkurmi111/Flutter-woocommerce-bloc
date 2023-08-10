import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:cocoliebe/models/post_model.dart';
import 'package:cocoliebe/routes/checkout.dart';
import 'package:cocoliebe/routes/view_order.dart';
import 'package:cocoliebe/services/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../models/tryModel.dart';
import '../routes/restaurant_homepage.dart';

class Basket extends StatefulWidget {
  List countt;
  List basketData;
  List selectedItemList;
  bool buttonenabled = false;

  Basket(this.countt, this.basketData, this.selectedItemList);
  @override
  _CheckoutWidgetState createState() =>
      _CheckoutWidgetState(this.countt, this.basketData, this.selectedItemList);
}

List store = [];

PostCode selectedItem;
int decimals = 2;
int fac = pow(10, decimals);

class _CheckoutWidgetState extends State<Basket> {
  List countt;
  List basketData;
  List selectedItemList;

  var _checkoutOptionIndex = 0;

  int initialIndex = 0;

  _CheckoutWidgetState(this.countt, this.basketData, this.selectedItemList);
  List<DropdownMenuItem<PostCode>> _dropdownMenuItems;

  double minCost = 0; //minimum required cost for order
  var actualPrice;
  var grandTotal;
  double total = 0;

  @override
  void initState() {
    super.initState();
    List<PostCode> _dropdownItems = [
      PostCode(1, "14770", 15.0),
      PostCode(2, "14776", 15.0),
      PostCode(3, "14772", 15.0),
      PostCode(4, "14778", 15.0),
    ];
    selectedItem = selectedItemList[0];

    for (var i = 0; i < _dropdownItems.length; i++) {
      if (_dropdownItems[i].name == selectedItem.name) {
        _dropdownItems.removeAt(i);
        _dropdownItems.insert(i, selectedItemList[0]);
        break;
      }
    }
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    //selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<PostCode>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<PostCode>> items = List();
    for (PostCode listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    //Map<String, String> _productNamePrice = Map<String, String>();

    return WillPopScope(
      onWillPop: () async => false,
      child: ChangeNotifierProvider(
        create: (context) => TryModel(),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffd0d0d0
),
            title: Text(
              'Basket',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                store.clear();
                store.add(countt);
                store.add(selectedItem);
                print('----------------------><-----------------------');
                print(store);
                showBasketBar = true;
                basketPageIsPressed = true;
                Navigator.pop(context, store);
              },
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Consumer<TryModel>(
                builder: (context, data, child) => Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          itemCount: basketData.length,
                          itemBuilder: (BuildContext context, int count) {
                            //String key = _productNamePrice.keys.elementAt(count);

                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              key: UniqueKey(),
                              background: Container(
                                  color: Color(0xffa75264),
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.remove_shopping_cart_outlined,
                                        size: 40.0,
                                      ))),
                              onDismissed: (direction) {
                                //  removeFromCart(key);
                                setState(() {
                                  countt[0].itemCount = countt[0].itemCount -
                                      basketData[count].itemIndexCount;
                                  basketData.removeAt(count);
                                });
                              },
                              child: Card(
                                color: Color(0xffedf1ff),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(children: [
                                    ListTile(
                                        onTap: () {
                                          print(basketData[count].productId);
                                          print(basketData[count].taxClass);
                                        },
                                        leading: Text(basketData[count]
                                            .itemIndexCount
                                            .toString()),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(basketData[count].productName),
                                            SizedBox(height: 5),
                                            // Text(
                                            //   parse(basketData[count]
                                            //           .description)
                                            //       .documentElement
                                            //       .text,
                                            //   style: TextStyle(
                                            //       fontSize: 14.0,
                                            //       color: Colors.grey),
                                            // ),
                                          ],
                                        ),
                                        subtitle:
                                            basketData[count].choice != null
                                                ? Text(basketData[count].choice)
                                                : Container(),
                                        trailing: Text(
                                            (((basketData[count].price) * fac)
                                                        .round() /
                                                    fac)
                                                .toString())

                                        ///'${_productNamePrice[key].toString()} €'),
                                        ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // InkWell(
                                        //   child: Text('Add Note',
                                        //       style: TextStyle(color: Colors.blue)),
                                        //   onTap: () {},
                                        // ),
                                        Container(
                                          child: Row(children: [
                                            InkWell(
                                              onTap: () {
                                                //calculating actual price

                                                actualPrice =
                                                    basketData[count].price /
                                                        basketData[count]
                                                            .itemIndexCount;
                                                setState(() {
                                                  //substraction
                                                  //subtracting price
                                                  basketData[count].price =
                                                      basketData[count].price -
                                                          actualPrice;

                                                  //subtracting itemindexcount
                                                  basketData[count]
                                                          .itemIndexCount =
                                                      basketData[count]
                                                              .itemIndexCount -
                                                          1;
                                                  countt[0].itemCount =
                                                      countt[0].itemCount - 1;

                                                  if (basketData[count]
                                                          .itemIndexCount ==
                                                      0) {
                                                    basketData.removeAt(count);
                                                  }
                                                });
                                              },
                                              child: Icon(Icons.remove,
                                                  color: Color(0xffa75264
)),
                                            ),
                                            SizedBox(width: 10.0),
                                            InkWell(
                                                onTap: () {
                                                  //addition
                                                  actualPrice =
                                                      basketData[count].price /
                                                          basketData[count]
                                                              .itemIndexCount;

                                                  setState(() {
                                                    //addition
                                                    //addition price
                                                    basketData[count].price =
                                                        basketData[count]
                                                                .price +
                                                            actualPrice;

                                                    //addition itemindexcount
                                                    basketData[count]
                                                            .itemIndexCount =
                                                        basketData[count]
                                                                .itemIndexCount +
                                                            1;
                                                    countt[0].itemCount =
                                                        countt[0].itemCount + 1;
                                                  });
                                                },
                                                child: Icon(Icons.add,
                                                    color: Color(0xffa75264
))),
                                          ]),
                                        )
                                      ],
                                    )
                                    // Text("Item Name: "+key, style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 21.0),),
                                    // Text("Price: "+_productNamePrice[key].toString()+"\$", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 21.0))
                                  ]),
                                ),
                              ),
                            );
                          }),
                    ),
                    Divider(),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Column(children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text("Subtotal"), Text("${getTotal()}")

                          //     ],
                          // ),
                          // SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Post Code"),
                              DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint: Text('Select'),
                                  value: selectedItem,
                                  items: _dropdownMenuItems,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedItem = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" ${getTotal()}€")
                            ],
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToggleSwitch(
                          initialLabelIndex: _checkoutOptionIndex,
                          inactiveBgColor: Colors.grey[300],
                          totalSwitches:1,
                          // labels: ['Pickup', 'Delivery'],
                             labels: ['Pickup'],
                          activeBgColors: [
                            [Color(0xff010101
)],
                            [Color(0xff010101
)]
                          ],
                          onToggle: (int index) {
                            setState(() {
                              _checkoutOptionIndex = index;
                            });
                            initialIndex = index;
                          },
                        ),
                      ],
                    ),

                    if ((total) < (minCost = selectedItem.price.toDouble()) ||
                        total < 15.00)
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: Color(0xffa75264)Accent,
                                  //   width: 10,
                                  // ),
                                  color: Color(0xffff0000
),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.,
                                  children: [
                                    Text(
                                      // "You must purchase a minimum of € 5.00 for pickup and € 15.00 for delivery.",
                                       "You must purchase a minimum of € 5.00 for pickup.",
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       "Remaining amount to reach minimum order value: ",
                                    //       style: TextStyle(
                                    //           fontSize: 12.0,
                                    //           color: Colors.white),
                                    //     ),
                                    //     //  Text(
                                    //     //   '${minCost - (total)}€ and ${_selectedItem.price}€',
                                    //     //   style: TextStyle(fontSize: 12.0),
                                    //     // ),
                                    //     conv(selectedItem.price, total),

                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 10.0,
                              // ),
                              // Container(
                              //     width:
                              //         MediaQuery.of(context).size.width / 1,
                              //     child: Text(
                              //       "Unfortunately, we cannot ship yet for your location, CoColiebe delivers orders starting from a minimum order value of ${selectedItem.price +5}€ (excl. delivery cost)",
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.w500,
                              //           fontSize: 9.0),
                              //     )),
                              // SizedBox(
                              //   height: 10.0,
                              // ),
                              // Divider(),
                              // Spacer(),
                            ],
                          ),
                        ),
                      )
                    else
                      Container(
                        child: Text(""),
                      ),

                    // (total) < (minCost = selectedItem.price.toDouble()) ||
                    //         total < 15.0
                    //     ? ButtonTheme(
                    //         buttonColor: Colors.white,
                    //         height: 50.0,
                    //         minWidth: double.infinity,
                    //         child: RaisedButton(
                    //           elevation: 0.0,
                    //           color: Colors.white,
                    //           onPressed: () {
                    //             store.clear();
                    //             store.add(countt);
                    //             store.add(selectedItem);
                    //             print(
                    //                 '----------------------><-----------------------');
                    //             print(store);
                    //             Navigator.pop(context, store);
                    //           },
                    //           child: Text(
                    //             "Add more Items",
                    //             style: TextStyle(
                    //                 color: Color(0xff902326), fontSize: 18.0),
                    //           ),
                    //         ),
                    //       )
                    //CheckOut(selectedItem)
                    ButtonTheme(
                      buttonColor: Color(0xffa75264
),
                      height: 50.0,
                      minWidth: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          elevation: 0.0,
                          color: Color(0xff010101
),
                          onPressed: (_checkoutOptionIndex == 0 && total > 5) ||
                                  (_checkoutOptionIndex == 1 && total > 15)
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CheckOut(selectedItem)),
                                  );
                                }
                              : null,
                          child: Text(
                            "Checkout  ${total}€",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                    )
                    // ListTile(
                    //   title: Text("Total Price"),
                    //   subtitle: Text(total.toString()+"\$"),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget conv(var a, var b) {
    var c = 5 + a - b;
    c = (c * fac).round() / fac;
    return Text(
      '$c €',
      style: TextStyle(
          fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  getTotal() {
    if (total != null) {
      total = 0;
    }
    for (var i = 0; i < basketData.length; i++) {
      total = total + basketData[i].price;
      total = (total * fac).round() / fac;

      // print('------------------>total here<--------------------');
      // print(total);
    }
    SharedService.Save(total);
    return total;
  }
}
