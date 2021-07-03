import 'package:flutter/material.dart';
import 'package:flutter_stripe_test/StripeElementPage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // no difference when value is true (default)
      appBar: AppBar(
        title: Text("Stripe payment example"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                  .pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => StripeElementPage(),
                    ),
                );
              },
              child: Text("Go to Stripe Element")
            )
          ),
        ),
      ),
    );
  }
}