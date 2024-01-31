import 'package:flutter/material.dart';

class LoginMethodDivider extends StatelessWidget {
  const LoginMethodDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 312,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _Line()),
            Expanded(
                child: Text('or',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ))),
            Expanded(child: _Line()),
          ],
        ));
  }
}

class _Line extends StatelessWidget {
  const _Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
          ),
        ),
      ),
    );
  }
}