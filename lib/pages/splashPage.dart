import 'package:emania/import.dart';
import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    
    
  }
  void a(){
    var b = Data.request();
    Timer(Duration(seconds: 2), () => navigate());
  }
void navigate (){
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
        color: Color.fromRGBO(149, 27, 57, 100.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset("media/emania-40.png"),
              width: 200.0,
              height: 400.0,
            ),
            SizedBox(
              height: 100.0,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

//color: Color.fromRGBO(149, 27, 57, 100.0),
