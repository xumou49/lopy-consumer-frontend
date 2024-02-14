import 'package:flutter/material.dart';

class OrderStatusBar extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  const OrderStatusBar(
      {Key? key, this.width = 10, this.height = 2, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color),
    );
  }
}
