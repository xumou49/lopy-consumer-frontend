import 'package:Lopy/src/presentation/cubits/payment/payment_method_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardItem {
  final String imagePath;
  final String title;
  final String name;
  const CardItem(
      {required this.imagePath, required this.title, required this.name});
}

class MethodSelection extends StatefulWidget {
  int _selectedIdx = 0;
  MethodSelection({Key? key}) : super(key: key);

  @override
  _MethodSelectionState createState() => _MethodSelectionState();
}

class _MethodSelectionState extends State<MethodSelection> {
  List<CardItem> items = [
    // const CardItem(
    //     imagePath: "lib/src/assets/images/paynow.png",
    //     title: "Paynow",
    //     name: "paynow"),
    const CardItem(
        imagePath: "lib/src/assets/images/mastercard.png",
        title: "Matercard",
        name: "mastercard"),
    const CardItem(
        imagePath: "lib/src/assets/images/visa.png",
        title: "Visa",
        name: "visa"),
    // const CardItem(
    //     imagePath: "lib/src/assets/images/paypal.png",
    //     title: "Paypal",
    //     name: "paypal"),
    const CardItem(
        imagePath: "lib/src/assets/images/amex.png",
        title: "Amex",
        name: "amex"),
  ];

  Widget _itemBuilder(
          {required BuildContext context,
          required int idx,
          required CardItem item}) =>
      Column(children: [
        InkWell(
          child: _buildCard(idx, item.imagePath),
          onTap: () {
            if (widget._selectedIdx == idx) {
              return;
            }
            setState(() {
              context
                  .read<PaymentMethodSelectorCubit>()
                  .displaySelectedMethodInfo(item.name);
              print("idx tapper: ${widget._selectedIdx}");
              widget._selectedIdx = idx;
            });
          },
        ),
        CardSelectionText(item.title),
      ]);

  Widget _buildCard(int idx, String imagePath) {
    return SizedBox(
        width: 95,
        height: 82,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // the boxed
            Positioned(
                top: 5,
                child: Container(
                    width: 85,
                    height: 72,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: idx == widget._selectedIdx
                          ? Border.all(
                              width: 2.0, color: const Color(0xFFF18484))
                          : Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: const Color(0xFFF0F5FA),
                    ),
                    child: SizedBox(
                      height: 20,
                      child: Image.asset(imagePath, fit: BoxFit.cover),
                    ))),
            Positioned(
                top: 0,
                right: 0,
                child: idx == widget._selectedIdx
                    ? SizedBox(
                        height: 20,
                        child: Image.asset(
                            "lib/src/assets/images/card_selected.png",
                            fit: BoxFit.cover),
                      )
                    : const SizedBox())
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(15),
            itemBuilder: (ctx, idx) =>
                _itemBuilder(context: context, idx: idx, item: items[idx]),
            separatorBuilder: (ctx, _) => const SizedBox(width: 15),
            itemCount: items.length));
  }
}

class CardSelectionText extends StatelessWidget {
  final String text;
  const CardSelectionText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF464E57),
        fontSize: 12,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
