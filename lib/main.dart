import 'dart:async';

import 'package:finacash/screen/InicialPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

main() {
  initializeDateFormatting().then((_) {
    runApp(MaterialApp(
        // home: InicialPage(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/HomeScreen': (BuildContext context) => new InicialPage()
        }));
  });
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: Image(image: AssetImage('dev_assets/celengan-removebg.png'))),
    );
  }
}
