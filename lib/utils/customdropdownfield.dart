import 'package:flutter/material.dart';

class customDropDownFormField extends StatefulWidget {
  @override
  _customDropDownFormFieldState createState() =>
      _customDropDownFormFieldState();
}

class _customDropDownFormFieldState extends State<customDropDownFormField> {
  int _currentTimeValue = 0;

  setSelectedRadio(int val) {
    setState(() {
      setSelectedRadio(val);
    });
  }

  String _ratingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          icon: Container(
            padding: EdgeInsets.only(right: 15, top: 4),
            child: Icon(Icons.arrow_forward_ios_outlined),
          ),

          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
          ),

          value: _ratingController,
          items: [
            "Please select time",
            "10:30",
            "10:45",
            "11:00",
            "11:15",
            "11:30",
            "11:45",
            "12:15",
            "12:30",
            "12:45",
            "13:00",
            "13:15",
            "13:30",
            "13:45",
            "14:00",
            "14:15",
            "14:30",
            "14:45",
            "15:00",
            "15:15",
            "15:30",
            "15:45",
            "16:00",
            "16:15",
            "16:30",
            "16:45",
            "17:00",
            "17:15",
            "17:30",
            "17:45",
            "18:00",
            "18:15",
            "18:30",
            "18:45",
            "19:00",
            "19:15",
            "19:30",
            "19:45",
            "20:00",
            "20:15",
            "20:30",
            "20:45",
            "21:00",
            "21:15",
            "21:30",
            "21:45",
            "22:00",
          ]
              .map((label) => DropdownMenuItem(
                    child: Container(
                        padding: EdgeInsets.only(right: 25, top: 6),
                        child: Text("   " + label.toString())),
                    value: label,
                  ))
              .toList(),
          hint: Container(
              padding: EdgeInsets.only(top: 6),
              child: Text("   Please select time")),
          onChanged: (value) {
            setState(() {
              _ratingController = value;
            });
          },
        ),
      ),
    );
  }
}
