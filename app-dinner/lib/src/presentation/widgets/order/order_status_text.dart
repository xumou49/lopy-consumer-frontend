import 'package:flutter/material.dart';

class OrderStatusText extends StatelessWidget {
  final String text;
  const OrderStatusText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          height: 0.16,
        ));
  }
}
