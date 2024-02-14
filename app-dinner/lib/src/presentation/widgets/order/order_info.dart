import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  final num? restaurantId;
  final String? restaurantName;
  final double? totalPrice;
  final String? completeDate;

  const OrderInfo(
      {super.key,
      this.restaurantId = 0,
      this.restaurantName = "Restaurant Name",
      this.totalPrice = 0.0,
      this.completeDate = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              restaurantName!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(completeDate!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                ))
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total (Incl. GST)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                )),
            Text(
              '\$$totalPrice',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 0.11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
