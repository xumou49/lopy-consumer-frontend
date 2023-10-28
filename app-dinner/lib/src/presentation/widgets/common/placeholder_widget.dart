import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const PlaceholderWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}
