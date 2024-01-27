import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {

  final String content;
  final Color textColor;
  final Color backgroundColor;
  final String logoPath;
  final Function()? onTap;

  const LoginButton(this.content, this.logoPath,
      {Key? key,
        required this.onTap,
        this.textColor = Colors.black,
        this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
            onTap: widget.onTap,
            child: Container(
                width: 312,
                height: 45,
                decoration: ShapeDecoration(
                  color: widget.backgroundColor,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  // logo
                  Positioned(
                    left: 55,
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      widget.logoPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // text
                  Positioned(
                    left: 110,
                    child: Text(widget.content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        )),
                  ),
                ]))));
  }
}