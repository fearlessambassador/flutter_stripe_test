@JS()
library stripe_payment_html_view_lib; // Cannot avoid the library annotation

import 'dart:html';
import 'dart:js_util';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'dart:js' as js;

import 'package:uuid/uuid.dart';

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
  final GlobalKey _paymentKey = GlobalKey();
  late String paymentLabel;

  String generateId() {
    Uuid uuid = Uuid();
    return uuid.v4();
  }

  @override
  void initState() {

    String id = generateId();
    paymentLabel = "stripe-payment-" + id;

    BodyElement body = BodyElement();

    DivElement card = DivElement()
      ..id = "card-element"
      ..style.border = "none";

    DivElement cardErrors = DivElement()
      ..id = "card-errors"
      ..style.border = "none";

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
              key: _paymentKey,
              viewType: paymentLabel,
            ),
          ),
        ),
      ],
    );
  }
}
