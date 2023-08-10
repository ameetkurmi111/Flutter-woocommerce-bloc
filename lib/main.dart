import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:cocoliebe/routes/restaurant_homepage.dart';
// import 'package:homepage/screens/restaurant_page.dart';
// import 'screens/restaurant_page.dart';
// import 'src/app.dart';
import './routes/restaurant_homepage.dart';
import 'models/tryModel.dart';
// import './models/tab_bar_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // statusBarColor: Color(0xffdb3333),
      statusBarColor: Color(0xffd0d0d0),

      //Color(0xff902326)
      //statusBarBrightness: Brightness.dark,
      //statusBarIconBrightness: Brightness.light, // status bar icon color
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: Color.fromRGBO(255, 128, 0, .1),
    100: Color.fromRGBO(255, 128, 0, .2),
    200: Color.fromRGBO(255, 128, 0, .3),
    300: Color.fromRGBO(255, 128, 0, .4),
    400: Color.fromRGBO(255, 128, 0, .5),
    500: Color.fromRGBO(255, 128, 0, .6),
    600: Color.fromRGBO(255, 128, 0, .7),
    700: Color.fromRGBO(255, 128, 0, .8),
    800: Color.fromRGBO(255, 128, 0, .9),
    900: Color.fromRGBO(255, 128, 0, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoColiebe',
      supportedLocales: [
        Locale('en'),
        Locale('de'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Color(0xffa75264)),
        primarySwatch: MaterialColor(0xffa75264, color),
        // Color(0xFF902326),
        //primaryColor:Colors.white,
        //  accentColor: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => TryModel(),
          builder: (context, child) => RestaurantPage(),
        ),
      ),
      // home: RestaurantPage(),
    );
  }
}
