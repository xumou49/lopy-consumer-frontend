import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final double? height;

  const ButtonWidget(
      {Key? key, required this.title, this.height, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: height ?? 50.0,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(color: Colors.transparent))),
            backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(241, 132, 132, 1))),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 14.0, color: Colors.white, fontFamily: 'Montserrat'),
        ),
        onPressed: () {
          onTap();
        },
      ),
    ));
  }
}
