import 'package:flutter/material.dart';

class FavouriteHeaderWidget extends StatelessWidget {
  const FavouriteHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Your favourite cuisines',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
