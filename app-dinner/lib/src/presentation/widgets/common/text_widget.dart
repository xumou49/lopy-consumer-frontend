import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? textOverflow;
  final String? fontFamily;
  final TextAlign? textAlign;
  final int? maxLines;

  const TextWidget(
      {Key? key,
      required this.text,
      this.textColor,
      this.backgroundColor,
      this.fontFamily,
      this.fontWeight,
      this.fontSize,
      this.textOverflow,
      this.maxLines,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      style: TextStyle(
        backgroundColor: backgroundColor ?? Colors.transparent,
        color: textColor ?? Colors.black,
        fontFamily: fontFamily ?? 'Montserrat',
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 12.0,
        overflow: textOverflow,
      ),
    );
  }
}
