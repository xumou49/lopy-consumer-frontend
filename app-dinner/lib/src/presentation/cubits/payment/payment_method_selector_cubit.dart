import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/constants/strings.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/api_repository.dart';

part 'payment_method_selector_state.dart';

class PaymentMethodSelectorCubit
    extends BaseCubit<PaymentMethodSelectorState, List<Object>> {
  final ApiRepository _apiRepository;

  PaymentMethodSelectorCubit(this._apiRepository)
      : super(const EmptyMethodSelector(), []);

  Future<void> displaySelectedMethodInfo(String type) async {
    if (isBusy) return;

    await run(() async {
      // fetch the data from server if it is credit card method
      if (type == visaPayment ||
          type == mastercardPayment ||
          type == amexPayment) {
        emit(CreditCardMethodSelector(type: type, data: "card list"));
      }

      if (type == paynowPayment) {
        emit(PaynowMethodSelector(type: type, data: "qrcode data"));
      }

      if (type == paypalPayment) {
        emit(PaypalMethodSelector(type: type, data: "paypal account info"));
      }
    });
  }
}
