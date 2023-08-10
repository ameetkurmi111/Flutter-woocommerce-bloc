import 'package:flutter/material.dart';

class ShortDescritption extends StatefulWidget {
  String productName;
  String description;
  ShortDescritption({this.description, this.productName});

  @override
  _ShortDescritptionState createState() => _ShortDescritptionState();
}

class _ShortDescritptionState extends State<ShortDescritption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa75264
),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "${widget.productName}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12.0),
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                // width: MediaQuery.of(context).size.width / 1,
                height: 1.0,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
              ),
              SizedBox(
                height: 10.0,
              ),
               Container(
                alignment: Alignment.topLeft,
                child: Text(widget.description.toString(),
                    style: TextStyle(fontSize: 14.0, color: Colors.black87)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
