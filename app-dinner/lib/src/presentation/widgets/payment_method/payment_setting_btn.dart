import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routers/app_router.gr.dart';
import '../../cubits/order/order_list_cubit.dart';

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
    return _Button(
      text: "PAY & CONFIRM",
      color: const Color(0xFFFFC5C5),
      onPressed: () {
        context.router.push(PaymentSuccessView(showTrackOrderBtn: true));
      },
    );
  }
}

class TrackOrderBtn extends StatelessWidget {
  const TrackOrderBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Button(
        text: "TRACK ORDER",
        color: const Color(0xFFF18484),
        onPressed: () {
          // call the api and redirect to the order page
          context.router.replace(const ProfileView());
          context.read<OrderListCubit>().getOrderList(1, 10);
          context.router.navigate(const OrderNavigationView());
        });
  }
}

class _Button extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;

  const _Button(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 30;
    return SizedBox(
      height: 50,
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
