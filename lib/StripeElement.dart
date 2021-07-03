@JS()
library stripe_payment_html_view_lib; // Cannot avoid the library annotation

import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'dart:js' as js;

@JS()
external setUpPaymentIntent(language);

class StripePaymentHtmlView extends StatefulWidget {
  StripePaymentHtmlView({
    required Key key,
  }) : super(key: key);

  @override
  _StripePaymentHtmlViewState createState() => _StripePaymentHtmlViewState();
}

class _StripePaymentHtmlViewState extends State<StripePaymentHtmlView> {
  late String paymentLabel;

  @override
  void initState() {

    paymentLabel = "stripe-payment-view";

    BodyElement body = BodyElement()
      ..style.height = "100%"
      ..style.width = "100%";

    DivElement card = DivElement()
      ..id = "card-element"
      ..style.border = "none"
      ..style.height = "100%"
      ..style.width = "100%";

    DivElement cardErrors = DivElement()
      ..id = "card-errors"
      ..style.border = "none"
      ..style.height = "100%"
      ..style.width = "100%";

    body.append(card);
    body.append(cardErrors);

    ui.platformViewRegistry
        .registerViewFactory(paymentLabel, (int viewId) => body);

    js.context.callMethod("stripeInit", ['en']);
    js.context.callMethod("mountCard", [card, cardErrors]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Container(
          height: 100,
          child: Center(
            child: HtmlElementView(
              viewType: paymentLabel,
            ),
          ),
        ),
      ],
    );
  }
}
