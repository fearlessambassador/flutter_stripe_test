import 'package:flutter/material.dart';
import 'package:flutter_stripe_test/StripeElement.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stripe payment example"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: StripePaymentHtmlView(
              key: ValueKey("stripe-payment"),
            )
          ),
        ),
      ),
    );
  }
}