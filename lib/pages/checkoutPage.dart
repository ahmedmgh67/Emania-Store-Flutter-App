import 'package:emania/import.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final amount;
  CheckoutPage(this.amount);
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool ccdc = false;
  bool cod = false;

  String address = "";
  String phone = "";
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Checkout"), centerTitle: true),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Material(
                elevation: 50.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: CheckboxListTile(
                          title: Text("Cash on Delivery"),
                          subtitle: Text("Pay when Delivred at Your Door Step"),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: cod,
                          onChanged: (value) => codccdc(value, "cod")),
                    ),
                    Divider(
                      height: 3.0,
                      color: Colors.black,
                    ),
                    Container(
                      child: CheckboxListTile(
                          title: Text("Credit Card or Debit Card"),
                          subtitle: Text(
                              "Pay with Your Credit Card or Debit Card from Visa or Master Card"),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: ccdc,
                          onChanged: (value) => codccdc(value, "ccdc")),
                    ),
                  ],
                ),
              ),
            ),
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
                          labelText: "Name",
                        ),
                        onChanged: (a) => name = a,
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
                          labelText: "Address",
                        ),
                        onChanged: (a) => address = a,
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
                          labelText: "Phone No.",
                        ),
                        onChanged: (a) => phone = a,
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
                onPressed: () => continueToPayment(),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 10.0,
                ),
                elevation: 50.0,
              ),
            ),
          ],
        ));
  }

  void codccdc(val, type) {
    if (type == "cod") {
      if (cod) {
        setState(() {
          cod = false;
        });
      } else {
        setState(() {
          cod = true;
          ccdc = false;
        });
      }
    } else {
      if (ccdc) {
        setState(() {
          ccdc = false;
        });
      } else {
        setState(() {
          ccdc = true;
          cod = false;
        });
      }
    }
  }

  void continueToPayment() async {
    if (phone == "" || name == "" || address == "") {
      showaboutDialog(
          context: context,
          title: "Error",
          content: "Please Supply all the Fields",
          buText: "",
          onPress: null);
    } else {
      if (ccdc) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CCDCPage(name, address, phone)));
      } else {
        paymentCOD(name, address, phone);
      }
    }
  }

  void showaboutDialog({BuildContext context, String title, String content, String buText,Function onPress}) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(
          title,
          //textAlign: TextAlign.center,
        ),
        content: new Text(content),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text(buText),
            onPressed: onPress,
          )
        ],
      );
    },
  );
}


  /*
  Future<void> _onStartCardEntryFlow() async {
    print("starting");
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  
  void _onCancelCardEntryFlow() {
  }
  void  _onCardEntryCardNonceRequestSuccess(CardDetails result) async {
    try {
      InAppPayments.completeCardEntry(onCardEntryComplete: _onCardEntryComplete);
    } on Exception catch (ex) {
      InAppPayments.showCardNonceProcessingError(ex.toString());
    }
  }
  void _onCardEntryComplete() {}*/
}
