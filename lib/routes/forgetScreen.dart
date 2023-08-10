import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  String email;
  GlobalKey<FormState> globalFormKey = GlobalKey(); //tells change about state
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Forgot password',
                style: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                WebView(
                  initialUrl: "https://www.cocoliebe.com/mein-konto/",
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (finish) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                isLoading
                    ? LinearProgressIndicator(
                        backgroundColor: Colors.orangeAccent,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                        // valueColor: ,
                      )
                    : Stack(),
              ],
            )));
  }
}

// class Forgot extends StatelessWidget {
//   String email;
//   GlobalKey<FormState> globalFormKey = GlobalKey(); //tells change about state
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0.0,
//               leading: BackButton(
//                 color: Colors.black,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               title: Text(
//                 'Forgot password',
//                 style: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
//               ),
//               centerTitle: true,
//             ),
//             body: WebView(
//               initialUrl:
//                   "https://www.aashish.de/wp-login.php?action=lostpassword",
//               javascriptMode: JavascriptMode.unrestricted,
//               onPageFinished: (finish){

//                   setState(() {
//                     isLoading = false;
//                   });
//               },
//             )));
//   }
// }