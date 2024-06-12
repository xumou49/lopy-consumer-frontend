import 'package:Lopy/src/domain/models/user_card.dart';
import 'package:Lopy/src/presentation/cubits/user_card/user_card_cubit.dart';
import 'package:Lopy/src/presentation/cubits/user_card/user_card_list_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/dialog_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:Lopy/src/presentation/widgets/payment_method/payment_setting_btn.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

import '../../../config/routers/app_router.gr.dart';
import '../../../domain/models/cart.dart';
import '../../cubits/cart/cart_list_cubit.dart';
import '../../cubits/order/order_place_cubit.dart';

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
  final num? id;
  final String? lastFour;
  final String? brand;
  final int? expMonth;
  final int? expYear;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool isPay;
  const CardInfo({
    Key? key,
    required this.id,
    required this.lastFour,
    required this.brand,
    required this.expYear,
    required this.expMonth,
    required this.onTap,
    this.isPay = false,
    this.backgroundColor = const Color(0xFFF7F4F4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double positionSize = isPay ? 65 : 20;
    List<Widget> cardDetails = [
      Positioned(
          left: positionSize,
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
    ];
    List<Widget> deleteCard = [
      Positioned(
          right: 20,
          child: IconButton(
            iconSize: 20,
            onPressed: () {
              showConfirmationDialog(context, "Delete Card",
                  "Are you sure you want to delete this card?", () {
                    context.read<UserCardCubit>().deleteUserCard(id!);
                  });
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.grey,
            ),
          )),
    ];
    Map<String, String> cardImageMap = {
      'visa': 'lib/src/assets/images/visa.png',
      'mastercard': 'lib/src/assets/images/mastercard.png',
      'amex': 'lib/src/assets/images/mastercard.png',
    };
    if (isPay) {
      cardDetails = [
        ...[
          Positioned(left: 10,
              child: Image.asset(
                  cardImageMap[brand]!, fit: BoxFit.cover)),
        ], ...cardDetails];
    } else {
      cardDetails = [
        ...cardDetails,
        ...deleteCard
      ];
    }

    return InkWell(
      onTap: onTap,
      child: SizedBox(
          height: 80,
          width: double.infinity,
          child: Card(
            color: backgroundColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ...cardDetails
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
  final bool isPay;
  final List<Cart> carts;

  const UserCardDisplay({
    Key? key,
    required this.type,
    this.isPay = false,
    List<Cart>? carts,
  })  : carts = isPay ? (carts ?? const []) : const [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<UserCardListCubit>(context),
        builder: (BuildContext context, state) {
          if (state is UserCardListSuccess && state.userCards.isNotEmpty) {
            if (isPay) {
              return Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExistedCardDisplay(
                            userCards: state.userCards,
                            type: type,
                            isPay: isPay,
                            carts: carts)
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return ExistedCardDisplay(
                userCards: state.userCards,
                type: type,
                isPay: isPay,
                carts: carts
              );
            }
          }
          return EmptyCardDisplay(type: type);
        });
  }
}

class ExistedCardDisplay extends StatefulWidget {
  final String type;
  final List<UserCard> userCards;
  final bool isPay;
  final List<Cart> carts;

  const ExistedCardDisplay(
      {Key? key, required this.type,
        required this.userCards,
        this.isPay = false,
        List<Cart>? carts,
      })
      : carts = isPay ? (carts ?? const []) : const [],
        super(key: key);


  @override
  State<ExistedCardDisplay> createState() => _ExistedCardDisplayState();
}

class _ExistedCardDisplayState extends State<ExistedCardDisplay> {
  // primary card will always be the first card from data
  int selectedCardIndex = 0;
  int cardId = 0;

  double getTotalPrice() {
    return widget.carts.fold(
        0, (total, item) => total + (item.quantity * item.price));
  }

  String getTotalPriceString() {
    return getTotalPrice().toStringAsFixed(2);
  }

  List<Widget> _getCardInfoWidgetList() {
    List<Widget> elementList = [];
    cardId = widget.userCards[0].id!;
    // add card info widget
    elementList.add(
        Center(
            child: Text(
                'Total price: ${getTotalPriceString()}',
              style: const TextStyle(fontSize: 24.0),)
        )
    );
    elementList.add(const SizedBox(height: 15));
    for (int i = 0; i < widget.userCards.length; i++) {
      elementList.add(CardInfo(
        id: widget.userCards[i].id,
        backgroundColor: i == selectedCardIndex
            ? const Color(0xFFE1E5FF)
            : const Color(0xFFF7F4F4),
        lastFour: widget.userCards[i].lastFour,
        expMonth: widget.userCards[i].expMonth,
        expYear: widget.userCards[i].expYear,
        onTap: () {
          setState(() {
            selectedCardIndex = i;
            cardId = widget.userCards[i].id!;
          });
        },
        brand: widget.userCards[i].brand,
        isPay: widget.isPay,
      ));
    }
    // spacing & new card button
    elementList.add(const SizedBox(height: 20));
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    if (widget.isPay) {
      final localACartCubit = BlocProvider.of<CartListCubit>(context);
      elementList.add(
          Row(

            // alignment: Alignment.center,
            children: [
              const PlaceholderWidget(width: 40,),
              Positioned(
                left: 20,
                child: ElevatedButton(
                  style: style,
                  child: const Text('Back'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const PlaceholderWidget(
            width: 140,
          ),
          Positioned(
              right: 20,
              child: ElevatedButton(
                style: style,
                child: const Text('Pay'),
                onPressed: () {
                  context
                      .read<OrderPlaceCubit>()
                      .orderPlace(widget.carts.first.restaurantId, cardId, widget.carts);
                  Center(
                    child: ShowLoadingForTwoSeconds(),
                  );
                  Future.delayed(const Duration(milliseconds: 2000), () {

                    showToast("Order placed successfully");
                    localACartCubit.clearCart(widget.carts.first.restaurantId);
                    context.navigateTo(const OrderNavigationView());
                  });
                },
                  )),
            ],
          )
      );
    } else {
      elementList.add(NewCardBtn(type: widget.type));
    }
    return elementList;
  }

  @override
  Widget build(BuildContext buildContext) {
    var width = MediaQuery.of(context).size.width - 30;
    return BlocListener<UserCardCubit, UserCardState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case UserCardDeleteSuccess:
              context.read<UserCardListCubit>().getUserCardList(widget.type);
              showToast("Delete card successfully!");
              break;
            case UserCardDeleteFailed:
              showToast(
                  "Fail to delete card! Please contact administrator for assistance");
              break;
            default:
              break;
          }
        },
        child: SingleChildScrollView(
            child: SizedBox(
          width: width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _getCardInfoWidgetList()),
        )));
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


class ShowLoadingForTwoSeconds extends StatefulWidget {
  @override
  _ShowLoadingForTwoSecondsState createState() => _ShowLoadingForTwoSecondsState();
}

class _ShowLoadingForTwoSecondsState extends State<ShowLoadingForTwoSeconds> {
  bool _showLoading = true;

  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showLoading
        ? CircularProgressIndicator() // Show loading indicator
        : Text('Loading Complete'); // Replace with your desired widget after 2 seconds
  }
}