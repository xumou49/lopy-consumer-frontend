import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:Lopy/src/presentation/widgets/payment_method/payment_setting_btn.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PaymentSuccessView extends StatefulWidget {
  final bool showTrackOrderBtn;
  const PaymentSuccessView({super.key, this.showTrackOrderBtn = true});

  @override
  State<PaymentSuccessView> createState() => _PaymentSuccessViewState();
}

class _PaymentSuccessViewState extends State<PaymentSuccessView> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  _navigateAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.router.pop();
      }
    });
  }

  Widget _showTrackOrderBtn() {
    if (widget.showTrackOrderBtn) {
      return const TrackOrderBtn();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 220),
          child: Stack(children: [
            Positioned(
                child: SizedBox(
                    height: 200,
                    child: Image.asset(
                        "lib/src/assets/images/payment_success_background.png",
                        fit: BoxFit.contain))),
            Positioned(
                bottom: 0,
                left: 15,
                child: SizedBox(
                    height: 180,
                    child: Image.asset(
                        "lib/src/assets/images/lopy_payment_success.png",
                        fit: BoxFit.contain)))
          ]),
        ),
        // image
        const SizedBox(height: 25),
        const TextWidget(
          text: "Congratulations!",
          fontSize: 24,
          textColor: Color(0xFF111A2C),
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 8),
        const TextWidget(
          textAlign: TextAlign.center,
          text: "You successfully maked a payment, \n enjoy our service!",
          textColor: Color(0xFF525C67),
          fontSize: 14,
        ),
        const SizedBox(height: 200),
        _showTrackOrderBtn(),
      ]),
    ));
  }
}
