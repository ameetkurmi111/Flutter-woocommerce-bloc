import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cocoliebe/models/customerlb.dart';
import 'package:cocoliebe/routes/login.dart';
import 'package:cocoliebe/routes/privacypolicy.dart';
import 'package:cocoliebe/routes/restaurant_homepage.dart';
import 'package:cocoliebe/routes/termsofcondition.dart';
import 'package:cocoliebe/services/apiservicelb.dart';
import 'package:cocoliebe/utils/customizecheckbox.dart';
import 'package:cocoliebe/utils/formhelperlb.dart';
import 'package:cocoliebe/utils/progresshudlb.dart';
import 'package:cocoliebe/utils/validatorservicelb.dart';
// import 'package:woocommerce/routes/firstpage.dart';
// import 'package:woocommerce/routes/login.dart';
// import 'package:woocommerce/routes/maindrawerlb.dart';
// import 'package:woocommerce/routes/restaurant_homepage.dart';
// import 'package:woocommerce/services/apiservicelb.dart';
// import 'package:woocommerce/models/customerlb.dart';
// import 'package:woocommerce/utils/customizecheckbox.dart';
// import 'package:woocommerce/utils/formhelperlb.dart';
// import 'package:woocommerce/utils/progresshudlb.dart';
// import "package:woocommerce/utils/validatorservicelb.dart";

class SignUpPageLB extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPageLB> {
  CustomerModelLB model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool change = false;
  bool isApiCallProcess = false;

  @override
  void initState() {
    model = CustomerModelLB();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => RestaurantPage()),
            // );
          },
        ),
        title: Text(
          "Create Account",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        child: ProgressHUDLB(
          child: Form(
            key: globalKey,
            child: _formUI(),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  var confirmPass;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController pass2Controller = TextEditingController();
  bool __validate = false;
  bool ret = false;

  Widget _formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHelperLB.fieldLabel("Your first name"),
                FormHelperLB.textInput(
                  context,
                  nameController,
                  __validate,
                  (value) => {
                    this.model.first_name = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return "Please enter your first name.";
                    }
                    return null;
                  },
                ),
                FormHelperLB.fieldLabel("Your last name"),
                FormHelperLB.textInput(
                  context,
                  surnameController,
                  __validate,
                  (value) => {
                    this.model.first_name = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return "Please enter your last name.";
                    }
                    return null;
                  },
                ),
                FormHelperLB.fieldLabel("Email address"),
                FormHelperLB.textInput(
                  context,
                  emailController,
                  __validate,
                  (value) => {
                    this.model.email = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return "Please enter your Email address.";
                    }
                    if (value.isNotEmpty && !value.toString().isValidEmail()) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
                FormHelperLB.fieldLabel("Password"),
                FormHelperLB.textInput(
                  context,
                  passController,
                  __validate,
                  (value) => {
                    this.model.password = value,
                  },
                  onValidate: (value) {
                    confirmPass = value;
                    if (value.toString().isEmpty) {
                      return "Please enter your Password.";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters long.";
                    } else {
                      return null;
                    }
                  },
                  obscureText: hidePassword,
                ),
                FormHelperLB.fieldLabel("Confirm password"),
                FormHelperLB.textInput(
                  context,
                  pass2Controller,
                  __validate,
                  (value) => {
                    this.model.password = value,
                  },
                  onValidate: (value) {
                    if (value.toString().isEmpty) {
                      return "Please repeat your Password.";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters long.";
                    } else if (value.toString() != confirmPass) {
                      return "Password must be same as above.";
                    } else {
                      return null;
                    }
                  },
                  obscureText: hidePassword,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: FormHelperLB.saveButton(
                    "Register",
                    () {
                      if (validateAndSave() == true) {
                        setState(() {
                          isApiCallProcess = true;
                        });

                        final String name = nameController.text;
                        final String surname = surnameController.text;
                        final String email = emailController.text;
                        final String pass = passController.text;

                        createCustomer2(email, pass, name, surname).then(
                          (ischeck) {
                            setState(() {
                              isApiCallProcess = false;
                            });

                            if (ischeck) {
                              FormHelperLB.showMessage(
                                context,
                                "Successful",
                                "Registration Successful",
                                // "Ok",
                                // () {
                                //   Navigator.of(context).push(MaterialPageRoute(
                                //       builder: (context) => Login()));
                                // },
                              );
                            } else {
                              FormHelperLB.showMessage(
                                context,
                                "Sorry",
                                "Email is already registered",
                                // "Ok",
                                // () {
                                //   Navigator.of(context).pop();
                                // },
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                    text: 'By clicking on  \" Register \", you agree to our ',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13.0,
                      fontFamily: "Montserrat-Regular",
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms of Service ',
                        style: TextStyle(color: Color(0xffa75264)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Terms(),
                                ));
                          },
                      ),
                      TextSpan(text: ' and to our '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Color(0xffa75264),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PrivacyPolicy(),
                                ));
                          },
                      ),
                      // can add more TextSpans here...
                    ],
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, elevation: 0.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Center(
                    child: Text(
                      "I already have an account",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        fontFamily: "Montserrat-Regular",
                        color: Color(0xffa75264),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      setState(() => __validate = true);
    }
  }
}
