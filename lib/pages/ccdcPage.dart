import 'dart:core';

import 'package:flutter/material.dart';
import 'package:emania/import.dart';

class CCDCPage extends StatefulWidget {
  final String name;
  final String address;
  final String phone;
  CCDCPage(this.name, this.address, this.phone);
  @override
  _CCDCPageState createState() => _CCDCPageState();
}

class _CCDCPageState extends State<CCDCPage> {
  var ccn = "";
  var ccv = "";
  var ey = "";
  var em = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Payment"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Material(
              elevation: 50.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "Contact Details",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      bottom: 5.0,
                      top: 5.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Card No.",
                      ),
                      onChanged: (a) => ccn = a,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      bottom: 5.0,
                      top: 5.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Expire Month",
                      ),
                      onChanged: (a) => em = a,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      bottom: 20.0,
                      top: 5.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Expire Year",
                      ),
                      onChanged: (a) => ey = a,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      bottom: 20.0,
                      top: 5.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "CCV",
                      ),
                      onChanged: (a) => ccv = a,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: RaisedButton(
              child: Text(
                "Continue to Payment",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                pay();
              },
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              elevation: 50.0,
            ),
          ),
        ],
      ),
    );
  }

  void pay() async {
    paymentCCDC(ccn, ey, em, ccv, widget.name, widget.address, widget.phone);
  }
}
