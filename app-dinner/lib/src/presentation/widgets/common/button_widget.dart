import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:flutter/material.dart';

// class ButtonWidget extends StatelessWidget {
//   final String title;
//   final Function() onTap;
//   final double? height;
//
//   const ButtonWidget(
//       {Key? key, required this.title, this.height, required this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: SizedBox(
//       height: height ?? 50.0,
//       child: ElevatedButton(
//         style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                     side: const BorderSide(color: Colors.transparent))),
//             backgroundColor: const MaterialStatePropertyAll(
//                 Color.fromRGBO(241, 132, 132, 1))),
//         child: Text(
//           title,
//           style: const TextStyle(
//               fontSize: 14.0, color: Colors.white, fontFamily: 'Montserrat'),
//         ),
//         onPressed: () {
//           onTap();
//         },
//       ),
//     ));
//   }
// }

class ButtonWidget extends StatelessWidget {
  final String text;
  final double height;
  final Color color;
  final Function() onPressed;

  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = const Color(0xFFF18484),
      this.height = 50.0});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 30;
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: onPressed,
        child: TextWidget(
          text: text,
          textColor: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
