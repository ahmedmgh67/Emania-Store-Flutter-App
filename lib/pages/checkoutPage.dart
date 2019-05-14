import 'package:emania/import.dart';
import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/in_app_payments.dart' as prefix0;
import 'package:square_in_app_payments/models.dart';
class CheckoutPage extends StatefulWidget {
  final amount;
  CheckoutPage(this.amount);
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  bool ccdc = false;
  bool cod = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Material(
              elevation: 50.0,
              child:Column(
                children: <Widget>[
                  Container(
                    child: CheckboxListTile(
                      title: Text("Cash on Delivery"),
                      subtitle: Text("Pay when Delivred at Your Door Step"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: cod,
                      onChanged: (value) => codccdc(value, "cod")
                    ),
                  ),
                  Divider(
                    height: 3.0,
                    color: Colors.black,
                  ),
                  Container(
                    child: CheckboxListTile(
                      title: Text("Cash on Delivery"),
                      subtitle: Text("Pay when Delivred at Your Door Step"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: ccdc,
                      onChanged: (value) => codccdc(value, "ccdc")
                    ),
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
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top: 5.0,),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Name",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0, top: 5.0,),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Address",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0, top: 5.0,),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Phone No.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0,),
            child: RaisedButton(
              child: Text("Continue to Payment", style: TextStyle(color: Colors.white),),
              onPressed: () {continueToPayment();},
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0,),
              elevation: 50.0,
            ),
          ),  
        ],
      )
    );
  }
  void codccdc (val,type) {
    if (type == "cod"){
      
      if (cod){
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
      if (ccdc){
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

  void continueToPayment () async {
    if (ccdc){
      print("starting");
      await InAppPayments.setSquareApplicationId("sq0idp-_yj9_bWyACSjpGcb2l8Sag");
      _onStartCardEntryFlow();
    }
  }

    /** 
  * An event listener to start card entry flow
  */
  Future<void> _onStartCardEntryFlow() async {
    print("starting");
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  /**
  * Callback when card entry is cancelled and UI is closed
  */
  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  /**
  * Callback when successfully get the card nonce details for processig
  * card entry is still open and waiting for processing card nonce details
  */
  void _onCardEntryCardNonceRequestSuccess(CardDetails result) async {
    try {
      // take payment with the card nonce details
      // you can take a charge
      // await chargeCard(result);
      
      // payment finished successfully
      // you must call this method to close card entry
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
    } on Exception catch (ex) {
      // payment failed to complete due to error
      // notify card entry to show processing error
      InAppPayments.showCardNonceProcessingError(ex.toString());
    }
  }

  /**
  * Callback when the card entry is closed after call 'completeCardEntry'
  */
  void _onCardEntryComplete() {
    // Update UI to notify user that the payment flow is finished successfully
  }
}