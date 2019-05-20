import 'package:emania/import.dart';
import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    a();
  }

  void a() {
    //var b = Data.request();
    Timer(Duration(seconds: 4), () => navigate());
  }

  void navigate() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, //Color.fromRGBO(149, 27, 57, 100.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Image.asset(
                "media/emania40.png",
                fit: BoxFit.fill,
              ),
              width: 230.0,
              height: 160.0,
            ),
            SizedBox(
              height: 40.0,
            ),
            SpinKitDoubleBounce(
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

//color: Color.fromRGBO(149, 27, 57, 100.0),
