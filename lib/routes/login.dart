import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cocoliebe/api_service.dart';
import 'package:cocoliebe/models/tryModel.dart';
import 'package:cocoliebe/routes/forgetScreen.dart';
import 'package:cocoliebe/routes/restaurant_homepage.dart';
import 'package:cocoliebe/routes/signuppagelb.dart';
import 'package:cocoliebe/services/shared_service.dart';
import 'package:cocoliebe/utils/ProgressHUD.dart';
import 'package:cocoliebe/utils/form_helper.dart';

import '../main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:woocommerce/routes/firstpage.dart';
// import 'package:woocommerce/routes/maindrawerlb.dart';
// import 'package:woocommerce/routes/restaurant_homepage.dart';
// import 'package:woocommerce/routes/signuppagelb.dart';
// import 'package:woocommerce/utils/ProgressHUD.dart';
// import 'package:woocommerce/api_service.dart';
// import 'package:woocommerce/routes/forgetScreen.dart';
// import 'package:woocommerce/utils/form_helper.dart';
// import 'package:woocommerce/services/shared_service.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart'; //for facebook login icon

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> globalFormKey = GlobalKey(); //tells change about state
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String username;
  String password;

  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.1,
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              // color: const Color(0xFF0E3311).withOpacity(0.2),
              padding: EdgeInsets.all(12.0),

              // child: Center(
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: globalFormKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.0),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(CupertinoIcons.arrow_left),
                          color: Colors.black,
                          onPressed: () {
                            //Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          },
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: "Montserrat"),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    // SizedBox(
                    //   height: 60.0,
                    //   width: double.infinity,
                    //   child: SignInButton(
                    //     Buttons.FacebookNew,
                    //     text: "Sign up with Facebook",
                    //     onPressed: () {
                    //       print("Facebook button is pressed");
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: 20.0),

                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            child: Text(
                              "Username (email)",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: "Montserrat",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (input) => username = input,
                      validator: (input) => !input.contains("@")
                          ? "Email address is required"
                          : null,
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Password",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: "Montserrat",
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          Forgot())); //insert navigate to anotherpage
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                      color: Color(0xffa75264),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: Theme.of(context).accentColor.withOpacity(0.4),
                          icon: Icon(
                            hidePassword
                                ? Icons
                                    .visibility_off //sets icon visibility on/off
                                : Icons.visibility,
                            color: Color(0xffa75264),
                          ),
                        ),
                      ),
                      obscureText: hidePassword,
                      onSaved: (input) => password = input,
                      validator: (input) => input.length == 0
                          ? "Password required."
                          : input.length < 8
                              ? "*Password should be more than 7 character"
                              : null,
                    ),
                    SizedBox(height: 25.0),
                    Center(
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        splashColor: Colors.white70,
                        height: 60.0,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 15,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff010101),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),

                            onPressed: () {
                              if (validateAndSave()) {
                                loginCustomer(username, password);
                                setState(() {
                                  isApiCallProcess = true;
                                });
                                loginCustomer(username, password).then((ret) =>
                                    {
                                      setState(() {
                                        isApiCallProcess = false;
                                      }),
                                      if (ret != null)
                                        {
                                          basketDataForSearch.clear(),
                                          countDataForSearch[0].itemCount = 0,
                                          basketDataForSearch.clear(),
                                          productItem = null,
                                          myList = null,
                                          SharedService.setLoginDetails(ret),
                                          // Navigator.of(context,
                                          //         rootNavigator: true)
                                          //     .pop(),
                                          FormHelper.showMessage(
                                            scaffoldKey.currentContext,
                                            "Greetings",
                                            "${ret.displayName}",
                                            // "Let's go",
                                          ),
                                        }
                                      else
                                        {
                                          FormHelper.showMessage(
                                            scaffoldKey.currentContext,
                                            "Sorry",
                                            "Login Not Successful",
                                            //   "Ok", () {
                                            // Navigator.pop(context);
                                            // }
                                          ),
                                        }
                                    });
                              }
                            },
                            child: isApiCallProcess == true
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  )
                                : Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0,
                                      fontFamily: "Montserrat-Regular",
                                    ),
                                  ),
                            // color: Color(0XFF2173F5),
                            // elevation: 10.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff010101),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPageLB()),
                          );
                        },
                        child: Center(
                          child: Text(
                            "Create account",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                              fontFamily: "Montserrat-Regular",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
