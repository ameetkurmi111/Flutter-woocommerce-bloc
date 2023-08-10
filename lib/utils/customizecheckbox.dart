import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizeCheckbox extends StatefulWidget {
  @override
  _CustomizeCheckboxState createState() => _CustomizeCheckboxState();
}

class _CustomizeCheckboxState extends State<CustomizeCheckbox> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: _isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(2.0),
          border: _isSelected
              ? null
              : Border.all(
                  color: Color(0xff00F0BC),
                  width: 1,
                  style: BorderStyle.solid,
                ),
        ),
        width: 25,
        height: 25,
        child: _isSelected
            ? Icon(
                Icons.check,
                color: Color(0xFF902326),
              )
            : null,
      ),
    );
  }
}
