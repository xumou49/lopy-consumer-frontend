import 'dart:math';

import 'package:flutter/material.dart';

class NewPaymentTextFieldWidget extends StatelessWidget {
  final String title;
  final String placeholder;

  const NewPaymentTextFieldWidget(
      {Key? key, required this.title, required this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
              fontSize: 12.0, color: Colors.black54, fontFamily: 'Montserrat'),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100.0,
          child: TextField(
            decoration: InputDecoration(
              hintText: placeholder,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              filled: true,
              fillColor: const Color.fromRGBO(240, 245, 250, 1),
              contentPadding: const EdgeInsets.all(20),
            ),
          ),
        )
      ],
    );
  }
}
