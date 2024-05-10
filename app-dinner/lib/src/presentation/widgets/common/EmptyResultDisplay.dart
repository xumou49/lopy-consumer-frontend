import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:flutter/material.dart';

class EmptyResultDisplay extends StatelessWidget {
  final String title;
  final String subtitle;
  const EmptyResultDisplay(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 30;
    return Column(children: [
      Container(
          width: width,
          height: 257,
          // decoration: const BoxDecoration(color: Color(0xFFF6F7F8)),
          padding: const EdgeInsets.only(top: 35),
          child: Column(children: [
            const Icon(
              Icons.search_off,
              size: 50,
              color: Color.fromARGB(255, 132, 132, 132),
            ),
            const SizedBox(height: 28),
            TextWidget(
              text: title,
              fontSize: 20,
            ),
            const SizedBox(height: 5),
            TextWidget(
              text: subtitle,
              textAlign: TextAlign.center,
            ),
          ])),
    ]);
  }
}
