@JS()
library stripe_payment_html_view_lib; // Cannot avoid the library annotation

import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:js/js.dart';

import 'package:uuid/uuid.dart';

@JS()
external stripeInit();
external mountCard(cardElement, cardErrors);

class StripePaymentHtmlView extends StatefulWidget {
  StripePaymentHtmlView({
    required Key key,
  }) : super(key: key);

  @override
  _StripePaymentHtmlViewState createState() => _StripePaymentHtmlViewState();
}

class _StripePaymentHtmlViewState extends State<StripePaymentHtmlView> {
  late String paymentLabel;
  late BodyElement body;
  late HtmlElementView elm;
  var stripeCardElement;

  @override
  void initState() {
    const Uuid uuid = Uuid();
    paymentLabel = "stripe-payment-view-" + uuid.v4();

    body = BodyElement()
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

    elm = HtmlElementView(
      viewType: paymentLabel,
    );

    stripeInit();
    stripeCardElement = mountCard(card, cardErrors);

    super.initState();
  }

  @override
  void dispose() {
    stripeCardElement.unmount();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(elm.viewType);
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Container(
          height: 100,
          child: Center(
            child: elm,
          ),
        ),
      ],
    );
  }
}
