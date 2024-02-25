import 'package:flutter/material.dart';

class OrderDetailHeader extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  const OrderDetailHeader(
      {Key? key,
      required this.title1,
      required this.title2,
      required this.title3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TableRow([
      OrderDetailText(title1),
      OrderDetailText(title2),
      OrderDetailText(title3),
    ]);
  }
}

class OrderDetailItem extends StatelessWidget {
  final String name;
  final String quantity;
  final String price;
  const OrderDetailItem(
      {Key? key,
      required this.name,
      required this.quantity,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TableRow([
      OrderDetailText(
        name,
        fontSize: 10,
      ),
      OrderDetailText(
        quantity,
        fontSize: 10,
      ),
      OrderDetailText(
        price,
        fontSize: 10,
      ),
    ]);
  }
}

class _TableRow extends StatelessWidget {
  final List<Widget> textList;
  const _TableRow(this.textList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: textList
            .map((e) => Expanded(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    child: e)))
            .toList());
  }
}

class OrderDetailText extends StatelessWidget {
  final String text;
  final double fontSize;
  const OrderDetailText(this.text, {Key? key, this.fontSize = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ));
  }
}
