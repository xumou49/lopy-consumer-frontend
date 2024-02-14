import 'package:flutter/material.dart';

class OrderStatusIcon extends StatelessWidget {
  final bool isColorFill;
  final Color color;
  final Widget? content;

  const OrderStatusIcon(
      {Key? key,
      this.isColorFill = false,
      this.color = Colors.black,
      this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // default with color fill
    var decoration = ShapeDecoration(shape: const OvalBorder(), color: color);
    if (!isColorFill) {
      decoration = ShapeDecoration(
          shape: OvalBorder(
        side: BorderSide(width: 2, color: color),
      ));
    }
    return Container(
        width: 26, height: 26, decoration: decoration, child: content);
  }
}
