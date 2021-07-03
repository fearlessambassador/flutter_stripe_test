import 'package:flutter/material.dart';
import 'package:flutter_stripe_test/Home.dart';
import 'package:flutter_stripe_test/StripeElement.dart';

class StripeElementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stripe payment example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                  .pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Home(),
                    ),
                );
              },
              child: Text("Go back")
            ),
            Container(
              width: 300,
              child: StripePaymentHtmlView(
                key: ValueKey("stripe-element"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
