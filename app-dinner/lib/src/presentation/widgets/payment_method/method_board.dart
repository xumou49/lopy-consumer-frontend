import 'package:Lopy/src/domain/models/user_card.dart';
import 'package:Lopy/src/presentation/cubits/user_card/user_card_list_cubit.dart';
import 'package:Lopy/src/presentation/widgets/payment_method/payment_setting_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Text(text,
        style: const TextStyle(
          color: Color(0x692D2D2D),
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ));
  }
}

class CardInfo extends StatelessWidget {
  final String? lastFour;
  final int? expMonth;
  final int? expYear;
  final Color backgroundColor;
  final VoidCallback onTap;

  CardInfo({
    Key? key,
    required this.lastFour,
    required this.expYear,
    required this.expMonth,
    required this.onTap,
    this.backgroundColor = const Color(0xFFF7F4F4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 80,
          width: double.infinity,
          child: Card(
            color: backgroundColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '**** **** **** $lastFour',
                          style: const TextStyle(
                            color: Color(0xFF31343D),
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${expMonth.toString().padLeft(2, '0')}/$expYear',
                          style: const TextStyle(
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
                    )),
              ],
            ),
          )),
    );
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

class UserCardDisplay extends StatelessWidget {
  final String type;
  const UserCardDisplay({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<UserCardListCubit>(context),
        builder: (BuildContext context, state) {
          if (state is UserCardListSuccess && state.userCards.isNotEmpty) {
            return ExistedCardDisplay(userCards: state.userCards, type: type);
          }
          return EmptyCardDisplay(type: type);
        });
  }
}

class ExistedCardDisplay extends StatefulWidget {
  final String type;
  final List<UserCard> userCards;

  const ExistedCardDisplay(
      {Key? key, required this.type, required this.userCards})
      : super(key: key);

  @override
  State<ExistedCardDisplay> createState() => _ExistedCardDisplayState();
}

class _ExistedCardDisplayState extends State<ExistedCardDisplay> {
  // primary card will always be the first card from data
  int selectedCardIndex = 0;

  List<Widget> _getCardInfoWidgetList() {
    List<Widget> elementList = [];
    // add card info widget
    for (int i = 0; i < widget.userCards.length; i++) {
      elementList.add(CardInfo(
        backgroundColor: i == selectedCardIndex
            ? const Color(0xFFE1E5FF)
            : const Color(0xFFF7F4F4),
        lastFour: widget.userCards[i].lastFour,
        expMonth: widget.userCards[i].expMonth,
        expYear: widget.userCards[i].expYear,
        onTap: () {
          setState(() {
            selectedCardIndex = i;
          });
        },
      ));
    }
    // spacing & new card button
    elementList.add(const SizedBox(height: 20));
    elementList.add(NewCardBtn(type: widget.type));
    return elementList;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 30;
    return SingleChildScrollView(
        child: SizedBox(
      width: width,
      child: Column(children: _getCardInfoWidgetList()),
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
            EmptyCardLogoText("You can add a card and save it for later"),
          ])),
      const SizedBox(height: 20),
      NewCardBtn(type: type),
    ]);
  }
}
