import 'package:Lopy/src/presentation/cubits/payment/payment_method_selector_cubit.dart';
import 'package:Lopy/src/presentation/cubits/user_card/user_card_list_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/appbar_widget.dart';
import 'package:Lopy/src/presentation/widgets/payment_method/method_board.dart';
import 'package:Lopy/src/presentation/widgets/payment_method/method_selection_list.dart';
import 'package:Lopy/src/presentation/widgets/payment_method/payment_price.dart';
import 'package:Lopy/src/presentation/widgets/payment_method/payment_setting_btn.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/models/cart.dart';

@RoutePage()
class PaymentMethodView extends StatelessWidget {
  final bool isFromCheckout;
  final double totalPrice;

  const PaymentMethodView(
      {super.key, this.isFromCheckout = false, this.totalPrice = 0.0});

  List<Widget> _getWidgets() {
    if (isFromCheckout) {
      return [
        MethodSelection(),
        const MethodDataDisplayBoard(carts: [],),
        const SizedBox(height: 70),
        TotalPriceDisplay(totalPrice),
        const SizedBox(height: 15),
        const PayBtn(),
        const SizedBox(height: 15),
      ];
    } else {
      return [
        MethodSelection(),
        const MethodDataDisplayBoard(),
        const SizedBox(height: 70),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GradientAppBar(title: "Payment Methods"),
        body: SingleChildScrollView(
          child: Column(children: _getWidgets()),
        ));
  }
}

class MethodDataDisplayBoard extends StatelessWidget {
  final bool isPay;
  final List<Cart> carts;

  const MethodDataDisplayBoard({
    Key? key,
    this.isPay = false,
    this.carts = const [],
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodSelectorCubit, PaymentMethodSelectorState>(
        builder: (_, state) {
      switch (state.runtimeType) {
        case CreditCardMethodSelector:
          String type = !isPay ? state.type : "";
          // context.read<UserCardListCubit>().getUserCardList(state.type);
          context.read<UserCardListCubit>().getUserCardList(type);
          // return UserCardDisplay(type: state.type);
          return UserCardDisplay(type: type, isPay: isPay, carts: carts,);
        case PaynowMethodSelector:
          return const PaynowQRCode();
        case PaypalMethodSelector:
          return EmptyCardDisplay(type: state.type);
        default:
          return EmptyCardDisplay(type: state.type);
      }
    });
  }
}
