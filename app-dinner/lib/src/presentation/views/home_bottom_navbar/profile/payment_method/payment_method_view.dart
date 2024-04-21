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

@RoutePage()
class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GradientAppBar(title: "Payment Methods"),
        body: SingleChildScrollView(
            child: Column(children: [
          MethodSelection(),
          const MethodDataDisplayBoard(),
          const SizedBox(height: 70),
          const TotalPriceDisplay(96.0),
          const SizedBox(height: 15),
          const PayBtn(),
          const SizedBox(height: 15),
        ])));
  }
}

class MethodDataDisplayBoard extends StatelessWidget {
  const MethodDataDisplayBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodSelectorCubit, PaymentMethodSelectorState>(
        builder: (_, state) {
      switch (state.runtimeType) {
        case CreditCardMethodSelector:
          context.read<UserCardListCubit>().getUserCardList(state.type);
          return UserCardDisplay(type: state.type);
        case PaynowMethodSelector:
          return PaynowQRCode();
        case PaypalMethodSelector:
          return EmptyCardDisplay(type: state.type);
        default:
          return EmptyCardDisplay(type: state.type);
      }
    });
  }
}
