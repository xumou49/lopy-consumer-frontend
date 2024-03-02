import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NewCardBtn extends StatelessWidget {
  final String type;
  const NewCardBtn({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 30;
    return SizedBox(
        height: 60,
        width: width,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFF0F5FA), width: 2.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            context.router.push(NewPaymentMethodView(type: type));
          },
          child:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.add,
              color: Color(0xFFA95C5C),
            ),
            Text(
              'ADD NEW',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFA95C5C),
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
          ]),
        ));
  }
}

class PayBtn extends StatelessWidget {
  const PayBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 30;
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFC5C5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {},
        child: const Text(
          'PAY & CONFIRM',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
