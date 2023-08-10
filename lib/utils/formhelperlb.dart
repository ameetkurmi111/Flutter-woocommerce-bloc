import 'package:flutter/material.dart';
import 'package:cocoliebe/routes/login.dart';

class FormHelperLB {
  static Widget textInput(
    BuildContext context,
    TextEditingController controlName,
    bool _autovalidate,
    Function onChanged, {
    bool isTextArea = false,
    bool isNumberInput = false,
    obscureText: false,
    Function onValidate,
    Widget prefixIcon,
    Widget suffixIcon,
  }) {
    return TextFormField(
      // ignore: deprecated_member_use
      autovalidate: _autovalidate,
      decoration: fieldDecoration(
        context,
        "",
        "",
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      maxLines: !isTextArea ? 1 : 3,
      keyboardType: isNumberInput ? TextInputType.number : TextInputType.text,
      onChanged: (String value) {
        return onChanged(value);
      },
      validator: (value) {
        return onValidate(value);
      },
      controller: controlName,
    );
  }

  static InputDecoration fieldDecoration(
    BuildContext context,
    String hintText,
    String helperText, {
    Widget prefixIcon,
    Widget suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(8),
      hintText: hintText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black12,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffa75264),
          width: 1,
        ),
      ),
    );
  }

  static Widget fieldLabel(String labelName) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Text(
        labelName,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: "Montserrat",
        ),
      ),
    );
  }

  static Widget saveButton(String buttonText, Function onTap,
      {String color, String textColor, bool fullWidth}) {
    return Container(
      height: 70.0,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff010101),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Color(0xff010101),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showMessage(
    BuildContext context,
    String title,
    String message,
    // String buttonText,
    // Function onPressed,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        if (title == "Successful") {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (Route<dynamic> route) => false);
          });

          return AlertDialog(
            title: new Text(title),
            content: new Text(message),
            // actions: [
            // new ElevatedButton(
            //   style: ElevatedButton.styleFrom(primary: Color(0XFF2173F5)),
            //   onPressed: () {
            //     return onPressed();
            //   },
            //   child: new Text(
            //     buttonText,
            //     style: TextStyle(color: Colors.white),
            //   ),
            // )
            // ],
          );

          // return Navigator.of(context).push(MaterialPageRoute(
          //                             builder: (context) => Login()));
        } else {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: new Text(title),
            content: new Text(message),
          );
        }

        // actions: [
        //    ElevatedButton(
        //     onPressed: () {
        //       return onPressed();
        //     },
        //     child: Text(buttonText),
        //   )
        // ],
      },
    );
  }
}
