library dropdown_formfield;

import 'package:cocoliebe/utils/dropdown_formfield.dart';
//import 'package:cocoliebe/utils/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class PickupTime extends StatefulWidget {
  @override
  _PickupTimeState createState() => _PickupTimeState();
}

class _PickupTimeState extends State<PickupTime> {
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 200,
                height: 80,
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  hintText: 'Please select time',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  dataSource: [
                    {
                      "Please select time": "Please select time",
                      "value": "1",
                    },
                    {
                      "11:25": "11:25",
                      "value": "2",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
