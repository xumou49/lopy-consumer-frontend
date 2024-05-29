import 'package:flutter/material.dart';

class PromotionHeaderWidget extends StatelessWidget {
  const PromotionHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          'Loopy promotion for today!',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: () {
            print('View More tapped!');
          },
          child: const Text(
            'View More',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

}
