import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:Lopy/src/presentation/widgets/common/button_widget.dart';
import 'package:Lopy/src/presentation/widgets/payment_method/new_payment_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../widgets/common/appbar_widget.dart';

@RoutePage()
class NewPaymentMethodView extends StatelessWidget {
  const NewPaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(title: "Add Card"),
      body: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, top: 20.0, right: 20.0, bottom: 30.0),
          child: Stack(
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    NewPaymentTextFieldWidget(
                        title: "CARD HOLDER NAME",
                        placeholder: "Card Holder Name"),
                    NewPaymentTextFieldWidget(
                        title: "CARD NUMBER",
                        placeholder: "____ ____ ____ ____"),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: NewPaymentTextFieldWidget(
                                title: "EXPIRE DATE", placeholder: "MM/YYYY")),
                        SizedBox(width: 20.0),
                        Expanded(
                            child: NewPaymentTextFieldWidget(
                                title: "CVC", placeholder: "***")),
                      ],
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      ButtonWidget(
                          title: "ADD & MAKE PAYMENT",
                          onTap: () {
                            print('Add Card!');
                          }),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
