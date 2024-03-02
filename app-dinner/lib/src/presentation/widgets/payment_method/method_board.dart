import 'package:Lopy/src/presentation/widgets/payment_method/payment_setting_btn.dart';
import 'package:flutter/material.dart';

class EmptyCardLogo extends StatelessWidget {
  final String imagePath;
  const EmptyCardLogo(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}

class EmptyCardLogoTitle extends StatelessWidget {
  final String text;
  const EmptyCardLogoTitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          color: Color(0xFF31343D),
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ));
  }
}

class EmptyCardLogoText extends StatelessWidget {
  final String text;
  const EmptyCardLogoText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('No master card added',
        style: TextStyle(
          color: Color(0xFF31343D),
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ));
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: double.infinity,
        child: Card(
          color: const Color(0xFFF4F5F7),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned(
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '**** **** **** 1234',
                        style: TextStyle(
                          color: Color(0xFF31343D),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '02/24',
                        style: TextStyle(
                          color: Color(0xFF31343D),
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  right: 20,
                  child: IconButton(
                    iconSize: 20,
                    onPressed: () {
                      print("card delete");
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                  ))
            ],
          ),
        ));
  }
}

class PaynowQRCode extends StatelessWidget {
  const PaynowQRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 30;
    return SizedBox(
      width: width,
      child: Image.asset(
        "lib/src/assets/images/paynow_qrcode.png",
        fit: BoxFit.cover,
      ),
    );
  }
}

class ExistedCardDisplay extends StatelessWidget {
  final String type;
  const ExistedCardDisplay({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 30;
    return SingleChildScrollView(
        child: SizedBox(
      width: width,
      child: Column(
        children: [
          CardInfo(),
          CardInfo(),
          CardInfo(),
          CardInfo(),
          CardInfo(),
          CardInfo(),
          const SizedBox(height: 20),
          NewCardBtn(type: type),
        ],
      ),
    ));
  }
}

class EmptyCardDisplay extends StatelessWidget {
  final String type;
  const EmptyCardDisplay({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 30;
    return Column(children: [
      Container(
          width: width,
          height: 257,
          decoration: const BoxDecoration(color: Color(0xFFF6F7F8)),
          padding: const EdgeInsets.only(top: 35),
          child: const Column(children: [
            EmptyCardLogo("lib/src/assets/images/card_placeholder.png"),
            SizedBox(height: 28),
            EmptyCardLogoTitle("No card added"),
            SizedBox(height: 5),
            EmptyCardLogoText("You can add a mastercard and save it for later"),
          ])),
      const SizedBox(height: 20),
      NewCardBtn(type: type),
    ]);
  }
}
