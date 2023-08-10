import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cocoliebe/models/orderModel.dart';

class ViewOrder extends StatefulWidget {
  Ordermodel items;
  ViewOrder(this.items);

  @override
  _ViewOrderState createState() => _ViewOrderState(items);
}

int decimals = 2;
int fac = pow(10, decimals);
bool isSelected = false;
String deliveryType;
getMetaData(meta_data, String type) {
  for (var i = 0; i < meta_data.length; i++) {
    //for delivery type
    if (type == "Delivery Type") {
      if (meta_data[i].key == "delivery_type") {
        deliveryType = meta_data[i].value;
        return Text(meta_data[i].value);
      }
    }

    if (type == "Pickup Date") {
      if (meta_data[i].key == "pickup_date" ||
          meta_data[i].key == "delivery_date") {
        return Text(meta_data[i].value);
      }
    }

    if (type == "Pickup Time") {
      if (meta_data[i].key == "pickup_time" ||
          meta_data[i].key == "delivery_time") {
        return Text(meta_data[i].value);
      }
    }
  }
}

class _ViewOrderState extends State<ViewOrder> {
  Ordermodel items;

  _ViewOrderState(this.items);
  @override
  Widget build(BuildContext context) {
    print(items.consumer_id);

    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            "Order details",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xffd0d0d0),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columnSpacing: 20,
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text('Product',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ),
                            DataColumn(
                              label: Text('Quantity',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ),
                            DataColumn(
                              label: Text('Total',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ),
                          ],
                          rows: items.line_items
                              .map<DataRow>((datas) => DataRow(
                                    selected: isSelected,
                                    cells: <DataCell>[
                                      DataCell(
                                        Text('${datas.product_name}'),
                                      ),
                                      DataCell(
                                        Text('x ${datas.quantity}'),
                                      ),

                                      DataCell(Text(
                                          (((datas.price) * fac).round() / fac)
                                              .toString())),

                                      // DataCell(Text('Professional')),
                                    ],
                                  ))
                              .toList()),
                    ),
                    // child: Column(children: [

                    //   Text('Order details'),
                    //   SizedBox(height:20.0),
                    //   Column(children:[
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children:[
                    //       Text("Product"),
                    //       Text("Total"),
                    //     ]),
                    //      SizedBox(height:20.0),

                    //   ]),
                    // ],),
                    //  Spacer(),
                    SizedBox(height: 30.0),
                    Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('${items.total} €'),
                      ],
                    ),
                    // Divider(),
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text('Delivery:',
                    //           style: TextStyle(fontWeight: FontWeight.bold)),
                    //       Text('Free Shipping'),
                    //     ]),

                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment Method:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          (items.paymentMethod == "cod")
                              ? Text('Cash on delivery')
                              : Text("Paypal")
                        ]),

                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Type:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          getMetaData(items.meta_data, "Delivery Type"),
                          //Text('${items.getMetaData(meta_data).value}'),
                        ]),

                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (deliveryType == "delivery")
                              ? Text('Delivery Date:',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                              : Text('Pickup Date:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                          getMetaData(items.meta_data, "Pickup Date"),
                          //Text('${items.meta_data[3].value}'),
                        ]),

                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (deliveryType == "delivery")
                              ? Text('Delivery Time:',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                              : Text('Pickup Time:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                          getMetaData(items.meta_data, "Pickup Time"),
                          //Text('${items.meta_data[4].value}'),
                        ]),

                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('${items.total} €'),
                        ]),

                    (items.customerNote != "") ? Divider() : Container(),

                    (items.customerNote != "")
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Expanded(
                                    child: Text('Note:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),

                                Expanded(
                                    child: SizedBox(
                                  width: 30,
                                )),
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.bottomRight,
                                        child: Text('${items.customerNote}')
                                        // Text('asfhjads dfg sfg sfdgsfg sdfgsf sdgsfg sdggd sdfg')

                                        )),

                                //Text('${items.customerNote}'),
                              ])
                        : Container(),
                    Divider(),
                  ]),
            ),
          ),
        ));
  }
}
