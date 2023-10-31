import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../../config/routers/app_router.gr.dart';


@RoutePage()
class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        title: const Text("Payment methods"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: const Text('new'),
            onTap: () {
              context.router.push(const NewPaymentMethodView());
            },
          ),
        ],
      ),
    );
  }
}
