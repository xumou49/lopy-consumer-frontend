import 'package:flutter/material.dart';

class TotalPriceDisplay extends StatelessWidget {
  final double totalCost;
  const TotalPriceDisplay(this.totalCost, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            const Text('Total:',
                style: TextStyle(
                  color: Color(0xFFA0A5BA),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(width: 7),
            Text(
              '\$$totalCost',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF181C2E),
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ));
  }
}
